import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_github/common/const/api.dart';
import 'package:flutter_github/common/const/global_const.dart';
import 'package:flutter_github/common/utils/local_storage.dart';
import 'package:flutter_github/model/RepositoryList.dart';
import 'package:flutter_github/pages/center/model/reposition_view.dart';
import 'package:flutter_github/router/page_router.dart';
import 'package:flutter_github/store/async_reducers/repository_reducers.dart';
import 'package:flutter_github/store/async_reducers/user_reducers.dart';
import 'package:flutter_github/utils/widget_standard.dart';
import 'package:redux/redux.dart';

import 'package:flutter_github/common/iconfont.dart';
import 'package:flutter_github/common/utils/http.dart';
import 'package:flutter_github/model/Event.dart';
import 'package:flutter_github/model/EventList.dart';
import 'package:flutter_github/model/User.dart';
import 'package:flutter_github/pages/center/widget/center_select_item.dart';
import 'package:flutter_github/pages/dynamic/widget/dynamic_item.dart';
import 'package:flutter_github/store/app_state.dart';
import 'package:flutter_github/widget/flutter_sliver_app_bar.dart';
import 'package:flutter_github/widget/user_icon.dart';
import 'package:flutter_github/widget/icon_text.dart';
import 'package:flutter_github/widget/flutter_github_card.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCenterPageWidget extends StatefulWidget {
  MyCenterPageWidget({Key key}) : super(key: key);

  @override
  _MyCenterPageWidgetState createState() => _MyCenterPageWidgetState();
}

class _MyCenterPageWidgetState extends State<MyCenterPageWidget> with AutomaticKeepAliveClientMixin{
  final GlobalKey<_MyCenterPageWidgetState> _centerPage = new GlobalKey();
  List<Event> eventList = List();
  int page = 0;
  EasyRefreshController _controller;

  void _jumpToChildrenPage(context, name) {
    Store<AppState> store = StoreProvider.of<AppState>(context);

//    Widget _current;
    switch (name) {
      case "warehouse":
//        _current = RepositoryListWidget();
        break;
      case "fans":
        PageRouter.goToUserListPage(context, "fans");
        break;
      case "attention":
        PageRouter.goToUserListPage(context, "attention");
        break;
      case "star":
//        _current = RepositoryListWidget();
        break;
      case "glory":
        RepositoryList repositoryList = store.state.repositoryList;
        PageRouter.goToRepositoryListPage(context, repositoryList);
        break;
      default:
//
    }
  }

  Future<void> _onReferesh() async{
    var store = _getStore();
    await store.dispatch(getRepositoryList(store.state.userInfo?.login));
    eventList.clear();
    store.dispatch(getUserInfo());
    page = 0;
    await _onLoadMore();
  }

  @override
  bool get wantKeepAlive => true;

  Store<AppState> _getStore() {
    return StoreProvider.of<AppState>(context);
  }

  Future<void> _onLoadMore() async {
    var resultDate = await http.get(await Api.getUserEvent() + Api.getPageParams(page));

    if(resultDate.length > 0){
      var events = EventList.fromJson({"eventList": resultDate});
      setState(() {
        eventList.addAll(events.eventList);
        page ++;
      });
    }
  }

  @override
  void initState() {
    _controller = EasyRefreshController();
    _controller.callLoad();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = 3 * MediaQuery.of(context).size.width / 2;
    return StoreBuilder<AppState>(
      builder: (BuildContext context, store) {
        User userInfo = store.state.userInfo;
        RepositoryList repositoryList = store.state.repositoryList;
        return EasyRefresh.custom(
            controller: _controller,
            key: _centerPage,
            onRefresh: _onReferesh,
            firstRefresh: true,
            onLoad: _onLoadMore,
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: FgCardItemWidget(
                  padding: EdgeInsets.all(0),
                  elevation: 0,
                  color: Colors.black,
                  margin: EdgeInsets.all(0.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 10, left: 10, right: 10, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            UserIconWidget(
                              width: 80,
                              height: 80,
                              image: userInfo.avatarUrl,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(userInfo.login ?? "用户不存在",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white)),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      FgIcons.alarm,
                                      size: 16,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(userInfo.name ?? ""),
//                              组织
                                IconTextWidget(
                                  icon: FgIcons.community_dynamics,
                                  iconColor: Colors.white,
                                  text: userInfo.company ?? "目前什么都没有",
                                  textStyle: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
//                                位置
                                IconTextWidget(
                                  icon: FgIcons.location,
                                  iconColor: Colors.white,
                                  text: userInfo.location ?? "目前什么都没有",
                                  textStyle: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
//                        用户描述
                        Container(
                          child: Text(
                            userInfo.bio ?? "",
                            maxLines: 3,
                            style: TextStyle(color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text.rich(
                          TextSpan(
                            text: "创建于：",
                            children: <TextSpan>[
                              TextSpan(
                                text: "${formatDate(userInfo.createdAt ?? DateTime.now(), [yyyy,'-',mm,'-',dd])}",
                              ),
                            ],
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              FlutterSliverAppbarWidget(
                pinned: true,
                minHeight: 50,
                maxHeight: 50,
                builder: (BuildContext context, double shrinkOffset,
                    bool overlapsContent) {
                  double radius = ((50 - shrinkOffset) / 50) * 10;
                  return CenterItemSelectWidget(
                    onPressed: (value){
                      _jumpToChildrenPage?.call(context, value);
                    },
                    userInfo: userInfo,
                    started: repositoryList?.watchersCountTotal ?? 0,
                    radius: radius,
                  );
//              return FgCardItemWidget(
//                padding: EdgeInsets.all(0),
//                elevation: 0,
//                color: Colors.black,
//                margin: EdgeInsets.all(0.0),
//                shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.only(
//                      bottomLeft: Radius.circular(radius),
//                      bottomRight: Radius.circular(radius)),
//                ),
////                child: Text("ksjdfhkjshdfkjsdhk"),
//                child: CenterItemSelectWidget(onPressed: _jumpToChildrenPage),
//              );
                },
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 10, top: 25, bottom: 10),
                        child: Text(
                          "个人动态",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      FgCardItemWidget(
                        padding: EdgeInsets.all(0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
//                            physics: BouncingScrollPhysics(),
                          child: Container(
                            padding: EdgeInsets.only(left: 10.0, right: 10.0),
                            width: width,
                            height: 150,
                            child: SvgPicture.network(
                                Api.getPersonDynamicSvg(userInfo.login,
                                    svgColor: "2196f3"),
                                allowDrawingOutsideViewBox: true,
                                height: 140,
                                placeholderBuilder: (BuildContext context) {
                              return FractionallySizedBox(
                                widthFactor: 1,
                                child: IntrinsicHeight(
                                  child: Center(
                                    child: SpinKitRipple(
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return DynamicItemWidget(EventViewModel.fromEventMap(eventList[index]));
                }, childCount: eventList.length),
              ),
            ]);
      },
    );
  }
}
