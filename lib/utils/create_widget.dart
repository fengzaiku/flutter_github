import 'package:flutter/material.dart';
//import 'package:io/io.dart';

typedef ReapeatWidget = Widget Function(dynamic item);

List createRepeatWidget(List items,ReapeatWidget builder){
  return items.map((item)=> builder(item)).toList();
}
