
import 'package:flutter/material.dart';
import 'package:flutter_github/common/const/http_status.dart';
import 'package:flutter_github/common/event/event_bus.dart';
import 'package:fluttertoast/fluttertoast.dart';

mixin HttpListenerError<T extends StatefulWidget> on State<T>{
  @override
  void initState() {
    super.initState();
    eventBus.on<HttpErrorEvent>().listen(handleHttpError);
  }

  void handleHttpError(HttpErrorEvent event){
    switch(event.code){
      case 404:
        Fluttertoast.showToast(msg: "文件未找到");
        break;
      case HttpStatus.NETWORK_ERROR:
        Fluttertoast.showToast(msg: "网络链接错误");
        break;
      case HttpStatus.NETWORK_TIMEOUT:
        Fluttertoast.showToast(msg: "链接超时");
        break;
      default:
        Fluttertoast.showToast(msg: event.message);
    }
  }
}