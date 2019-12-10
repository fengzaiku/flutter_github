import 'package:flutter_github/model/User.dart';

// State
class AppState {
//  用户信息
  User userInfo;

  AppState({this.userInfo});
}

class AppInitial implements AppState {
  User userInfo = User.empty();

  AppInitial({
    this.userInfo,
  });
}
