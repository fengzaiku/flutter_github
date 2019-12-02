import 'package:flutter/material.dart';

class DividerVertical {
  double  width;
  double  thickness;
  double  indent;
  double  endIndent;
  Color   color;

  DividerVertical(
      {this.width, this.thickness, this.indent, this.endIndent, this.color});
}

class RowSelectItem {
  String  selectKey;
  dynamic selectValue;

  RowSelectItem({
    this.selectKey,
    this.selectValue,
  });
}

typedef WidgetFunctionBuilder = Widget Function(RowSelectItem item, int index);

class RowSelectListWidget extends StatelessWidget {
  final List                        items;
  final WidgetFunctionBuilder       builder;
  final DividerVertical             divider;
  final double                      boxWidth;
  final double                      boxHeight;
  final EdgeInsetsGeometry          margin;
  final EdgeInsetsGeometry          padding;
  final Decoration                  decoration;
  final Color                       color;
  final CrossAxisAlignment          crossAxisAlignment;
  final MainAxisAlignment           mainAxisAlignment;


  bool showDivider;

  RowSelectListWidget(
      {
        Key key,
        @required this.items,
        @required this.builder,
        this.boxWidth,
        this.boxHeight,
        this.showDivider = false,
        this.divider,
        this.margin,
        this.padding,
        this.decoration,
        this.color,
        this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
        this.crossAxisAlignment = CrossAxisAlignment.center,
      }) : super(key: key);

  List<Widget> _getSelectList() {
    final List<Widget> selects = List();
    for (int i = 0; i < items.length; i++) {

      selects.add(builder(items[i], i));

      if (showDivider && i < (items.length - 1)) {
        selects.add(VerticalDivider(
          width:      divider?.width,
          thickness:  divider?.thickness,
          indent:     divider?.indent,
          endIndent:  divider?.endIndent,
          color:      divider?.color,
        ));
      }
    }
    return selects;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width:      boxWidth == null ? MediaQuery.of(context).size.width : boxWidth,
      height:     boxHeight,
      margin:     margin,
      padding:    padding,
      decoration: decoration,
      color:      color,
      child:Row(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisAlignment: mainAxisAlignment,
        children: _getSelectList(),
      ),
    );
  }
}
