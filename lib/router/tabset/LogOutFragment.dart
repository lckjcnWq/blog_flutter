import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LogOutFragment extends StatefulWidget {
  @override
  LogOutFragmentState createState() {
    return new LogOutFragmentState();
  }
}
class LogOutFragmentState extends State<LogOutFragment>{

  @override
  void initState() {
    super.initState();
    SystemNavigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: Text("安全退出"),
      ),
    );
  }

}