import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
//import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_github/pages/push/widget/push_code_header.dart';
import 'package:flutter_github/pages/push/widget/push_code_item.dart';

class PushDetailPageWidget extends StatefulWidget {
  @override
  _PushDetailPageWidgetState createState() => _PushDetailPageWidgetState();
}

class _PushDetailPageWidgetState extends State<PushDetailPageWidget> {
  final GlobalKey<_PushDetailPageWidgetState> _pushDetailPage= GlobalKey();
  EasyRefreshController _controller;
  int _count = 20;

  @override
  void initState() {
    _controller = EasyRefreshController();
    super.initState();
  }

//  @override
//  void dispose() {
//    super.dispose();
//    _controller.dispose();
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("push 详情页"),
      ),
      body:  EasyRefresh.custom(
        key: _pushDetailPage,
        controller: _controller,
//        header: MaterialHeader(),
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2), () {
            if(!mounted)return;
            setState(() {
              _count = 20;
            });
          });
        },
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: PushCodeHeaderWidget(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return PushCodeItemWidget();
              },
              childCount: _count,
//              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
