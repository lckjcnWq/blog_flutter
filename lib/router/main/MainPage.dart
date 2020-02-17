import 'package:blog_app/utils/ImageUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:blog_app/router/tabclass/ClassPage.dart';
import 'package:blog_app/router/tabdashboard/HomePage.dart';
import 'package:blog_app/router/tabmine/MinePage.dart';
import 'package:blog_app/router/tabset/SetPage.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new MainPageWidget(),
    );
  }
}

class MainPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MainPageState();
  }
}

class MainPageState extends State<MainPageWidget> {
  int _tabIndex = 0;
  var tabImages;
  var appBarTitles = ['DashBoard', '分类', "设置", '我的'];
  var _pageList;

  /*
   * 根据选择获得对应的normal或是press的icon
   */
  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  /*
   * 获取bottomTab的颜色和文字
   */
  Text getTabTitle(int curIndex) {
    if (curIndex == _tabIndex) {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: const Color(0xff1296db)));
    } else {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: const Color(0xff515151)));
    }
  }

  void initData() {
    /*
     * 初始化选中和未选中的icon
     */
    tabImages = [
      [
        ImageUtils.getTabImage('icon_edit.png'),
        ImageUtils.getTabImage('icon_edit_tab.png')
      ],
      [
        ImageUtils.getTabImage('icon_class.png'),
        ImageUtils.getTabImage('icon_class_tab.png')
      ],
      [
        ImageUtils.getTabImage('icon_set.png'),
        ImageUtils.getTabImage('icon_set_tab.png')
      ],
      [
        ImageUtils.getTabImage('icon_my.png'),
        ImageUtils.getTabImage('icon_my_tab.png')
      ]
    ];
    _pageList = [
      new HomePage(),
      new ClassPage(),
      new SetPage(),
      new MinePage(),
    ];
  }

  @override
  void initState() {
    super.initState();
    initHttp();
  }

  @override
  Widget build(BuildContext context) {
    //初始化数据
    initData();
    return Scaffold(
        body: _pageList[_tabIndex],
        bottomNavigationBar: new BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
                icon: getTabIcon(0), title: getTabTitle(0)),
            new BottomNavigationBarItem(
                icon: getTabIcon(1), title: getTabTitle(1)),
            new BottomNavigationBarItem(
                icon: getTabIcon(2), title: getTabTitle(2)),
            new BottomNavigationBarItem(
                icon: getTabIcon(3), title: getTabTitle(3)),
          ],
          type: BottomNavigationBarType.fixed,
          //默认选中首页
          currentIndex: _tabIndex,
          iconSize: 24.0,
          //点击事件
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
        ));
  }

  void initHttp() {
//    打开debug模式.
//    DioUtil.openDebug();
//    Options options = DioUtil.getDefOptions();
//    options.baseUrl = Constants.baseUrl;
//    HttpConfig config = new HttpConfig(options: options);
//    DioUtil().setConfig(config);
  }
}
