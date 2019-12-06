import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_github/pages/dynamic/widget/dynamic_item.dart';

class DynamicPageWidget extends StatefulWidget {
  DynamicPageWidget({Key key}) : super(key: key);

  @override
  _DynamicPageWidgetState createState() => _DynamicPageWidgetState();
}

class _DynamicPageWidgetState extends State<DynamicPageWidget> {
  @override
  Widget build(BuildContext context) {
    return EasyRefresh.custom(
      header: MaterialHeader(),
      footer: MaterialFooter(),
      onRefresh: () async {
        return Future.delayed(Duration(milliseconds: 1000));
      },
      onLoad: () async {
        return Future.delayed(Duration(milliseconds: 1000));
      },
      slivers: <Widget>[
        SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
          return DynamicItemWidget();
        }, childCount: 10)),
      ],
    );
  }
}
