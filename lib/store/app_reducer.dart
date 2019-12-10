import 'package:flutter_github/store/app_state.dart';
import 'package:flutter_github/store/reducers/user_reducers.dart';

AppState appReducer(AppState state, action){
  return AppState(
      userInfo: userReducer(state.userInfo, action),
  );
}



