//import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_github/https/response/response_data.dart';

class Http {
  Dio dio = Dio();

  Future<ResponseData> request(String path,
      {data, Map params, Options options}) async {
    Response response;
    try {
      response = await dio.request(path, data: data, options: options);
    } catch (e) {}
  }

  Future<ResponseData> post(
    String path, {
    data,
    Map<String, dynamic> params,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    Response response;
    try {
      response = await dio.post(path, data: data);
    } catch (e) {}
  }
}
