import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_github/common/iconfont.dart';
import 'package:flutter_github/pages/center/widget/author_list_item.dart';
import 'package:flutter_github/pages/center/widget/center_select_item.dart';
import 'package:flutter_github/widget/flutter_sliver_app_bar.dart';
import 'package:flutter_github/widget/user_icon.dart';
import 'package:flutter_github/widget/icon_text.dart';
import 'package:flutter_github/widget/flutter_github_card.dart';

import 'package:flutter_github/pages/repository/repo_list_page.dart';
import 'package:flutter_github/pages/user/user_list.dart';

class MyCenterPageWidget extends StatefulWidget {
  MyCenterPageWidget({Key key}) : super(key: key);

  @override
  _MyCenterPageWidgetState createState() => _MyCenterPageWidgetState();
}

class _MyCenterPageWidgetState extends State<MyCenterPageWidget>
    with TickerProviderStateMixin<MyCenterPageWidget> {
  void _jumpToChildrenPage<String>(name) {
    Widget _current;
    print(name);
    switch (name) {
      case "warehouse":
        _current = RepositoryListWidget();
        break;
      case "fans":
        _current = UserListWidget();
        break;
      case "attention":
        _current = UserListWidget();
        break;
      case "star":
        _current = RepositoryListWidget();
        break;
      case "glory":
        _current = RepositoryListWidget();
        break;
      default:
//
    }
    Navigator.push(context, CupertinoPageRoute(builder: (context) => _current));
  }

  Future<void> _onReferesh() {
    return Future.delayed(Duration(milliseconds: 1000));
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh.custom(
        header: MaterialHeader(),
        onRefresh: _onReferesh,
        onLoad: _onReferesh,
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
                padding:
                    EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        UserIconWidget(width: 60, height: 60),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text("大海啊啊啊开始阶段和",
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
                            IconTextWidget(
                              icon: FgIcons.community_dynamics,
                              iconColor: Colors.white,
                              text: "目前什么都没有",
                              textStyle:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            IconTextWidget(
                              icon: FgIcons.access_trend,
                              iconColor: Colors.white,
                              text: "目前什么都没有",
                              textStyle:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            )
                          ],
                        )
                      ],
                    ),
                    Text.rich(
                      TextSpan(text: "创建于:", children: <TextSpan>[
                        TextSpan(text: "2019-11-24"),
                      ]),
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
                  onPressed: _jumpToChildrenPage,
                  radius: radius
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
                    padding: EdgeInsets.only(left: 10),
                    height: 50,
                    child: Text(
                      "个人动态",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  FgCardItemWidget(
                    padding: EdgeInsets.all(0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
//                            physics: BouncingScrollPhysics(),
                      child: Container(
                        child: Image.network(
                          "http://e.hiphotos.baidu.com/image/pic/item/4610b912c8fcc3cef70d70409845d688d53f20f7.jpg",
                          width: MediaQuery.of(context).size.width * 3 / 2,
                          height: 140,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return AuthorPushItemWidget();
            }, childCount: 20),
          ),
        ]);
  }
}
