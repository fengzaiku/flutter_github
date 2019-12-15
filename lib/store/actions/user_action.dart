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

//import 'package:flutter_github/model/User.dart';

final Function loginAction = (String username, String password, BuildContext context) {
  print("i为u热帖u让他也");
  return (Store<AppState> store) async {

    String type = username +":"+ password;
    List types = utf8.encode(type);
    String base64Str = base64.encode(types);

//    await LocalStorage.removeItem(GlobalConst.TOKEN_KEY);
//    await LocalStorage.setItem(GlobalConst.USER_BASIC_CODE, base64Str);

    print("base64Str---------------------------------$base64Str");
    Map requestParams = {
      "scopes": ['user', 'repo', 'gist', 'notifications'],
      "note": "flutter_github",
      "client_id": AuthorizedOAuthApps.CLIENT_ID,
      "client_secret": AuthorizedOAuthApps.CLIENT_SECRET
    };
//    var res = await http.post(Api.getAuthorization(),json.encode(requestParams));
    var userInfo = await http.get(Api.getUserInfo());
    User user = User.fromJson(userInfo);
    LocalStorage.setItem(GlobalConst.USER_INFO, json.encode(user.toJson()));
//    print("res------------------------------$res");

    store.dispatch(UpdateUserAction(User.fromJson(userInfo)));
    store.dispatch(LoginSuccessAction(context,true));
  };
};
