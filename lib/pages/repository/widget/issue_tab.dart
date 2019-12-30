import 'package:flutter/material.dart';
import 'package:flutter_github/utils/widget_standard.dart';
import 'package:flutter_github/widget/flutter_sliver_app_bar.dart';
import 'package:flutter_github/widget/row_select_divider_list.dart';

class IssueSelectListWidget extends StatelessWidget {
  final String selectKey;
  final ValueChanged onStateChange;

  IssueSelectListWidget({Key key, this.selectKey, this.onStateChange}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return FlutterSliverAppbarWidget(
      maxHeight:40,
      minHeight:40,
      pinned: true,
      floating: true,
      builder:(BuildContext context, double shrinkOffset, bool overlapsContent){
        double radius = (40 - shrinkOffset) / 40;
        return Container(
//          padding: EdgeInsets.only(left: radius * 10, right: radius * 10, top: radius * 10),
          color: Colors.white,
          child: RowSelectDividerListWidget(
            boxHeight: 40,
            indent: 5,
            endIndent: 5,
            margin: EdgeInsets.only(left: radius * 10, right: radius * 10, top: radius * 10),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(0))
            ),
            items: [
              RowSelectItem(selectKey:"all",selectValue: "全部"),
              RowSelectItem(selectKey:"open",selectValue: "打开"),
              RowSelectItem(selectKey:"closed",selectValue: "关闭"),
            ],
            builder: (RowSelectItem item,int index){
              return Expanded(
                child: RawMaterialButton(
                  constraints: BoxConstraints(minWidth: 0,minHeight: 0),
                  child: Text(item.selectValue,style: TextStyle(color: item.selectKey == selectKey ?  Colors.white : Colors.grey),),
                  onPressed: (){
                    onStateChange(item.selectKey);
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
