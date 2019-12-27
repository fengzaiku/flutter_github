import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_github/pages/repository/widget/rep_dynamic_head_card.dart';
import 'package:flutter_github/pages/repository/widget/rep_detail_select_bar.dart';
import 'package:flutter_github/widget/flutter_sliver_app_bar.dart';

class RepositoryDynamicPageWidget extends StatefulWidget {
  @override
  _RepositoryDynamicPageWidgetState createState() =>
      _RepositoryDynamicPageWidgetState();
}

class _RepositoryDynamicPageWidgetState
    extends State<RepositoryDynamicPageWidget>{
  final GlobalKey<_RepositoryDynamicPageWidgetState> _repositoryDynamicKey = GlobalKey<_RepositoryDynamicPageWidgetState>();

  @override
  Widget build(BuildContext context) {
    return EasyRefresh.custom(
      key: _repositoryDynamicKey,
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: RepositionDynamicHeadCardWidget(),
        ),
        // 动态/提交 选项切换
        FlutterSliverAppbarWidget(
          pinned: true,
          minHeight: 45,
          maxHeight: 45,
          builder: (BuildContext context, double shrinkOffset, bool overlapsContent){
            return RepositionDetailSelectWidget(shrinkOffset);
          },
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
//              return DynamicItemWidget(needUserIcon: false,);
              return Text("DynamicItemWidget $index");
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
