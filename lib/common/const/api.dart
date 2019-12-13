 class Api{
   static const String host = "https://api.github.com/";
   static const String hostWeb = "https://github.com/";

//   获取授权
    static getAuthorization(){
      return "${host}authorizations";
    }
 }