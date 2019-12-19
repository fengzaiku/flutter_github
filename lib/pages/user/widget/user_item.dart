import 'package:flutter/material.dart';
import 'package:flutter_github/model/User.dart';
import 'package:flutter_github/widget/flutter_github_card.dart';
import 'package:flutter_github/widget/user_icon.dart';

class UserItemWidget extends StatelessWidget{
  final User userItem;
  UserItemWidget(this.userItem, {Key key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return FgCardItemWidget(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          UserIconWidget(
            image: userItem.avatarUrl ?? "",
          ),
          Text(userItem.login ?? "暂无")
        ],
      )
    );
  }
}
