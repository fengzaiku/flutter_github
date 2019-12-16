import 'package:flutter_github/model/RepositoryList.dart';
import 'package:flutter_github/model/User.dart';

// State
class AppState {
//  用户信息
  User            userInfo;
//  仓库列表
  RepositoryList  repositoryList;
//  登录状态
  bool loginStatus;

  AppState({this.userInfo,this.loginStatus,this.repositoryList});
}
