import 'package:flutter/material.dart';
import 'package:flutter_github/widget/flutter_github_card.dart';
import 'package:flutter_github/widget/user_icon.dart';

class UserItemWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return FgCardItemWidget(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          UserIconWidget(),
          Text("打开击杀跨境电商")
        ],
      )
    );
  }
}
