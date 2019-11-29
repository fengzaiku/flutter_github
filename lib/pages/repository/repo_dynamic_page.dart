import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_github/widget/sliver_persistent_header_delegate.dart';

class RepositoryDynamicPageWidget extends StatefulWidget {
  @override
  _RepositoryDynamicPageWidgetState createState() =>
      _RepositoryDynamicPageWidgetState();
}

class _RepositoryDynamicPageWidgetState
    extends State<RepositoryDynamicPageWidget> with TickerProviderStateMixin<RepositoryDynamicPageWidget>{
  @override
  Widget build(BuildContext context) {
    return EasyRefresh.custom(
      header: MaterialHeader(),
      slivers: <Widget>[
//        SliverAppBar(
//          elevation: 5,
//          leading: Container(
//            child: Text('text'),
//          ),
//          forceElevated: true,
//          expandedHeight: 250.0,
//          floating: true,
////          snap: true,
////          pinned: true,
//          flexibleSpace: FlexibleSpaceBar(
//            title: const Text('SliverAppBar'),
//            background: Image.network(
//              'https://cn.bing.com/th?id=OIP.xq1C2fmnSw5DEoRMC86vJwD6D6&pid=Api&rs=1',
//              fit: BoxFit.fill,
//            ),
//            //标题是否居中
//            centerTitle: true,
//            //标题间距
//            titlePadding: EdgeInsetsDirectional.only(start: 0, bottom: 16),
//            collapseMode: CollapseMode.none,
//          ),
//        ),
        SliverPersistentHeader(
          pinned: true,
          delegate: SliverPersistentHeaderDelegateWidget(
            minHeight: 150,
            maxHeight: 150,
            snapConfig: FloatingHeaderSnapConfiguration(
              vsync: this
            ),
            builder: (BuildContext context, double shrinkOffset, bool overlapsContent){
              return Container(
                height: 100,
                child: Text("这里石头"),
              );
            }
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Container(
                child: Text("text $index"),
              );
            },
            childCount: 40,
          ),
        ),
      ],
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 2), () {
          setState(() {
//            _count = 20;
          });
        });
      },
    );
  }
}
