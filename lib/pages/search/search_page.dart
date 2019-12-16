import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_github/pages/search/widget/search_filter_list.dart';
//import 'package:flutter_github/common/iconfont.dart';
import 'package:flutter_github/pages/search/widget/search_select_bar.dart';
//import 'package:flutter_github/pages/user/widget/user_item.dart';
import 'package:flutter_github/widget/flutter_sliver_app_bar.dart';
import 'package:flutter_github/widget/reposition_item.dart';
import 'package:flutter_github/widget/search_input.dart';

class SearchPageWidget extends StatefulWidget {
  @override
  _SearchPageWidgetState createState() => _SearchPageWidgetState();
}

class _SearchPageWidgetState extends State<SearchPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: SearchFilterListWidget(),
        appBar: AppBar(
          title: Text("搜索"),
//          actions: <Widget>[
//            IconButton(
//              icon: Icon(FgIcons.menus),
//              onPressed: () {
//                print("展示菜单");
//              },
//            )
//          ],
        ),
        body: EasyRefresh.custom(
            slivers: [
              FlutterSliverAppbarWidget(
                pinned: true,
                floating: true,
                minHeight: 110,
                maxHeight: 110,
                builder: (BuildContext context, double shrinkOffset, bool overlapsContent){
                  return Column(
                    children: <Widget>[
                      SearchInputWidget(),
                      SearchSelectListWidget()
                    ],
                  );
                },
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index){
                  return Text("RepositionItemWidget $index");
//                  return RepositionItemWidget();
//                  return UserItemWidget();
                },childCount: 10),
              )
            ]
        ),
    );
  }
}
