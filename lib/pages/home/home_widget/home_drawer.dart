import 'package:flutter/material.dart';
import 'package:flutter_github/widget/flex_full_button.dart';

class HomeDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
  //  decoration,
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage("http://b.hiphotos.baidu.com/image/pic/item/32fa828ba61ea8d3fcd2e9ce9e0a304e241f5803.jpg"),
              ),
              accountName: Text("大海"),
              accountEmail: Text("2622421754@qq.com"),
              // onDetailsPressed,

            ),
            ListTile(
              title: Text("阅读反馈"),
              onTap: (){}
            ),
            ListTile(
              title: Text("阅读历史"),
              onTap: (){}
            ),
            ListTile(
              title: Text("个人信息"),
              onTap: (){}
            ),
            ListTile(
              title: Text("切换主题"),
              onTap: (){}
            ),
            ListTile(
              title: Text("语言切换"),
              onTap: (){}
            ),
            ListTile(
              title: Text("检测更新"),
              onTap: (){}
            ),
            ListTile(
              title: Text("关于"),
              onTap: (){}
            ),
            ListTile(
              title: FlexFullButton(
                // color：,
                text: "退出登录",
              ),
              onTap: (){}
            ),
          ],
        ),
      ),
    );
  }
}