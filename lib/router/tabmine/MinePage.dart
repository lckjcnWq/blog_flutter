import 'package:blog_app/common/Constants.dart';
import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new Page();
  }
}

class Page extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  Widget layout(BuildContext context) {
    return new Scaffold(
        appBar: buildAppBar(context),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                Constants.noIntroductions,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              )
            ],
          ),
        ));
  }

  Widget buildAppBar(BuildContext context) {
    return new AppBar(title: const Text(Constants.personalIntroduction));
  }
}
