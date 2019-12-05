import 'package:flutter/material.dart';
import 'package:flutter_github/pages/tendency/widget/tendency_header.dart';
import 'package:flutter_github/widget/reposition_item.dart';

class TendencyPageWidget extends StatefulWidget {
  TendencyPageWidget({Key key}) : super(key: key);

  @override
  _TendencyPageWidgetState createState() => _TendencyPageWidgetState();
}

class _TendencyPageWidgetState extends State<TendencyPageWidget>
    with SingleTickerProviderStateMixin {
  Future<void> _onRefreshGetDate() {
    return Future.delayed(Duration(milliseconds: 1000)).then((value) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _onRefreshGetDate,
        child: CustomScrollView(
          slivers: <Widget>[
            TendencyHeaderWidget(),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return RepositionItemWidget();
                },
                childCount: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
