import 'package:flutter/material.dart';
import 'package:flutter_github/widget/refresh.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
    if (index == 29) {
      return _buildProgressIndicator();
    }
    return widget.itemBuilder(context, index);
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollViewRefreshIndicator(
      child: NestedScrollView(
          headerSliverBuilder: widget.headerSliverBuilder,
          body: NotificationListener(
            onNotification: (ScrollNotification notification) {
                print("---------------------------------------------------------------------");
                print("notification.depth1-------------------------${notification.depth}");
              if(notification.metrics.pixels >= notification.metrics.maxScrollExtent){
                return true;
              }
//              print(notification);
              return false;
            },
            child: ListView.builder(
              itemBuilder: _getListItem,
              itemCount: 30,
            ),
          )),
    );
  }

  Widget _buildProgressIndicator() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SpinKitThreeBounce(
            color: Colors.black87,
            size: 25,
            duration: Duration(milliseconds: 800),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "已全部加载",
            style: TextStyle(color: Colors.black87, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
