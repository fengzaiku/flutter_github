import 'package:flutter/material.dart';
import 'package:flutter_github/widget/row_select_list.dart';

class RowSelectDividerListWidget extends StatelessWidget {
  final double                indent;
  final double                endIndent;
  final double                ratio;
  final List<RowSelectItem>   items;
  final WidgetFunctionBuilder builder;

  RowSelectDividerListWidget(
      {Key key,
      this.ratio,
      this.items,
      this.builder,
      this.indent,
      this.endIndent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RowSelectListWidget(
        margin:EdgeInsets.only(left: ratio * 10, right: ratio * 10),
        decoration: BoxDecoration(
          color:        Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(ratio * 4)),
        ),
        showDivider:  true,
        divider: DividerVertical(
            width: 1,
            indent: indent,
            endIndent: endIndent,
            color: Colors.white),
        items: items,
        builder: builder);
  }
}
