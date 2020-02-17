import 'package:flutter/material.dart';

class CommonUtils {
  /*
  *  获取表单对象
  * */
  static TextFormField getTextFormField(
    TextEditingController controller,
    String labelText,
  ) {
    return TextFormField(
      autofocus: true,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
      ),
//      validator: (v) {
//        return v.trim().length > 0 ? null : "输入不能为空";
//      },
    );
  }

  /*
  *  获取修改的表头名称
  * */
  static Text getTitle(String inputStr) {
    return Text(
      inputStr,
      style: TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }
}
