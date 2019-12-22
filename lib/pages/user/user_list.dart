import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_github/common/const/api.dart';
import 'package:flutter_github/common/const/global_const.dart';
import 'package:flutter_github/common/utils/http.dart';
import 'package:flutter_github/common/utils/local_storage.dart';
import 'package:flutter_github/model/User.dart';
import 'package:flutter_github/model/UserList.dart';
//import 'package:flutter_easyrefresh/material_header.dart';

import 'package:flutter_github/pages/user/widget/user_item.dart';

class UserListWidget extends StatefulWidget {
  String type;

  UserListWidget(this.type,{Key key}) : super(key:key);
  @override
  _UserListWidgetState createState() => _UserListWidgetState();
}

class _UserListWidgetState extends State<UserListWidget>{
  List<User> userList = List();
  int page = 1;
  String username;

  Future<void> _onRefresh() async{
    username = await LocalStorage.getItem(GlobalConst.USER_NAME_KEY);
      userList.clear();
      page = 1;
    await _onLoad();
  }

  Future<void> _onLoad() async{
    var result;
    if(widget.type == "fans"){
      result = await http.get(Api.getUserFollower(username)+ Api.getPageParams(page));
    }
    if(widget.type == "attention"){
      result = await http.get(Api.getUserFollowed(username)+ Api.getPageParams(page));
    }
      print("请求了没");
    if(result != null){
      setState(() {
        userList.addAll(UserList.fromJson(result).userList);
        ++page;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("用户列表"),
          ),
//      body: Text("怎么回事"),
          body: Container(
            child: EasyRefresh(
              firstRefresh: true,
//          header: MaterialHeader(),
              onRefresh: _onRefresh,
              onLoad: _onLoad,
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return UserItemWidget(userList[index]);
                },
                itemCount: userList.length,
              ),
            ),
        ),
    );
  }
}
