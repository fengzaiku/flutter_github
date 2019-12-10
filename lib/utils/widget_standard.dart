import 'package:flutter/material.dart';

class DividerVertical {
  double  width;
  double  thickness;
  double  indent;
  double  endIndent;
  Color   color;

  DividerVertical(
      {this.width, this.thickness, this.indent, this.endIndent, this.color});
}

class RowSelectItem {
  String    selectKey;
  String    selectName;
  dynamic   selectValue;
  IconData  selectIcon;


  RowSelectItem({
    this.selectKey,
    this.selectName,
    this.selectValue,
    this.selectIcon,
  });
}

class SearchFilterModel {
  String  name;
  String  value;
  bool    select;

  SearchFilterModel({this.name, this.value, this.select});
}

class ConfigurationCard {
  final Color               color;
  final double              elevation;
  final ShapeBorder         shape;
  final Clip                clipBehavior;
  final EdgeInsetsGeometry  margin;
  final EdgeInsetsGeometry  padding;

  ConfigurationCard({
    this.color,
    this.elevation,
    this.shape,
    this.margin,
    this.padding,
    this.clipBehavior,
  });
}
