import 'package:flutter/material.dart';

class FgCardItemWidget extends StatelessWidget {
  final Widget child;
  final double elevation;
  final Color color;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final RoundedRectangleBorder shape;

  FgCardItemWidget({
    Key key,
    this.color,
    this.elevation = 5.0,
    this.shape,
    this.margin,
    this.child,
    this.padding
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = this.color;
    EdgeInsets margin = this.margin;
    EdgeInsets padding = this.padding;
    RoundedRectangleBorder shape = this.shape;

    color ??= Colors.white;
    margin ??= EdgeInsets.all(10);
    padding ??= EdgeInsets.all(10);
    shape ??= RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    );
    return Card(
      child: Padding(
        padding: padding,
        child: child,
      ),
      color: color,
      shape: shape,
      margin: margin,
      elevation: elevation,
    );
  }
}