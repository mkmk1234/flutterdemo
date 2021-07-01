import 'dart:async';
import 'dart:io';
import 'package:first_tool/login/login_page.dart';
import 'package:first_tool/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_easyloading/flutter_easyloading.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:oktoast/oktoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'mine/my_pagee.dart';


Future<void> _reportError(dynamic error, dynamic stackTrace) async {
  print('catch error=');
  print(error);
}

Future<void> test(ZoneDelegate parent, Zone zone,String line) async {
  parent.print(zone,'打印日志收集$line');
}

Future<void> test2(String line) async {
  print('打印日志收集2:$line');
}

void main() {

  EasyLoading.instance
    ..maskType = EasyLoadingMaskType.clear;

  FlutterError.onError = (FlutterErrorDetails details) async {
//    FlutterError.dumpErrorToConsole(details);
//     Zone.current.handleUncaughtError(details.exception, details.stack);
  };

  runZonedGuarded<Future<void>>(() async {
    runApp(MyApp());
  },(dynamic error, StackTrace stackTrace) async {
    //异常处理
    await _reportError(error, stackTrace);
  }, zoneSpecification: ZoneSpecification(
    //输出打印日志
    print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
//        test2(line);
      test(parent, zone, line);
//        parent.print(zone, "打印收集: $line");
    },
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(720, 1280),
      builder: () =>OKToast(
          child: FlutterEasyLoading(
              child: MaterialApp(
                title: 'Flutter Demo',
                theme: ThemeData(
                    primarySwatch: Colors.blue,
                    scaffoldBackgroundColor: Colors.white,
                    hintColor: Colors.black12,
                    dividerColor: Colors.grey
                ),
                home: const MyHomePage(),
                routes: <String, WidgetBuilder>{
                  '/Login': (BuildContext context) =>  LoginPage(),
                  '/Home': (BuildContext context) =>  MainPage(),
                  '/Main': (BuildContext context) => MyPage(),

                },
                  //路由管理
             onGenerateRoute:(RouteSettings settings) {

             })
          ),
          textPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          position: ToastPosition.bottom
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const  MyHomePage() : super();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // ignore: non_constant_identifier_names
  final String SP_LOGIN_STATUS = "sp_login_status";

  Future<void> startTime() async{
    const Duration duration = Duration(seconds: 5);
    Timer(duration, navigationPage);
  }
  Future<void> navigationPage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? hasLogin = sharedPreferences.getBool("SP_LOGIN_STATUS");
    if(hasLogin!=null&&hasLogin){
      Navigator.pushNamed(context, '/Home');
    }else {
      Navigator.pushNamed(context, '/Login');
    }

  }

  @override
  void initState() {
    // TODO(initState): implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
          color: Colors.white,

          child: ConstrainedBox(
            child: Image.asset(
              "assets/images/loading.png",
              fit: BoxFit.cover,
            ),
            constraints: new BoxConstraints.expand(),
          )
      )
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
