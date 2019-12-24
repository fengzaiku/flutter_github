import 'package:flutter_github/common/const/global_const.dart';
import 'package:flutter_github/common/utils/local_storage.dart';

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
  static getUserEvent([userName]) async{
    userName ??= await LocalStorage.getItem(GlobalConst.USER_NAME_KEY);
    return "${host}users/$userName/events";
  }

//  用户收到的事件信息 get
  static getEventReceived([userName]) async{
    userName ??= await LocalStorage.getItem(GlobalConst.USER_NAME_KEY);
    return "${host}users/$userName/received_events";
  }
//  用户的仓库 get
  static getUserRepos([userName, sort]) async{
    userName ??= await LocalStorage.getItem(GlobalConst.USER_NAME_KEY);
    sort ??= 'pushed';
    return "${host}users/$userName/repos?sort=$sort";
  }

//  用户的关注者 get
  static getUserFollower(userName){
    return "${host}users/$userName/followers";
  }

//  用户关注 get
  static getUserFollowed(userName) {
    return "${host}users/$userName/following";
  }

//  处理分页参数
  static getPageParams(page, [pageSize = GlobalConst.PAGE_SIZE]) {
      return page != null ? "?page=$page&per_page=$pageSize" : "";
  }


  ///用户的star get
  static getUserStar([userName, sort]) async{
    sort ??= 'updated';
    userName ??= await LocalStorage.getItem(GlobalConst.USER_NAME_KEY);
    return "${host}users/$userName/starred?sort=$sort";
  }

//  仓库提交详情 get
  static getReposCommitsInfo(reposOwner, reposName, sha) {
    return "${host}repos/$reposOwner/$reposName/commits/$sha";
  }

//  趋势 get
  static getTrending(since, languageType) {
    if (languageType != null) {
      return "https://github.com/trending/$languageType?since=$since";
    }
    return "https://github.com/trending?since=$since";
  }
}


//{
//"current_user_url": "https://api.github.com/user",
//"current_user_authorizations_html_url": "https://github.com/settings/connections/applications{/client_id}",
//"authorizations_url": "https://api.github.com/authorizations",
//"code_search_url": "https://api.github.com/search/code?q={query}{&page,per_page,sort,order}",
//"commit_search_url": "https://api.github.com/search/commits?q={query}{&page,per_page,sort,order}",
//"emails_url": "https://api.github.com/user/emails",
//"emojis_url": "https://api.github.com/emojis",
//"events_url": "https://api.github.com/events",
//"feeds_url": "https://api.github.com/feeds",
//"followers_url": "https://api.github.com/user/followers",
//"following_url": "https://api.github.com/user/following{/target}",
//"gists_url": "https://api.github.com/gists{/gist_id}",
//"hub_url": "https://api.github.com/hub",
//"issue_search_url": "https://api.github.com/search/issues?q={query}{&page,per_page,sort,order}",
//"issues_url": "https://api.github.com/issues",
//"keys_url": "https://api.github.com/user/keys",
//"label_search_url": "https://api.github.com/search/labels?q={query}&repository_id={repository_id}{&page,per_page}",
//"notifications_url": "https://api.github.com/notifications",
//"organization_repositories_url": "https://api.github.com/orgs/{org}/repos{?type,page,per_page,sort}",
//"organization_url": "https://api.github.com/orgs/{org}",
//"public_gists_url": "https://api.github.com/gists/public",
//"rate_limit_url": "https://api.github.com/rate_limit",
//"repository_url": "https://api.github.com/repos/{owner}/{repo}",
//"repository_search_url": "https://api.github.com/search/repositories?q={query}{&page,per_page,sort,order}",
//"current_user_repositories_url": "https://api.github.com/user/repos{?type,page,per_page,sort}",
//"starred_url": "https://api.github.com/user/starred{/owner}{/repo}",
//"starred_gists_url": "https://api.github.com/gists/starred",
//"team_url": "https://api.github.com/teams",
//"user_url": "https://api.github.com/users/{user}",
//"user_organizations_url": "https://api.github.com/user/orgs",
//"user_repositories_url": "https://api.github.com/users/{user}/repos{?type,page,per_page,sort}",
//"user_search_url": "https://api.github.com/search/users?q={query}{&page,per_page,sort,order}"
//}