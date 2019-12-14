import 'dart:collection';

import 'package:dio/dio.dart';

class HeaderInterceptors extends InterceptorsWrapper{
  @override
  Future onRequest(RequestOptions options) async{
    options.connectTimeout = 15000;
    options.headers.addAll(HashMap());
    return options;
  }
}