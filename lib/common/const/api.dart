import 'package:flutter_github/common/const/global_const.dart';

class Api {
  static const String host = "https://api.github.com/";
  static const String hostWeb = "https://github.com/";
  static const String graphicHost = 'https://ghchart.rshah.org/';

//   获取授权
  static getAuthorization() {
    return "${host}authorizations";
  }

//  我的用户信息 GET
  static getMyUserInfo() {
    return "${host}user";
  }

//  用户信息 get
  static getUserInfo({userName}) {
    return userName == null ? "${host}user" : "${host}users/$userName";
  }

//  个人动态svg 图 get
  static getPersonDynamicSvg(userName,{svgColor="2016rshah"}) {
    return "${graphicHost}/$svgColor/$userName";
  }

//  用户相关的事件信息 get
  static getUserEvent(userName) {
    return "${host}users/$userName/events";
  }

//  用户收到的事件信息 get
  static getEventReceived(userName) {
    return "${host}users/$userName/received_events";
  }
//  用户的仓库 get
  static getUserRepos(userName, sort) {
    sort ??= 'pushed';
    return "${host}users/$userName/repos?sort=$sort";
  }

//  处理分页参数
  static getPageParams(page, [pageSize = GlobalConst.PAGE_SIZE]) {
      return page != null ? "?page=$page&per_page=$pageSize" : "";
  }
}
