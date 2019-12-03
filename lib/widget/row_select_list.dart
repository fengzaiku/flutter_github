import 'package:flutter/material.dart';
import 'package:flutter_github/utils/widget_standard.dart';

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

  final double                      spacing;
  final double                      runSpacing;

  bool    showDivider;
  bool    showWrap;
  RowSelectListWidget(
      {
        Key key,
        @required this.items,
        @required this.builder,
        this.boxWidth,
        this.boxHeight,
        this.showDivider = false,
        this.showWrap = false,
        this.divider,
        this.margin,
        this.padding,
        this.color,
        this.decoration,
        this.spacing,
        this.runSpacing,
        this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
        this.crossAxisAlignment = CrossAxisAlignment.center,
      }) : super(key: key);

  List<Widget> _getSelectList() {
    final List<Widget> selects = List();
    for (int i = 0; i < items.length; i++) {

      selects.add(builder(items[i], i));

      if (showDivider && i < (items.length - 1) && !showWrap) {
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
    return IntrinsicHeight(
      child: Container(
        width:      boxWidth == null ? MediaQuery.of(context).size.width : boxWidth,
        height:     boxHeight,
        margin:     margin,
        padding:    padding,
        decoration: decoration,
        color:      color,
        child: showWrap ? Wrap(
          spacing: spacing?? 0.0,
          runSpacing: runSpacing??0.0,
          children: _getSelectList(),
        ) : Row(
          crossAxisAlignment: crossAxisAlignment,
          mainAxisAlignment: mainAxisAlignment,
          children: _getSelectList(),
        ),
      ),
    );
  }
}
