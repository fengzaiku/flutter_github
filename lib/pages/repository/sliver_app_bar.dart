import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_github/pages/repository/widget/rep_detail_select_bar.dart';
import 'package:flutter_github/widget/sliver_persistent_header_delegate.dart';

class CustomerSliverAppbarWidget extends StatefulWidget {
  @override
  _CustomerSliverAppbarWidgetState createState() =>
      _CustomerSliverAppbarWidgetState();
}

class _CustomerSliverAppbarWidgetState extends State<CustomerSliverAppbarWidget>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
//      floating: true,
      delegate: SliverPersistentHeaderDelegateWidget(
        minHeight: 45,
        maxHeight: 45,
        snapConfig: FloatingHeaderSnapConfiguration(
            vsync: this
        ),
        builder: (BuildContext context, double shrinkOffset, bool overlapsContent){
//          return RepositionDetailSelectWidget();
          return RepositionDetailSelectWidget(shrinkOffset);
        },
      ),
    );
  }
}
