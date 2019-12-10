import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
//import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_github/pages/repository/widget/issue_item.dart';
import 'package:flutter_github/pages/repository/widget/issue_tab.dart';
import 'package:flutter_github/widget/search_input.dart';

class RepositionIssuePageWidget extends StatefulWidget {
  @override
  _RepositionIssuePageWidgetState createState() =>
      _RepositionIssuePageWidgetState();
}

class _RepositionIssuePageWidgetState extends State<RepositionIssuePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        flexibleSpace: SearchInputWidget(),
        backgroundColor: Colors.white70,
      ),
      body: EasyRefresh.custom(
//          header: MaterialHeader(),
          footer: MaterialFooter(),
          onRefresh: () async {
            return await Future.delayed(Duration(milliseconds: 1000));
          },
          onLoad: () async {
            return await Future.delayed(Duration(milliseconds: 1000));
          },
          slivers: <Widget>[
            IssueSelectListWidget(),
            SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
//                return Text("顺利打开附件是扩大飞机");
                return IssueListItemWidget();
              }, childCount: 10),
            )
          ]),
    );
  }
}
