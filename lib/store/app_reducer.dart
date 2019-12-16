import 'package:flutter_github/store/app_state.dart';
import 'package:flutter_github/store/reducers/repository_reducers.dart';
import 'package:flutter_github/store/reducers/user_reducers.dart';

AppState appReducer(AppState state, action){
  return AppState(
      userInfo: UserReducer(state.userInfo, action),
      repositoryList: RepositoryListReducer(state.repositoryList, action),
      loginStatus: LoginReducer(state.loginStatus, action),
  );
}



