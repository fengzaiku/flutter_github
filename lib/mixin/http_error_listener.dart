
import 'package:flutter/material.dart';
import 'package:flutter_github/common/const/http_status.dart';
import 'package:flutter_github/common/event/event_bus.dart';
import 'package:bot_toast/bot_toast.dart';

mixin HttpListenerError<T extends StatefulWidget> on State<T>{
  @override
  void initState() {
    super.initState();
    eventBus.on<HttpErrorEvent>().listen(handleHttpError);
  }

  void handleHttpError(HttpErrorEvent event){
    switch(event.code){
      case 404:
        BotToast.showText(text:"文件未找到");
        break;
      case HttpStatus.NETWORK_ERROR:
        BotToast.showSimpleNotification(title: "网络链接错误");
        break;
      case HttpStatus.NETWORK_TIMEOUT:
        BotToast.showSimpleNotification(title: "链接超时");
        break;
      default:
        BotToast.showText(text: event.message);
    }
  }
}