import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_github/common/config/authorized.dart';
import 'package:flutter_github/common/const/api.dart';
import 'package:flutter_github/common/const/global_const.dart';
import 'package:flutter_github/common/utils/http.dart';
import 'package:flutter_github/common/utils/local_storage.dart';
import 'package:flutter_github/model/User.dart';
import 'package:flutter_github/store/app_state.dart';
import 'package:flutter_github/store/reducers/user_reducers.dart';
import 'package:redux/redux.dart';

final Function loginAction = (String username, String password, BuildContext context) {
  print("i为u热帖u让他也");
  return (Store<AppState> store) async {
    username = username.trim();
    password = password.trim();
    String type = username +":"+ password;
    List types = utf8.encode(type);
    String base64Str = base64.encode(types);

    await LocalStorage.setItem(GlobalConst.USER_NAME_KEY, username);
    await LocalStorage.setItem(GlobalConst.USER_PW_KEY, password);
    await LocalStorage.setItem(GlobalConst.USER_BASIC_CODE, base64Str);

    Map requestParams = {
      "scopes": ['user', 'repo', 'gist', 'notifications'],
      "note": "flutter_github",
      "client_id": AuthorizedOAuthApps.CLIENT_ID,
      "client_secret": AuthorizedOAuthApps.CLIENT_SECRET
    };
    Response response = await http.post(Api.getAuthorization(),json.encode(requestParams));

    if(response.data != null){
      var userInfo = await http.get(Api.getUserInfo());
      store.dispatch(UpdateUserAction(User.fromJson(userInfo)));
      store.dispatch(LoginSuccessAction(context,true));
    }
  };
};

final Function getUserInfo = () {
  return (Store<AppState> store) async {
    var userInfo = await http.get(Api.getUserInfo());
    if(userInfo != null){
      store.dispatch(UpdateUserAction(User.fromJson(userInfo)));
    }
  };
};

final Function loginOutAction = (BuildContext context) {
  return (Store<AppState> store) async {

    await LocalStorage.removeItem(GlobalConst.TOKEN_KEY);
    await LocalStorage.removeItem(GlobalConst.USER_NAME_KEY);
    await LocalStorage.removeItem(GlobalConst.USER_PW_KEY);
    await LocalStorage.removeItem(GlobalConst.USER_BASIC_CODE);

    store.dispatch(UpdateUserAction(User.empty()));
    store.dispatch(LoginSuccessAction(context,false));
  };
};
