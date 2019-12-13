import 'package:redux/redux.dart';
import 'package:flutter_github/model/User.dart';

class UpdateUserAction{
  final User userInfo;
  UpdateUserAction(this.userInfo);
}

final UserReducer = combineReducers<User>([
  TypedReducer<User, UpdateUserAction>(_loginLoaded),
]);

User _loginLoaded(User user, action){
  print("lskdlfkjlsdkjfdskj");
  user = action.userInfo;
  return user;
}