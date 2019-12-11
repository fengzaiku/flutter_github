//import 'dart:io';
import 'package:dio/dio.dart';

class Http {
  Dio dio = Dio();

  Future request(String path,
      {data, Map queryParameters, Options options}) async {
    Response response;
    try {
      response = await dio.request(path, data: data, options: options);
    } catch (e) {}
  }
}
