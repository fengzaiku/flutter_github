import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_github/common/const/api.dart';
import 'package:flutter_github/common/utils/http.dart';
import 'package:flutter_github/model/EventList.dart';
//import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_github/pages/dynamic/widget/dynamic_item.dart';
import 'package:flutter_github/store/app_state.dart';
import 'package:flutter_github/utils/widget_standard.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class DynamicPageWidget extends StatefulWidget {
  DynamicPageWidget({Key key}) : super(key: key);

  @override
  _DynamicPageWidgetState createState() => _DynamicPageWidgetState();
}

class _DynamicPageWidgetState extends State<DynamicPageWidget>{
  final GlobalKey<_DynamicPageWidgetState> _dynamicKey = new GlobalKey();
  EasyRefreshController _controller;
  int page = 0;
  List eventList = List();
  Future<void> _onReferesh() async {
    page = 0;
    eventList.clear();
    await _onLoadMore();
  }

  Store<AppState> _getStore(){
    return StoreProvider.of<AppState>(context);
  }

  Future<void> _onLoadMore() async {
    var result = await http.get(Api.getEventReceived(_getStore().state.userInfo?.login) + Api.getPageParams(page));
    if(result.length > 0) {
      EventList events = EventList.fromJson({"eventList": result});
      page ++;
      setState(() {
        eventList.addAll(events.eventList);
      });
    }
  }


  @override
  void initState() {
    _controller = EasyRefreshController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh.custom(
      key: _dynamicKey,
      controller: _controller,
//      header: MaterialHeader(),
      firstRefresh: true,
      footer: MaterialFooter(),
      onRefresh: _onReferesh,
      onLoad: _onLoadMore,
      slivers: <Widget>[
        SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
          return DynamicItemWidget(EventViewModel.fromEventMap(eventList[index]));
        }, childCount: eventList.length),),
      ],
    );
  }
}
