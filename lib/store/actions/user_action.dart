import 'dart:convert';
import 'package:flutter_github/common/config/authorized.dart';
import 'package:flutter_github/common/const/api.dart';
import 'package:flutter_github/common/utils/http.dart';
import 'package:flutter_github/store/app_state.dart';
import 'package:flutter_github/store/reducers/user_reducers.dart';
import 'package:redux/redux.dart';
//import 'package:flutter_github/model/User.dart';

//final Function loginAction = (Store<AppState> store, String username, String password) async {
//  print("i为u热帖u让他也");
//     Map requestParams = {
//      "scopes": ['user', 'repo', 'gist', 'notifications'],
//      "note": "admin_script",
//      "client_id": AuthorizedOAuthApps.CLIENT_ID,
//      "client_secret": AuthorizedOAuthApps.CLIENT_SECRET
//    };
//
//    var res = await http.post(Api.getAuthorization(),json.encode(requestParams));
//
//    print(res);
//    store.dispatch(UpdateUserAction(res.data));
//};
final Function loginAction = (String username, String password) {
  print("i为u热帖u让他也");
//  return (Store<User> store) async {
  return (Store<AppState> store) async {
    print("-----------------------------$store");
    Map requestParams = {
      "scopes": ['user', 'repo', 'gist', 'notifications'],
      "note": "admin_script",
      "client_id": AuthorizedOAuthApps.CLIENT_ID,
      "client_secret": AuthorizedOAuthApps.CLIENT_SECRET
    };

    var res = await http.post(Api.getAuthorization(),json.encode(requestParams));

    print("res------------------------------$res");
    store.dispatch(UpdateUserAction(res.data));
//    store.dispatch(res);
  };
};
