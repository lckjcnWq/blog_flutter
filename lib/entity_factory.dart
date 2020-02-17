import 'package:blog_app/entitiy/BlogEntity.dart';
import 'package:blog_app/entitiy/ClassEntity.dart';
import 'package:blog_app/entitiy/CommentEntity.dart';
import 'package:blog_app/entitiy/LinkEntity.dart';
import 'package:blog_app/entitiy/ResultEntityEntity.dart';
import 'package:blog_app/entitiy/TagEntity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "BlogEntity") {
      return BlogEntity.fromJson(json) as T;
    } else if (T.toString() == "ClassEntity") {
      return ClassEntity.fromJson(json) as T;
    } else if (T.toString() == "CommentEntity") {
      return CommentEntity.fromJson(json) as T;
    } else if (T.toString() == "LinkEntity") {
      return LinkEntity.fromJson(json) as T;
    } else if (T.toString() == "ResultEntityEntity") {
      return ResultEntityEntity.fromJson(json) as T;
    } else if (T.toString() == "TagEntity") {
      return TagEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}