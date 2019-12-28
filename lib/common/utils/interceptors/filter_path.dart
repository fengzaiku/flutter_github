import 'package:dio/dio.dart';

class FilterInterceptors extends InterceptorsWrapper{

  @override
  Future<Response> onResponse(Response response) async {
    RegExp starRegExp = RegExp(r"com\/user\/(subscriptions|starred)");

    if(starRegExp.hasMatch(response.realUri.path)){
      if (response.statusCode == 404) {
        response.data = false;
      }
      if (response.statusCode == 204) {
        response.data = true;
      }
    }
    return response;
  }
}