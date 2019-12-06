import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_github/widget/reposition_item.dart';
class ReadHistoryPageWidget extends StatefulWidget {
  @override
  _ReadHistoryPageWidgetState createState() => _ReadHistoryPageWidgetState();
}

class _ReadHistoryPageWidgetState extends State<ReadHistoryPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("撒开绿灯解放"),
        ),
        body: EasyRefresh.custom(
          header: MaterialHeader(),
          footer: MaterialFooter(),
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 2), () {
              setState(() {
//            _count = 20;
              });
            });
          },
          onLoad: () async {
            await Future.delayed(Duration(seconds: 2), () {
              setState(() {
//            _count = 20;
              });
            });
          },
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index){
                      return RepositionItemWidget();
                    },
                    childCount: 20
                ),
              )
            ]
        ),
      ),
    );
  }
}
