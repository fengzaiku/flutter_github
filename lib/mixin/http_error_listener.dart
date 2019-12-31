
import 'package:flutter/material.dart';
import 'package:flutter_github/common/event/event_bus.dart';

mixin HttpListenerError<T> on State{
  @override
  void initState() {
    super.initState();
    eventBus.on<HttpErrorEvent>().listen(handleHttpError);
  }

  void handleHttpError(HttpErrorEvent event){

  }
}