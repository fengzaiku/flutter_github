import 'package:dio/dio.dart';
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
  }

  Future request(String path,data, Options options) async {
    Response response;
    try {
      response = await dio.request(path, data: data, options: options);
    } on DioError catch (e) {
      print("error-------------------$e");
    }
    print("response-------------------$response");
    return response?.data ?? null;
  }

  Future<Response> post(String path, data) async {
    Response response;
    try {
      response = await dio.post(path, data: data);
    } on DioError catch (e) {
      response = Response(
        data: null,
        statusCode: e.response.statusCode
      );
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
    try {
      response = await dio.get(path,queryParameters: queryParameters,
        options: options,
        cancelToken:cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioError catch (e) {
      response = Response(
          data: null,
          statusCode: e.response.statusCode
      );
    }
    return response.data;
  }
}

final Http http = Http();