import 'package:flutter/material.dart';
import 'package:flutter_github/pages/tendency/tendency_page.dart';
import 'package:flutter_github/utils/widget_standard.dart';
import 'package:flutter_github/widget/flutter_sliver_app_bar.dart';

class TendencyHeaderWidget extends StatefulWidget {
  final List<RowSelectItem> trendTime;
  final List<RowSelectItem> trendType;
  final PopupMenuItemSelected<RowSelectItem> trendTimeCallback;
  final PopupMenuItemSelected<RowSelectItem> trendTypeCallback;

  TendencyHeaderWidget({Key key,this.trendTime,this.trendType,this.trendTimeCallback,this.trendTypeCallback}):super(key:key);

  @override
  _TendencyHeaderWidgetState createState() => _TendencyHeaderWidgetState();
}

class _TendencyHeaderWidgetState extends State<TendencyHeaderWidget> {
  RowSelectItem selectTime;
  RowSelectItem selectType;

  @override
  void initState() {
    selectTime = widget?.trendTime[0];
    selectType = widget?.trendType[0];
    super.initState();
  }
//  @override
//  void didChangeDependencies() {
//    setState(() {
//      selectTime = widget.trendTime[0];
//      selectType = widget.trendType[0];
//    });
//    super.didChangeDependencies();
//  }

  @override
  Widget build(BuildContext context) {
    return FlutterSliverAppbarWidget(
      pinned: true,
      minHeight: 65,
      maxHeight: 65,
      builder: (BuildContext context, double shrinkOffset,
          bool overlapsContent) {
        final double lr = 10 - shrinkOffset / 65 * 10;
        return Container(
          color: Colors.black,
          margin: EdgeInsets.only(
              bottom: 15, top: lr, left: lr, right: lr),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: PopupMenuButton<RowSelectItem>(
                    onSelected: (RowSelectItem result) {
                      setState(() {
                        selectTime = result;
                      });
                      widget.trendTimeCallback?.call(result);
                    },
                    offset: Offset(0, 65),
                    child: Center(
                      child: Text(
                        selectTime?.selectName ?? "",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    itemBuilder: (BuildContext context) {
                      List<PopupMenuEntry<RowSelectItem>> list = List();
                      widget.trendTime.forEach((RowSelectItem curSelectItem){
                        list.add(PopupMenuItem<RowSelectItem>(
                          value: curSelectItem,
                          child: ListTile(
                            title: Text(curSelectItem.selectName ?? ""),
                          ),
                        ));
                      });
                      return list;
                    }
                ),
              ),
              VerticalDivider(
                color: Colors.white,
                width: 1,
                thickness: 1,
                indent: 15,
                endIndent: 15,
              ),
              Expanded(
                child: PopupMenuButton<RowSelectItem>(
                    onSelected: (RowSelectItem result) {
                      setState(() {
                        selectType = result;
                      });
                      widget.trendTypeCallback?.call(result);
                    },
                    offset: Offset(0, 65),
                    child: Center(
                      child: Text(
                        selectType?.selectName ?? "",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    itemBuilder: (BuildContext context) {
                      List<PopupMenuEntry<RowSelectItem>> list = List();
                      widget.trendType.forEach((RowSelectItem curSelectType){
                        list.add(PopupMenuItem<RowSelectItem>(
                          value: curSelectType,
                          child: Text(curSelectType.selectName ?? ""),
                        ));
                      });
                      return list;
                    }
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
