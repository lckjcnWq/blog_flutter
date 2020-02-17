import 'package:blog_app/utils/TotalUtils.dart';
import 'package:blog_app/common/Constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:base_library/base_library.dart';

class PasswordChangeFragment extends StatefulWidget {
  @override
  PasswordChangeFragmentRouteState createState() {
    return new PasswordChangeFragmentRouteState();
  }
}

class PasswordChangeFragmentRouteState extends State<PasswordChangeFragment> {
  GlobalKey basicInfoFormKey = new GlobalKey<FormState>();
  GlobalKey editPassWordFormKey = new GlobalKey<FormState>();
  String _loginName,_loginUserName,_oldPwd,_newPwd;

  //基本信息
  TextEditingController loginNameCr = new TextEditingController();
  TextEditingController loginUserNameCr = new TextEditingController();

  //修改密码
  TextEditingController oldPwdCr = new TextEditingController();
  TextEditingController newPwdCr = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: new Column(
          children: <Widget>[
            //基本信息
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: CommonUtils.getTitle("基本信息"),
            ),
            Form(
              key: basicInfoFormKey,
              autovalidate: true,
              child: Column(
                children: <Widget>[
                  TextFormField(autofocus: true,
                  controller: loginNameCr,decoration: InputDecoration(
                      labelText: "登录昵称",
                    ),
                  onSaved: (val){
                    _loginName=val;
                  },),
                  TextFormField(autofocus: true,
                  controller: loginUserNameCr,decoration: InputDecoration(
                      labelText: "昵称",
                    ),
                  onSaved: (val){
                    _loginUserName=val;
                  },),
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: RaisedButton(
                          padding: EdgeInsets.all(15.0),
                          child: Text(Constants.changeSure),
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onPressed: () {
                            if ((basicInfoFormKey.currentState as FormState)
                                .validate()) {
                              FormData formData=new FormData.from({
                                "loginUserName":_loginName,
                                "nickName":_loginUserName,
                              });
//                              DioUtil().requestR(Method.post, Constants.basicInfoInterface,data: formData);
                              Fluttertoast.showToast(msg: "基本信息更改成功");
                            }
                          },
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //修改密码
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: CommonUtils.getTitle("修改密码"),
            ),
            Form(
              key: editPassWordFormKey,
              autovalidate: true,
              child: Column(
                children: <Widget>[
                  TextFormField(autofocus: true,
                    controller: oldPwdCr,decoration: InputDecoration(
                      labelText: "原密码",
                    ),
                    onSaved: (val){
                      _oldPwd=val;
                    },),
                  TextFormField(autofocus: true,
                    controller: newPwdCr,decoration: InputDecoration(
                      labelText: "新密码",
                    ),
                    onSaved: (val){
                      _newPwd=val;
                    },),
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: RaisedButton(
                          padding: EdgeInsets.all(15.0),
                          child: Text(Constants.changeSure),
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onPressed: () {
                            if ((editPassWordFormKey.currentState as FormState)
                                .validate()) {
                              FormData formData=new FormData.from({
                                "originalPassword":_oldPwd,
                                "nickName":_newPwd,
                              });
//                              DioUtil().requestR(Method.post, Constants.editPwdInterface,data: formData);
                              Fluttertoast.showToast(msg: "密码更改成功");
                            }
                          },
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
