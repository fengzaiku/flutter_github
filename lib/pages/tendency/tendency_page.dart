import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_github/common/const/api.dart';
import 'package:flutter_github/common/utils/http.dart';
import 'package:flutter_github/model/TrendingRepoModel.dart';
import 'package:flutter_github/pages/center/model/reposition_view.dart';
import 'package:flutter_github/pages/tendency/widget/tendency_header.dart';
import 'package:flutter_github/store/app_state.dart';
// import 'package:flutter_github/store/async_reducers/trend_reducer.dart';
import 'package:flutter_github/utils/html_utils.dart';
import 'package:flutter_github/widget/reposition_item.dart';
import 'package:flutter_redux/flutter_redux.dart';
// import 'package:redux/redux.dart';

class TendencyPageWidget extends StatefulWidget {
  TendencyPageWidget({Key key}) : super(key: key);

  @override
  _TendencyPageWidgetState createState() => _TendencyPageWidgetState();
}

class _TendencyPageWidgetState extends State<TendencyPageWidget>{
  List<TrendingRepoModel> trendingRepoModels = List();
//   Future<void> _onRefreshGetDate() async{
//     Store store = StoreProvider.of<AppState>(context);
//     store.dispatch(getTrendingList());
// //    return Future.delayed(Duration(milliseconds: 1000)).then((value) {});

// //    getTrendingList
//   }
  Future<void> _onRefresh() async{
    var result = await http.request(Api.getTrending("daily", "Java"),null, Options(contentType: "text/plain; charset=utf-8", method: "get"));
    if(result != null){
      trendingRepoModels.clear();
      setState(() {
        trendingRepoModels.addAll(HtmlUtils.formatTrendingHtml(result));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
      builder: (BuildContext context, store){
        return EasyRefresh.custom(
          onRefresh: _onRefresh,
          firstRefresh: true,
          slivers: <Widget>[
            TendencyHeaderWidget(),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                    RepositionViewModel repositionViewModel = RepositionViewModel.fromTrendMap(trendingRepoModels[index]);
                 return RepositionItemWidget(repositionViewModel);
                },
                childCount: trendingRepoModels.length,
              ),
            )
          ],
        );
      },
    );
  }
}
