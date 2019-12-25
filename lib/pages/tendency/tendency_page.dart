import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_github/common/const/api.dart';
import 'package:flutter_github/common/utils/http.dart';
import 'package:flutter_github/model/TrendingRepoModel.dart';
import 'package:flutter_github/pages/center/model/reposition_view.dart';
import 'package:flutter_github/pages/tendency/widget/tendency_header.dart';
import 'package:flutter_github/router/page_router.dart';
import 'package:flutter_github/store/app_state.dart';
import 'package:flutter_github/utils/html_utils.dart';
import 'package:flutter_github/utils/widget_standard.dart';
import 'package:flutter_github/widget/reposition_item.dart';
import 'package:flutter_redux/flutter_redux.dart';

class TendencyPageWidget extends StatefulWidget {
  TendencyPageWidget({Key key}) : super(key: key);

  @override
  _TendencyPageWidgetState createState() => _TendencyPageWidgetState();
}

class _TendencyPageWidgetState extends State<TendencyPageWidget> with AutomaticKeepAliveClientMixin<TendencyPageWidget>{
  List<TrendingRepoModel> trendingRepoModels = List();
  String selectTime;
  String selectType;

  @override
  void initState() {
    selectTime = trendTime(context)[0].selectKey;
    selectType = trendType(context)[0].selectKey;
    super.initState();
  }

  Future<void> _onRefresh() async{
    print("trendTime(context)[0].selectName-------------------${selectTime}");
    var result = await http.request(Api.getTrending(selectTime,selectType),null, Options(contentType: "text/plain; charset=utf-8", method: "get"));
    if(result != null){
      trendingRepoModels.clear();
      setState(() {
        trendingRepoModels.addAll(HtmlUtils.formatTrendingHtml(result));
      });
    }
  }

  void _trendTypeCallback(RowSelectItem trendType){
    Future.delayed(Duration(milliseconds: 0)).then((value){
      setState(() {
        selectTime = trendType.selectKey;
      });
      _onRefresh();
    });
  }

  void _trendTimeCallback(RowSelectItem trendTime){
    Future.delayed(Duration(milliseconds: 0)).then((value){
      setState(() {
        selectType = trendTime.selectKey;
      });
      _onRefresh();
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
      builder: (BuildContext context, store){
//        return EasyRefresh.custom(
//          onRefresh: _onRefresh,
//          firstRefresh: true,
//          slivers: <Widget>[
//            TendencyHeaderWidget(),
//            SliverList(
//              delegate: SliverChildBuilderDelegate(
//                    (BuildContext context, int index) {
//                    RepositionViewModel repositionViewModel = RepositionViewModel.fromTrendMap(trendingRepoModels[index]);
//                 return RepositionItemWidget(repositionViewModel);
//                },
//                childCount: trendingRepoModels.length,
//              ),
//            )
//          ],
//        );
        return EasyRefresh.custom(
          onRefresh: _onRefresh,
          firstRefresh: true,
          slivers: <Widget>[
            TendencyHeaderWidget(
              trendTime: trendTime(context),
              trendType: trendType(context),
              trendTimeCallback: _trendTimeCallback,
              trendTypeCallback: _trendTypeCallback,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                    RepositionViewModel repositionViewModel = RepositionViewModel.fromTrendMap(trendingRepoModels[index]);
                 return RepositionItemWidget(repositionViewModel, onPressed: (){
                   PageRouter.goToRepositionDetailPage(context, repositionViewModel);
                 },);
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

trendTime(context){
  return [
    RowSelectItem(selectKey: "daily",selectName: "今日"),
    RowSelectItem(selectKey: "weekly",selectName: "本周"),
    RowSelectItem(selectKey: "monthly",selectName: "本月"),
  ];
}
trendType(context){
  return [
    RowSelectItem(selectKey: null,selectName: "全部"),
    RowSelectItem(selectKey: "Java",selectName: "Java"),
    RowSelectItem(selectKey: "Kotlin",selectName: "Kotlin"),
    RowSelectItem(selectKey: "Dart",selectName: "Dart"),
    RowSelectItem(selectKey: "Objective-C",selectName: "Objective-C"),
    RowSelectItem(selectKey: "Swift",selectName: "Swift"),
    RowSelectItem(selectKey: "JavaScript",selectName: "JavaScript"),
    RowSelectItem(selectKey: "PHP",selectName: "PHP"),
    RowSelectItem(selectKey: "Go",selectName: "Go"),
    RowSelectItem(selectKey: "C++",selectName: "C++"),
    RowSelectItem(selectKey: "C",selectName: "C"),
    RowSelectItem(selectKey: "HTML",selectName: "HTML"),
    RowSelectItem(selectKey: "CSS",selectName: "CSS"),
    RowSelectItem(selectKey: "c%23",selectName: "C#"),
  ];
}