import 'package:flutter/material.dart';
import 'package:flutter_github/router/page_router.dart';
import 'package:redux/redux.dart';
import 'package:flutter_github/model/User.dart';

class UpdateUserAction{
  final User userInfo;
  UpdateUserAction(this.userInfo);
}
class LoginSuccessAction {
  final BuildContext context;
  final bool success;

  LoginSuccessAction(this.context, this.success);
}


final UserReducer = combineReducers<User>([
  TypedReducer<User, UpdateUserAction>(_loginLoaded),
]);
final LoginReducer = combineReducers<bool>([
  TypedReducer<bool, LoginSuccessAction>(_loginResult),
]);

User _loginLoaded(User user, action){
  print("lskdlfkjlsdkjfdskj");
  user = action.userInfo;
  return user;
}

bool _loginResult(bool result, LoginSuccessAction action) {
  if (action.success == true) {
    PageRouter.replaceHome(action.context);
  } else {
    PageRouter.replaceLogin(action.context);
  }
  return action.success;
}