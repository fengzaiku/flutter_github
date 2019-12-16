import 'package:date_format/date_format.dart';

class FormatDateUtils{

  static const double LIMIT_SECOND = 60;
  static const double LIMIT_MINUTE = 60;
  static const double LIMIT_HOUR = 24;
  static const double LIMIT_TODAY = 4;

 static String getRelativeTime(DateTime date){
    int       _relativeTime   = DateTime.now().millisecondsSinceEpoch - date.millisecondsSinceEpoch;
    DateTime  differenceTime  = DateTime.fromMicrosecondsSinceEpoch(_relativeTime);
    int       today           = differenceTime.day;
    int       hour            = differenceTime.hour;
    int       minute          = differenceTime.minute;
    int       second          = differenceTime.second;

    if(today > LIMIT_TODAY){
      return formatDate(date, [yyyy,"-",mm,"-",dd]);
    } else if(today > 0){
      return "$today 天前";
    }

    if(hour > 0 && hour < LIMIT_HOUR){
      return "$hour 小时前";
    }

    if(minute > 0 && minute < LIMIT_MINUTE){
      return "$minute 秒前";
    }

    if(second < LIMIT_SECOND){
      return "刚刚";
    } else {
      return "$minute 秒前";
    }

    return "未解析到时间";
 }
}