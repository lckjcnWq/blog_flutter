import 'package:base_library/base_library.dart';
import 'package:blog_app/utils/TotalUtils.dart';
import 'package:blog_app/common/Constants.dart';
import 'package:blog_app/http/HttpGo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:blog_app/entitiy/ResultEntityEntity.dart';

class SystemChangeFragment extends StatefulWidget {
  @override
  SystemChangeFragmentRouteState createState() {
    return new SystemChangeFragmentRouteState();
  }
}

class SystemChangeFragmentRouteState extends State<SystemChangeFragment> {
  GlobalKey personFormKey = new GlobalKey<FormState>();
  GlobalKey siteFormKey = new GlobalKey<FormState>();
  GlobalKey bottomFormKey = new GlobalKey<FormState>();
  String _personHeader,
      _personName,
      _personEmail,
      _siteName,
      _siteDescribe,
      _siteLogo,
      _siteIco,
      _bottomAbout,
      _bottomNumber,
      _bottomCopyRight,
      _bottomPowerBy,
      _bottomPowerByUrl;

  //个人信息
  TextEditingController personHeaderCr = new TextEditingController();
  TextEditingController personNameCr = new TextEditingController();
  TextEditingController personEmailCr = new TextEditingController();

  //站点信息
  TextEditingController siteNameCr = new TextEditingController();
  TextEditingController siteDescribeCr = new TextEditingController();
  TextEditingController siteLogoCr = new TextEditingController();
  TextEditingController siteIcoCr = new TextEditingController();

  //底部信息
  TextEditingController bottomAboutCr = new TextEditingController();
  TextEditingController bottomNumberCr = new TextEditingController();
  TextEditingController bottomCopyRightCr = new TextEditingController();
  TextEditingController bottomPowerByCr = new TextEditingController();
  TextEditingController bottomPowerByUrlCr = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: new Column(
          children: <Widget>[
            //个人信息
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: CommonUtils.getTitle(Constants.personInfo),
            ),
            Form(
              key: personFormKey,
              autovalidate: true,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    autofocus: true,
                    controller: personHeaderCr,
                    decoration: InputDecoration(
                      labelText: Constants.personPhoto,
                    ),
                    onSaved: (val) {
                      _personHeader = val;
                    },
                  ),
                  TextFormField(
                    autofocus: true,
                    controller: personNameCr,
                    decoration: InputDecoration(
                      labelText: Constants.personName,
                    ),
                    onSaved: (val) {
                      _personName = val;
                    },
                  ),
                  TextFormField(
                    autofocus: true,
                    controller: personEmailCr,
                    decoration: InputDecoration(
                      labelText: Constants.personEmail,
                    ),
                    onSaved: (val) {
                      _personEmail = val;
                    },
                  ),
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
                            personInfoSubmit();
                          },
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //站点信息
            Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: CommonUtils.getTitle(Constants.siteName),
            ),
            Form(
              key: siteFormKey,
              autovalidate: true,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    autofocus: true,
                    controller: siteNameCr,
                    decoration: InputDecoration(
                      labelText: Constants.siteName,
                    ),
                    onSaved: (val) {
                      _siteName = val;
                    },
                  ),
                  TextFormField(
                    autofocus: true,
                    controller: siteDescribeCr,
                    decoration: InputDecoration(
                      labelText: Constants.siteDescribe,
                    ),
                    onSaved: (val) {
                      _siteDescribe = val;
                    },
                  ),
                  TextFormField(
                    autofocus: true,
                    controller: siteLogoCr,
                    decoration: InputDecoration(
                      labelText: Constants.siteLogo,
                    ),
                    onSaved: (val) {
                      _siteLogo = val;
                    },
                  ),
                  TextFormField(
                    autofocus: true,
                    controller: siteIcoCr,
                    decoration: InputDecoration(
                      labelText: Constants.siteIco,
                    ),
                    onSaved: (val) {
                      _siteIco = val;
                    },
                  ),
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
                            if ((siteFormKey.currentState as FormState)
                                .validate()) {
                              editSiteSubmit();
                            }
                          },
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //底部信息
            Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: CommonUtils.getTitle(Constants.bottomInfo),
            ),
            Form(
              key: bottomFormKey,
              autovalidate: true,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    autofocus: true,
                    controller: bottomAboutCr,
                    decoration: InputDecoration(
                      labelText: Constants.bottomAbout,
                    ),
                    onSaved: (val) {
                      _bottomAbout = val;
                    },
                  ),
                  TextFormField(
                    autofocus: true,
                    controller: bottomNumberCr,
                    decoration: InputDecoration(
                      labelText: Constants.bottomNumber,
                    ),
                    onSaved: (val) {
                      _bottomNumber = val;
                    },
                  ),
                  TextFormField(
                    autofocus: true,
                    controller: bottomCopyRightCr,
                    decoration: InputDecoration(
                      labelText: Constants.bottomCopyRight,
                    ),
                    onSaved: (val) {
                      _bottomCopyRight = val;
                    },
                  ),
                  TextFormField(
                    autofocus: true,
                    controller: bottomPowerByCr,
                    decoration: InputDecoration(
                      labelText: Constants.bottomPoweredBy,
                    ),
                    onSaved: (val) {
                      _bottomPowerBy = val;
                    },
                  ),
                  TextFormField(
                    autofocus: true,
                    controller: bottomPowerByUrlCr,
                    decoration: InputDecoration(
                      labelText: Constants.bottomPoweredByUrl,
                    ),
                    onSaved: (val) {
                      _bottomPowerByUrl = val;
                    },
                  ),
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
                            if ((bottomFormKey.currentState as FormState)
                                .validate()) {
                              editBottomSubmit();
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

  //个人信息提交
  void personInfoSubmit() {
    if ((personFormKey.currentState as FormState).validate()) {
      (personFormKey.currentState as FormState).save();
      FormData formData = FormData.from({
        "yourAvatar": _personHeader,
        "yourName": _personName,
        "yourEmail": _personEmail,
      });
      LogUtil.e("_personHeader:" +
          _personHeader +
          " ,_personName:" +
          _personName +
          "  ,_personEmail:" +
          _personEmail);
      HttpGo.getInstance().post(Constants.personInfoInterface, (data) {
        LogUtil.e("data:" + data);
        Map<String, dynamic> json = jsonDecode(data);
        ResultEntityEntity newBean = ResultEntityEntity.fromJson(json);
        if (newBean.resultCode == 200) {
          Fluttertoast.showToast(msg: "个人信息修改成功");
        }
      }, params: formData);
    }
  }

  //站点信息修改
  void editSiteSubmit() {
    if ((siteFormKey.currentState as FormState).validate()) {
      (siteFormKey.currentState as FormState).save();
      FormData formData = FormData.from({
        "websiteName": _siteName,
        "websiteDescription": _siteDescribe,
        "websiteLogo": _siteLogo,
        "websiteIcon": _siteIco,
      });
      LogUtil.e("_siteName:" +
          _siteName +
          " ,_siteDescribe:" +
          _siteDescribe +
          "  ,_siteLogo:" +
          _siteLogo +
          "  ,_siteIco:" +
          _siteIco);
      HttpGo.getInstance().post(Constants.siteInterface, (data) {
        LogUtil.e("data:" + data);
        Map<String, dynamic> json = jsonDecode(data);
        ResultEntityEntity newBean = ResultEntityEntity.fromJson(json);
        if (newBean.resultCode == 200) {
          Fluttertoast.showToast(msg: "站点信息修改成功");
        }
      }, params: formData);
    }
  }

  //底部信息修改
  void editBottomSubmit() {
    if ((bottomFormKey.currentState as FormState).validate()) {
      (bottomFormKey.currentState as FormState).save();
      FormData formData = FormData.from({
        "footerAbout": _bottomAbout,
        "footerICP": _bottomNumber,
        "footerCopyRight": _bottomCopyRight,
        "footerPoweredBy": _bottomPowerBy,
        "footerPoweredByURL": _bottomPowerByUrl,
      });
      LogUtil.e("_bottomAbout:" +
          _bottomAbout +
          " ,_bottomNumber:" +
          _bottomNumber +
          "  ,_bottomCopyRight:" +
          _bottomCopyRight +
          "  ,_bottomPowerBy:" +
          _bottomPowerBy +
          "  ,footerPoweredByURL:" +
          _bottomPowerByUrl);
      HttpGo.getInstance().post(Constants.bottomInterface, (data) {
        LogUtil.e("data:" + data);
        Map<String, dynamic> json = jsonDecode(data);
        ResultEntityEntity newBean = ResultEntityEntity.fromJson(json);
        if (newBean.resultCode == 200) {
          Fluttertoast.showToast(msg: "底部备案信息修改成功");
        }
      }, params: formData);
    }
  }
}
