import 'package:dio/dio.dart';
import 'package:flutter_github/common/const/global_const.dart';
import 'package:flutter_github/common/utils/local_storage.dart';

class TokenInterceptors extends InterceptorsWrapper {

  @override
  Future onRequest(RequestOptions options) async {
    options.headers["Authorization"] = await getAuthorizationToken();
    return options;
  }

  @override
  Future<Response> onResponse(Response response) async {
    print("response.data---------------------${response.data}");
    try {
      var responseJson = response.data;

      if (response.statusCode == 201 && responseJson["token"] != null) {
//      这里的token 必须有空格
        await LocalStorage.setItem(GlobalConst.TOKEN_KEY, "token " + responseJson["token"]);
      }
    } catch (error) {
      print("返回数据错误-------------------------$error");
    }
    return response;
  }

  getAuthorizationToken() async {
    String token = await LocalStorage.getItem(GlobalConst.TOKEN_KEY);
    if (token == null) {
      String basic = await LocalStorage.getItem(GlobalConst.USER_BASIC_CODE);
      return "Basic $basic";
    }
    print("获取到得授权token--------------------------$token");
    return token;
  }
}
