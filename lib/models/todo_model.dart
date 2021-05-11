import 'package:flutter/material.dart';

class TodoField {
  static const createdTime = 'createdTime';
}

class Todo {
  DateTime createdTime;
  String title;
  String desc;
  String id;
  bool isDone;

  Todo(
      {@required this.createdTime,
      @required this.title,
      this.desc,
      this.id,
      this.isDone});
}
