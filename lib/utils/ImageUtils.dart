import 'package:flutter/widgets.dart';

class ImageUtils{
  /*
   * 根据image路径获取图片
   */
  static Image getTabImage(path) {
    return new Image.asset('images/'+path, width: 24.0, height: 24.0);
  }
}