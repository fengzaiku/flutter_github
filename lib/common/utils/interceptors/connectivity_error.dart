import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_github/common/const/http_status.dart';

class ErrorConnectivityInterceptors extends InterceptorsWrapper{
  final Dio _dio;

  ErrorConnectivityInterceptors(this._dio);

  @override
  Future onRequest(RequestOptions options) async {
    final Connectivity _connectivity = Connectivity();
    ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    }  catch (e) {
      print("网络错误-------------------------------${e.toString()}");
    }

    if(result == ConnectivityResult.none){
      HttpStatus.handleHttpError(HttpStatus.NETWORK_ERROR, "网络错误");
      return _dio.resolve(Response(
        data: null,
        statusCode: HttpStatus.NETWORK_ERROR,
      ));
    }
    return options;
  }
}