import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
      floating: true,
      delegate: SliverPersistentHeaderDelegateWidget(
        minHeight: 65,
        maxHeight: 65,
        snapConfig: FloatingHeaderSnapConfiguration(
            vsync: this
        ),
        builder: (BuildContext context, double shrinkOffset, bool overlapsContent){
          print("shrinkOffset--------------------$shrinkOffset");
          return Container(
            color: Colors.black87,
            child: Center(
              child: Text("世界你好吗？"),
            ),
          );
        },
      ),
    );
  }
}
