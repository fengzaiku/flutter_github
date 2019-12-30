import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github/pages/center/model/reposition_view.dart';
import 'package:flutter_github/pages/code/code_detail.dart';
import 'package:flutter_github/pages/push/push_detail_page.dart';
import 'package:flutter_github/pages/repository/rep_readme_page.dart';
import 'package:flutter_github/pages/repository/repo_detail.dart';
import 'package:flutter_github/pages/repository/repo_list_page.dart';
import 'package:flutter_github/pages/user/user_list.dart';

class PageRouter {
// 主页/首页
  static replaceHome(BuildContext context){
    Navigator.pushReplacementNamed(context, 'home_page');
  }
// 登录页面
  static replaceLogin(BuildContext context){
    Navigator.pushReplacementNamed(context, 'login_page');
  }

//  仓库列表页面
  static goToRepositoryListPage(BuildContext context, String type){
    Navigator.push(context, CupertinoPageRoute(builder: (context) => RepositoryListWidget(type)));
  }

//  用户列表页面
  static goToUserListPage(BuildContext context, String type){
    Navigator.push(context, CupertinoPageRoute(builder: (context) => UserListWidget(type)));
  }

//  代码提交详情页
  static goToPushDetailPage(BuildContext context,owner, repositoryName, sha){
    Navigator.push(context, CupertinoPageRoute(builder: (context) => PushDetailPageWidget(owner, repositoryName, sha)));
  }

//  readme 页面
  static goToRepositionReadmePage(BuildContext context, {String html, String title}){
    Navigator.push(context, CupertinoPageRoute(builder: (context) => RepositionReadmePageWidget(string: html, title: title)));
  }

//  仓库详情页面
  static goToRepositionDetailPage(BuildContext context, RepositionViewModel repositionViewModel){
    Navigator.push(context, CupertinoPageRoute(builder: (context) => RepositionDetailPageWidget(repositionViewModel)));
  }

//  codeDetail webView 页面
  static goToCodeDetailDetailPage(BuildContext context, name, result){
    Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => CodeDetailPageWidget(
      title: name,
      htmlBody: result,
    )));
  }
}