import 'package:blog_app/common/Constants.dart';
import 'package:blog_app/entitiy/BlogEntity.dart';
import 'package:blog_app/http/HttpGo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:base_library/base_library.dart';

class BlogFragment extends StatefulWidget {
  @override
  BlogFragmentState createState() {
    return new BlogFragmentState();
  }
}

class BlogFragmentState extends State<BlogFragment> {
  ScrollController _scrollController = new ScrollController();
  bool isLoading = false;
  List<BlogDataList> names = new List<BlogDataList>();

  void _getMoreData() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });

      FormData formData = FormData.from({'page': 1, 'limit': 10});
      HttpGo.getInstance().get(Constants.blogLists, (data) {
        Map<String, dynamic> json = jsonDecode(data);
        BlogEntity newBean = BlogEntity.fromJson(json);
        setState(() {
          isLoading = false;
          names.clear();
          names.addAll(newBean.data.xList);
        });
      }, params: formData);
    }
  }

  @override
  void initState() {
    this._getMoreData();
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _buildList(),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget _buildList() {
    return ListView.separated(
      itemCount: names.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == names.length) {
          return _buildProgressIndicator();
        } else {
          return new Container(
            padding: new EdgeInsets.all(10.0),
            child: new Column(
              children: <Widget>[
                new ListTile(
                  title: Text((names[index].blogTitle)),
                  subtitle: Text((names[index].blogTags)),
                  onTap: () {
                    //单击
                    LogUtil.e("item:" + names[index].blogTitle);
                  },
                  onLongPress: () {
                    //长按
                  },
                ),
              ],
            ),
          );
        }
      },
      separatorBuilder: (BuildContext context, int index) {
        return new Divider(
          height: 1.0,
          color: Colors.blue,
        );
      },
      controller: _scrollController,
    );
  }
}
