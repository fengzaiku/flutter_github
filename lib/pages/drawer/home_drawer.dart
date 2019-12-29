import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github/model/User.dart';
import 'package:flutter_github/pages/history/read_history.dart';
import 'package:flutter_github/store/app_state.dart';
import 'package:flutter_github/store/async_reducers/user_reducers.dart';
import 'package:flutter_github/utils/common_dialog.dart';
import 'package:flutter_github/widget/flex_full_button.dart';
import 'package:flutter_redux/flutter_redux.dart';

class HomeDrawerWidget extends StatefulWidget {
  @override
  _HomeDrawerWidgetState createState() => _HomeDrawerWidgetState();
}

class _HomeDrawerWidgetState extends State<HomeDrawerWidget> {

  void _loginOutDialog(context, store){
    CommonDialog.alertDialog(
      context: context,
      content: IntrinsicHeight(
        child: Container(
          alignment: Alignment.centerLeft,
          child: Text("确认退出吗？"),
        ),
      ),
      confirmCallback: (){
        store.dispatch(loginOutAction(context));
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
      builder: (BuildContext context, store){
        User userInfo = store.state.userInfo;
        return Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  //  decoration,
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(userInfo.avatarUrl ?? "http://img95.699pic.com/photo/40166/2807.jpg_wh300.jpg"),
                  ),
                  accountName: Text(userInfo.login ?? ""),
                  accountEmail: Text(userInfo.email ?? ""),
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
//                      CommonDialog.alertDialog(context);
                    }
                ),
                ListTile(
                    title: Text("关于"),
                    onTap: (){
//                      CommonDialog.aboutDialog(context);
                    }
                ),
                ListTile(
                    title: FlexFullButton(
                      // color：,
                      text: "退出登录",
                      onPressed: (){_loginOutDialog?.call(context, store);},
                    ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
