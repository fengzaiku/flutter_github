import 'package:flutter/material.dart';
import 'package:flutter_github/common/utils/date_format.dart';
import 'package:flutter_github/common/utils/event_format.dart';
import 'package:flutter_github/model/Event.dart';

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


class EventViewModel {
  String actionUser;
  String actionUserPic;
  String actionDes;
  String actionTime;
  String actionTarget;

  EventViewModel.fromEventMap(Event event){
    actionUser    = event.actor.login;
    actionUserPic = event.actor?.avatarUrl;
    actionTime    = FormatDateUtils.getRelativeTime(event.createdAt);
    var other = EventFormat.getActionAndDes(event);
    actionDes = other["des"];
    actionTarget = other["actionStr"];
  }
}