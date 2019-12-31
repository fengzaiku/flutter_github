
import 'package:flutter_github/common/event/event_bus.dart';

class HttpStatus {
// 网络错误
  static const NETWORK_ERROR = -1;

//  网络超时
  static const NETWORK_TIMEOUT = -2;

  static handleHttpError(code, message,[noTip = false]){
    if(noTip){
      return message;
    }
    eventBus.fire(HttpErrorEvent(code, message));
    return message;
  }
}