import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/moduls/todo.dart';

class Category {
  List<Todo>? todoList = [];
  String? name;
  Icon? icon;
  HexColor? color;

  Category({this.todoList, this.name, this.icon, this.color});

  Map<String, dynamic> toMap() {
    return {
      'todoList': this.todoList,
      'name': this.name,
      'icon': this.icon,
      'color': this.color,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      todoList: map['todoList'] as List<Todo>,
      name: map['name'] as String,
      icon: map['icon'] as Icon,
      color: map['color'] as HexColor,
    );
  }
}
