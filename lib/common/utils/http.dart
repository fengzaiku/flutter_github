import 'package:dio/dio.dart';
import 'package:flutter_github/common/const/response_data.dart';

class Http {
  Dio dio = Dio();

  Future<ResponseData> request(String path,
      {data, Map params, Options options}) async {
    Response response;
    try {
      response = await dio.request(path, data: data, options: options);
    } catch (e) {}

    return response.data;
  }

  Future<ResponseData> post(String path, data) async {
    Response response;
    try {
      response = await dio.post(path, data: data);
    } catch (e) {
      print("error-------------------$e");
    }
    print("response-------------------$response");
//    return response.data;
    return response.data;
  }
}

final Http http = Http();