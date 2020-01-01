import 'package:dio/dio.dart';
import 'package:flutter_github/common/const/http_status.dart';
import 'package:flutter_github/common/utils/interceptors/connectivity_error.dart';
import 'package:flutter_github/common/utils/interceptors/header.dart';
import 'package:flutter_github/common/utils/interceptors/token.dart';

class Http {
  Dio dio = Dio();

  Http() {
//    token
    dio.interceptors.add(TokenInterceptors());
//    请求日志
    dio.interceptors.add(LogInterceptor(responseBody: false));
//    网络链接状态判断
    dio.interceptors.add(ErrorConnectivityInterceptors(dio));
//    请求头设置包括，超时时间
    dio.interceptors.add(HeaderInterceptors());
//    路经过滤
//    dio.interceptors.add(FilterInterceptors());
  }

  Future request(String path,data, Options options) async {
    Response response;
    try {
      response = await dio.request(path, data: data, options: options);
    } on DioError catch (e) {
      response = resolveDioErrorRepository(e);
    }
    return response?.data ?? null;
  }

  Future<Response> post(String path, data) async {
    Response response;
    try {
      response = await dio.post(path, data: data);
    } on DioError catch (e) {
      response = resolveDioErrorRepository(e);
    }
    return response;
  }

  Future get(String path, {
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  }) async {
    Response response;
    RegExp starRegExp = RegExp(r"com\/user\/(subscriptions|starred)");

    try {
      response = await dio.get(path,queryParameters: queryParameters,
        options: options,
        cancelToken:cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioError catch (e) {
      response = resolveDioErrorRepository(e);
    }

    if(starRegExp.hasMatch(path)){
      if (response.statusCode == 404) {
        response = Response(
            data: false,
            statusCode: response.statusCode
        );
      }
      if (response.statusCode == 204) {
        response = Response(
            data: true,
            statusCode: response.statusCode
        );
      }
    }
    return response.data;
  }

  resolveDioErrorRepository(DioError e){
    Response errorResponse;
    if(e.response != null){
      errorResponse = e.response;
    } else {
      errorResponse = Response(
          statusCode: 911
      );
    }

    if(e.type == DioErrorType.CONNECT_TIMEOUT || e.type == DioErrorType.RECEIVE_TIMEOUT){
      errorResponse.statusCode = HttpStatus.NETWORK_TIMEOUT;
    }
    errorResponse.statusMessage = HttpStatus.handleHttpError(errorResponse.statusCode, errorResponse.statusMessage);
    return errorResponse;
  }
}

final Http http = Http();