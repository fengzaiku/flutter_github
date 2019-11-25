import 'package:flutter/material.dart';
import 'package:flutter_github/widget/refresh.dart';

class RefreshLoadedWidget extends StatefulWidget {
  final RefreshCallback onRefresh;

  final RefreshCallback onLoaded;

  final IndexedWidgetBuilder itemBuilder;

  final NestedScrollViewHeaderSliversBuilder headerSliverBuilder;

  RefreshLoadedWidget({
    Key key,
    this.onRefresh,
    this.onLoaded,
    this.headerSliverBuilder,
    @required this.itemBuilder,
  }) : super(key: key);

  @override
  _RefreshLoadedWidgetState createState() => _RefreshLoadedWidgetState();
}

class _RefreshLoadedWidgetState extends State<RefreshLoadedWidget> {

  Widget _getListItem(BuildContext context, int index) {
    return widget.itemBuilder(context,index);
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollViewRefreshIndicator(
      child: NestedScrollView(
          headerSliverBuilder: widget.headerSliverBuilder,
          body: NotificationListener(
            onNotification: (ScrollNotification notification) {
              print(notification);
            },
            child: ListView.builder(
              itemBuilder: _getListItem,
              itemCount: 30,
            ),
          )),
    );
  }
}
