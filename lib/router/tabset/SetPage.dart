import 'package:blog_app/common/Constants.dart';
import 'package:blog_app/utils/ImageUtils.dart';
import 'package:blog_app/router/tabset/LogOutFragment.dart';
import 'package:blog_app/router/tabset/PasswordChangeFragment.dart';
import 'package:blog_app/router/tabset/SystemChangeFragment.dart';
import 'package:flutter/material.dart';

class SetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new Page();
  }
}

class Page extends State<SetPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: Text(Constants.setManager),
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    icon: ImageUtils.getTabImage("icon_system.png"),
                    text: Constants.systemChange,
                  ),
                  Tab(
                    icon: ImageUtils.getTabImage("icon_password.png"),
                    text: Constants.passwordChange,
                  ),
                  Tab(
                    icon: ImageUtils.getTabImage("icon_out.png"),
                    text: Constants.layout,
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                SystemChangeFragment(),
                PasswordChangeFragment(),
                LogOutFragment(),
              ],
            ),
          )),
    );
  }
}
