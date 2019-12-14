import 'package:dio/dio.dart';

class ResultData {
  /// 响应数据，可能已经被转换了类型, 详情请参考Options中的[ResponseType].
  var data;

  /// 响应头
  Headers headers;

  /// Http status code.
  int statusCode;

  /// 重定向信息(Flutter Web不可用)
//  List<RedirectInfo> redirects ;
//  /// 真正请求的url(重定向最终的uri)
//  Uri realUri;
//  /// 响应对象的自定义字段（可以在拦截器中设置它），调用方可以在`then`中获取.
//  Map<String, dynamic> extra;

  ResultData({this.statusCode,this.data,this.headers});
}
