import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_github/utils/widget_standard.dart';

class CommonDialog {
  static Future<Null> flutterGitHubDialog(BuildContext context, Widget child,
      [ConfigurationCard config]) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          double maxWidth = MediaQuery.of(context).size.width - 40;
          double maxHeight = MediaQuery.of(context).size.height - 60;
          return Center(
            child: Card(
              color: config?.color,
              elevation: config?.elevation,
              shape: config?.shape,
              margin: config?.margin,
              clipBehavior: config?.clipBehavior,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: maxHeight ?? 0.0, maxWidth: maxWidth ?? 0.0),
                child: Padding(
                    padding: config?.padding ?? EdgeInsets.all(10),
                    child: IntrinsicHeight(
                      child: child,
                    )),
              ),
            ),
          );
        });
  }

  static Future<Null> flutterGeneralDialog(
      BuildContext context, Widget builder) {
    return showGeneralDialog(
        context: context,
        barrierLabel: "什么情况",
        barrierColor: Color(0x01000000),
        transitionDuration: const Duration(milliseconds: 200),
        barrierDismissible: true,
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return Builder(builder: (BuildContext context) {
            return builder;
          });
        },
        transitionBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return FadeTransition(
            opacity:
                CurvedAnimation(parent: animation, curve: Curves.easeInOut),
            child: child,
          );
        });
  }

  static Future<Null> aboutDialog(context) {
    return showDialog(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return AboutDialog(
            applicationName: 'APP名称',
            applicationVersion: '1.0.9527',
            applicationIcon: SizedBox(
              width: 40,
              height: 40,
              child: Icon(Icons.settings_applications),
            ),
            applicationLegalese: '北京',
            children: <Widget>[
              Text('我是文本'),
            ],
          );
        });
  }

  static Future<Null> alertDialog({
    BuildContext context,
    Widget title,
    Widget content,
    Widget confirm,
    Widget cancel,
    VoidCallback confirmCallback,
    VoidCallback cancelCallback,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: title ?? Text('提示'),
          content: content ?? Text('我是content'),
          actions: <Widget>[
            FlatButton(
              child: confirm ?? Text('确定'),
              onPressed: () {
                Navigator.of(context).pop();
                confirmCallback?.call();
              },
            ),
            FlatButton(
              child: cancel ?? Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
                cancelCallback?.call();
              },
            ),
          ],
//          backgroundColor: Colors.yellowAccent,
          elevation: 20,
          semanticLabel: '哈哈哈哈',
          // 设置成 圆角
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        );
      },
    );
  }

  static Future<Null> simpleDialog(context) {
    return showDialog(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('请选择你的性别'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('我是男人'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('我是女人'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('我是人妖'),
            ),
          ],
        );
      },
    );
  }

  static Future<Null> bottomSheet(context) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return new Container(
            height: 200.0,
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    child: Text('你好'),
                    onPressed: () {
                      Navigator.pop(context, '你好');
                    },
                  ),
                  RaisedButton(
                    child: Text('我好'),
                    onPressed: () {
                      Navigator.pop(context, '我好');
                    },
                  ),
                  RaisedButton(
                    child: Text('大家好'),
                    onPressed: () {
                      Navigator.pop(context, '大家好');
                    },
                  ),
                ],
              ),
            ));
      },
    ).then((val) {
      // 打印 点击返回的数据
      print(val);
    });
  }
}
