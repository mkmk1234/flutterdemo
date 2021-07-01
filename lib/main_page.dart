import 'package:first_tool/home/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Mine/my_pagee.dart';

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {

  int _currentIndex = 0;
  late List<Widget> _pageList;
  late List<List<Widget>> _tabImages;
  final List<String> _appBarTitles = <String>['主页', '我的'];
  final PageController _pageController = PageController();

  Widget _buildTabText(int curIndex) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Text(_appBarTitles[curIndex]),
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _getTabIcon(int curIndex) {
    if(curIndex == _currentIndex){
      return _tabImages[curIndex][1];
    }
    return _tabImages[curIndex][0];
  }

  @override
  void initState() {
    super.initState();
    _pageList = <Widget>[
      const HomePage(),
      MyPage()
    ];

    _tabImages = <List<Widget>>[
      <Widget>[
        Icon(
          Icons.home,
          color: Colors.grey,
        ),
        Icon(
          Icons.home,
          color: Colors.blue,
        ),
      ],
      <Widget>[
        Icon(
          Icons.flutter_dash,
          color: Colors.grey,
        ),
        Icon(
          Icons.flutter_dash,
          color: Colors.blue,
        ),
      ]
    ];

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //底部导航组件
      //用于展示有多个模块时
      bottomNavigationBar: BottomNavigationBar(
        // ignore: always_specify_types
        items:List.generate(
            _appBarTitles.length, (int i) => BottomNavigationBarItem(
              icon: _getTabIcon(i),
              title: _buildTabText(i),
            )),
        currentIndex: _currentIndex,
        fixedColor: Colors.blue,
        onTap: (int index){
          _pageController.jumpToPage(index);
        },
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _pageList,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<Widget>('_pageList', _pageList));
  }
}