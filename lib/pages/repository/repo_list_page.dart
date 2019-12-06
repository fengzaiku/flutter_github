import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_github/widget/reposition_item.dart';

class RepositoryListWidget extends StatefulWidget {
  @override
  _RepositoryListWidgetState createState() => _RepositoryListWidgetState();
}

class _RepositoryListWidgetState extends State<RepositoryListWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(title: Text("仓库列表")),
        body: EasyRefresh.custom(
          header: MaterialHeader(),
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 2), () {
              setState(() {
//                _count = 20;
              });
            });
          },
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return RepositionItemWidget();
                },
                childCount: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
