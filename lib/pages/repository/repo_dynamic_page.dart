import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_github/pages/repository/sliver_app_bar.dart';
import 'package:flutter_github/pages/repository/widget/rep_dynamic_head_card.dart';
import 'package:flutter_github/widget/sliver_persistent_header_delegate.dart';

class RepositoryDynamicPageWidget extends StatefulWidget {
  @override
  _RepositoryDynamicPageWidgetState createState() =>
      _RepositoryDynamicPageWidgetState();
}

class _RepositoryDynamicPageWidgetState
    extends State<RepositoryDynamicPageWidget> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return EasyRefresh.custom(
      header: MaterialHeader(),
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: RepositionDynamicHeadCardWidget(),
        ),
        CustomerSliverAppbarWidget(),
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
