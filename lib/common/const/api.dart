class Api {
  static const String host = "https://api.github.com/";
  static const String hostWeb = "https://github.com/";
  static const String graphicHost = 'https://ghchart.rshah.org/';

//   获取授权
  static getAuthorization() {
    return "${host}authorizations";
  }

  ///我的用户信息 GET
  static getMyUserInfo() {
    return "${host}user";
  }

  ///用户信息 get
  static getUserInfo({userName}) {
    return userName == null ? "${host}user" : "${host}users/$userName";
  }

  ///个人动态svg 图 get
  static getPersonDynamicSvg(userName,{svgColor="2016rshah"}) {
    return "${graphicHost}/$svgColor/$userName";
  }
}
