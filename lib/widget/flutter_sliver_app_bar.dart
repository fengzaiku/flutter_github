import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_github/widget/sliver_persistent_header_delegate.dart';

typedef SliverBuilder = Widget Function(
    BuildContext context, double shrinkOffset, bool overlapsContent);

class FlutterSliverAppbarWidget extends StatefulWidget {
  final bool          pinned;
  final bool          floating;
  final SliverBuilder builder;
  final double        minHeight;
  final double        maxHeight;

  FlutterSliverAppbarWidget(
      {Key key,
      this.pinned   = false,
      this.floating = false,
      this.builder,
      this.maxHeight,
      this.minHeight})
      : super(key: key);

  @override
  _FlutterSliverAppbarWidgetState createState() =>
      _FlutterSliverAppbarWidgetState();
}

class _FlutterSliverAppbarWidgetState extends State<FlutterSliverAppbarWidget>
    with TickerProviderStateMixin {

//  final _flutterSliverApp = GlobalKey<ScaffoldState>();
  final _flutterSliverApp = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      key: _flutterSliverApp,
      pinned: widget?.pinned ?? false,
      floating: widget?.floating ?? false,
      delegate: SliverPersistentHeaderDelegateWidget(
        minHeight: widget.minHeight,
        maxHeight: widget.maxHeight,
        snapConfig: FloatingHeaderSnapConfiguration(vsync: this),
//        builder: widget.builder,
        builder:
            (BuildContext context, double shrinkOffset, bool overlapsContent) {
          return widget.builder(context, shrinkOffset, overlapsContent);
        },
      ),
    );
  }
}
