import 'package:flutter/material.dart';
import 'package:flutter_github/widget/row_select_list.dart';
import 'package:flutter_github/utils/widget_standard.dart';

class RowSelectDividerListWidget extends StatelessWidget {
  final double                      indent;
  final double                      endIndent;
  final double                      ratio;
  final double                      boxHeight;
  final List<RowSelectItem>         items;
  final WidgetFunctionBuilder       builder;
  final EdgeInsetsGeometry          margin;
  final EdgeInsetsGeometry          padding;
  final Decoration                  decoration;
  RowSelectDividerListWidget(
      {Key key,
      this.ratio = 1,
      this.items,
      this.builder,
      this.indent,
        this.margin,
        this.padding,
        this.boxHeight,
        this.decoration,
      this.endIndent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RowSelectListWidget(
        margin: margin ?? EdgeInsets.only(left: ratio * 10, right: ratio * 10),
        padding: padding,
        boxHeight: boxHeight,
        decoration: decoration ?? BoxDecoration(
          color:        Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(ratio * 4)),
        ),
        showDivider:  true,
        divider: DividerVertical(
            width: 1,
            indent: indent,
            thickness: 1,
            endIndent: endIndent,
            color: Colors.white),
        items: items,
        builder: builder);
  }
}
