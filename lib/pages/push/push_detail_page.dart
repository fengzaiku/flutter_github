import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_github/pages/push/widget/push_code_header.dart';
import 'package:flutter_github/pages/push/widget/push_code_item.dart';

class PushDetailPageWidget extends StatefulWidget {
  @override
  _PushDetailPageWidgetState createState() => _PushDetailPageWidgetState();
}

class _PushDetailPageWidgetState extends State<PushDetailPageWidget> {
  int _count = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("push 详情页"),
      ),
      body:  EasyRefresh.custom(
        header: MaterialHeader(),
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2), () {
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
            ),
          ),
        ],
      ),
    );
  }
}
