import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SliverPersistentHeaderDelegateWidget extends SliverPersistentHeaderDelegate{

  SliverPersistentHeaderDelegateWidget({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.snapConfig,
    this.child,
    this.builder
  });

  final double maxHeight;
  final double minHeight;
  final Widget child;
  final Builder builder;
  final FloatingHeaderSnapConfiguration snapConfig;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent){
    return builder != null ? builder(context, shrinkOffset, overlapsContent) : child;
  }

  @override
  double get minExtent => minHeight;
  
  @override
  double get maxExtent => maxHeight;

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => snapConfig;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate){
    return true;
  }
}
typedef Widget Builder(BuildContext context, double shrinkOffset, bool overlapsContent);