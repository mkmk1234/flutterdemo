import 'package:first_tool/common/toast.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage>{
  late TextEditingController loginController;
  late TextEditingController resController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginController = TextEditingController(text: '');
    resController = TextEditingController(text: '');

  }
  Future<void> navigationPage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("SP_LOGIN_STATUS",true);
    Navigator.pushNamed(context, '/Home');
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: new Text("登录"),
        //去除左边的返回按钮
        leading: Text(""),
      ),
      body: new Center(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width:300,
                  margin:const EdgeInsets.fromLTRB(50,50,50,50),
                  child: TextField(
                    autofocus: true,
                    controller: loginController,
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    obscureText: false,
                    decoration: InputDecoration(
                        hintText: '账号',
                        hintStyle: TextStyle(
                          color: Colors.black12,
                          fontSize: 14,
                        ),
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        //位于左侧的一个图标
                        prefixIcon: Icon(Icons.person),
                        //输入框的底部风格线
                        //去除下滑线在这里做
                        border: InputBorder.none,
                        //外边框的颜色
                        //非获取焦点时
                        enabledBorder: OutlineInputBorder(
                          //外边框的弧度
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.0),
                                topRight: Radius.circular(5.0),
                                bottomLeft: Radius.circular(5.0),
                                bottomRight: Radius.circular(5.0)),
                            //外边框的颜色和宽度
                            borderSide: BorderSide(
                                color: Colors.black26,
                                width: 1
                            )
                        ),
                        //获取焦点时
                        focusedBorder: OutlineInputBorder(
                          //外边框的弧度
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.0),
                                topRight: Radius.circular(5.0),
                                bottomLeft: Radius.circular(5.0),
                                bottomRight: Radius.circular(5.0)),
                            //外边框的颜色和宽度
                            borderSide: BorderSide(
                                color: Colors.black26,
                                width: 1
                            )
                        )
                    ),
                  ),
                ),
                Container(
                  width:300,
                  margin:const EdgeInsets.fromLTRB(50,0,50,30),
                  child:  TextField(
                    obscureText: true,
                    controller: resController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        hintText: '密码',
                        hintStyle: TextStyle(
                          color: Colors.black12,
                          fontSize: 14,
                        ),
                        border: InputBorder.none,
                        //外边框的颜色
                        //非获取焦点时
                        enabledBorder: OutlineInputBorder(
                          //外边框的弧度
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.0),
                                topRight: Radius.circular(5.0),
                                bottomLeft: Radius.circular(5.0),
                                bottomRight: Radius.circular(5.0)),
                            //外边框的颜色和宽度
                            borderSide: BorderSide(
                                color: Colors.black26,
                                width: 1
                            )
                        ),
                        //获取焦点时
                        focusedBorder: OutlineInputBorder(
                          //外边框的弧度
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.0),
                                topRight: Radius.circular(5.0),
                                bottomLeft: Radius.circular(5.0),
                                bottomRight: Radius.circular(5.0)),
                            //外边框的颜色和宽度
                            borderSide: BorderSide(
                                color: Colors.black26,
                                width: 1
                            )
                        )
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  height: 50,
                  child:ElevatedButton(
                    onPressed: () {
                      if(loginController.text.isEmpty|| resController.text.isEmpty){
                        Toast.show("账号密码不能为空");
                        return;
                      }
                      navigationPage();
                    },
                    style: ButtonStyle(
                        textStyle:MaterialStateProperty.all(
                            TextStyle(

                            )
                        )
                    ),
                    child: const Text('登陆'),
                  ),
                ),
                Container(
                  width: 200,
                  height: 50,
                  margin:const EdgeInsets.fromLTRB(50,30,50,0),
                  child:ElevatedButton(
                    onPressed: () {
                      print('点击了ElevatedButton');
                    },
                    style: ButtonStyle(
                        textStyle:MaterialStateProperty.all(
                            TextStyle(

                            )
                        )
                    ),
                    child: const Text('注册'),
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}