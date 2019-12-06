import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github/pages/history/read_history.dart';
import 'package:flutter_github/utils/common_dialog.dart';
import 'package:flutter_github/widget/flex_full_button.dart';

//import 'package:quill_delta/quill_delta.dart';
//import 'package:zefyr/zefyr.dart';

class HomeDrawerWidget extends StatefulWidget {
  @override
  _HomeDrawerWidgetState createState() => _HomeDrawerWidgetState();
}

class _HomeDrawerWidgetState extends State<HomeDrawerWidget> {
//  ZefyrController _controller;
//
//  @override
//  void initState() {
//    super.initState();
//
//    final document = _loadDocument();
//    _controller = ZefyrController(document);
//  }
//
//  NotusDocument _loadDocument() {
//    final Delta delta = Delta()..insert("Zefyr Quick Start\n");
//    return NotusDocument.fromDelta(delta);
//  }

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
                onTap: (){
//                  CommonDialog.flutterGitHubDialog(context,Scaffold(
//                    appBar: AppBar(title: Text("Editor page")),
//                    body: ZefyrScaffold(
//                      child: ZefyrEditor(
//                        padding: EdgeInsets.all(16),
//                        controller: _controller,
//                      ),
//                    ),
//                  ));
                }
            ),
            ListTile(
                title: Text("阅读历史"),
                onTap: (){
                  Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => ReadHistoryPageWidget()));
                }
            ),
            ListTile(
                title: Text("个人信息"),
                onTap: (){}
            ),
//            ListTile(
//              title: Text("切换主题"),
//              onTap: (){}
//            ),
//            ListTile(
//              title: Text("语言切换"),
//              onTap: (){}
//            ),
            ListTile(
                title: Text("检测更新"),
                onTap: (){
                  CommonDialog.alertDialog(context);
                }
            ),
            ListTile(
                title: Text("关于"),
                onTap: (){
                  CommonDialog.aboutDialog(context);
                }
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
