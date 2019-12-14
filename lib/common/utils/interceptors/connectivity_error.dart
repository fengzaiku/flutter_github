import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_github/common/const/http_status.dart';

import 'package:flutter_github/common/const/result_data.dart';

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
        return _dio.resolve(ResultData(
          data: {},
          statusCode: HttpStatus.NETWORK_ERROR,
        ));
    }
    return options;
  }
}