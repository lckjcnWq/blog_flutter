import 'package:blog_app/common/Constants.dart';
import 'package:blog_app/utils/ImageUtils.dart';
import 'package:blog_app/router/tabclass/BlogFragment.dart';
import 'package:blog_app/router/tabclass/ClassFragment.dart';
import 'package:blog_app/router/tabclass/CommentFragment.dart';
import 'package:blog_app/router/tabclass/LinkFragment.dart';
import 'package:blog_app/router/tabclass/TagsFragment.dart';
import 'package:flutter/material.dart';

class ClassPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new Page();
  }
}

class Page extends State<ClassPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(length: 5,
          child: Scaffold(
            appBar: AppBar(
              title: Text(Constants.fClassManager),
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(icon: ImageUtils.getTabImage("icon_blog.png"),text: Constants.blogManager,),
                  Tab(icon: ImageUtils.getTabImage("icon_comment.png"),text: Constants.commentManager,),
                  Tab(icon: ImageUtils.getTabImage("icon_classify.png"),text: Constants.classManager,),
                  Tab(icon: ImageUtils.getTabImage("icon_tag.png"),text: Constants.tagManager,),
                  Tab(icon: ImageUtils.getTabImage("icon_link.png"),text:Constants.linkManager,),
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                BlogFragment(),
                CommentFragment(),
                ClassFragment(),
                TagsFragment(),
                LinkFragment(),
              ],
            ),
          )),
    );
  }
}