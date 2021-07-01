import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:first_tool/common/toast.dart';

class HomePage extends StatefulWidget {
  const HomePage() : super();
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin<HomePage>{

  final List<IconData> list = <IconData>[Icons.home,Icons.gps_fixed_rounded,Icons.hdr_off_rounded,
    Icons.hdr_on_rounded,Icons.help_center_sharp,Icons.help_center,Icons.help,Icons.height_outlined
    ,Icons.height_rounded,Icons.height,Icons.hiking_rounded,Icons.hiking_sharp,Icons.image_outlined,Icons.image_search,];


  @override
  void initState() {
    // TODO(initState): implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO(dispose): implement dispose
    super.dispose();
  }

  void clickEvent(BuildContext context,String title) async{

  }

  @override
  Widget build(BuildContext context) {
    // TODO(build): implement build
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          title:const Text(
            '首页',
          )
        ),
        body: SafeArea(
          child: Center(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, //每行三列
                      childAspectRatio: 1.0 //显示区域宽高相等
                  ),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Icon(list[index],size:50);
                  }
              ))
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
