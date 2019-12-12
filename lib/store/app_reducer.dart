import 'package:flutter_github/store/app_state.dart';
import 'package:flutter_github/store/reducers/user_reducers.dart';

AppState appReducer(AppState state, action){
  print("action---------------$action");
  return AppState(
      userInfo: state.userInfo,
//      userInfo: userReducer(state.userInfo, action),
  );
}



