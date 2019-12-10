import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
//import 'package:flutter_easyrefresh/material_header.dart';

import 'package:flutter_github/pages/user/widget/user_item.dart';

class UserListWidget extends StatefulWidget {
  @override
  _UserListWidgetState createState() => _UserListWidgetState();
}

class _UserListWidgetState extends State<UserListWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("用户列表"),
      ),
//      body: Text("怎么回事"),
      body: Container(
        child: EasyRefresh(
//          header: MaterialHeader(),
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 2), () {
              setState(() {
              });
            });
          },
          onLoad: () async {
            await Future.delayed(Duration(seconds: 2), () {
              setState(() {
              });
            });
          },
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return UserItemWidget();
            },
            itemCount: 30,
          ),
        ),
      ),
    );
  }
}
