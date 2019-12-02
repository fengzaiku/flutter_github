import 'package:flutter/material.dart';
import 'package:flutter_github/common/iconfont.dart';
import 'package:flutter_github/widget/center_item_list.dart';
import 'package:flutter_github/widget/flutter_github_card.dart';
import 'package:flutter_github/widget/icon_text.dart';
import 'package:flutter_github/widget/row_select_divider_list.dart';
import 'package:flutter_github/widget/row_select_list.dart';

class RepositionDynamicHeadCardWidget extends StatefulWidget {
  @override
  _RepositionDynamicHeadCardWidgetState createState() =>
      _RepositionDynamicHeadCardWidgetState();
}

class _RepositionDynamicHeadCardWidgetState
    extends State<RepositionDynamicHeadCardWidget> {
  Map itemListMap = <String, Map>{
    "warehouse": {"name": "仓库", "value": 12},
    "fans": {"name": "粉丝", "value": 2},
    "attention": {"name": "关注", "value": 0},
    "star": {"name": "星标", "value": 2},
//    "glory": {"name": "荣耀", "value": 9},
  };

  void _jumpToChildrenPage(name) {
    print(name);
  }

  @override
  Widget build(BuildContext context) {
    return FgCardItemWidget(
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text.rich(
            TextSpan(
              text: "hecrj",
              style: TextStyle(color: Colors.blue, fontSize: 18),
              children: <TextSpan>[
                TextSpan(
                  text: "/",
                  style: TextStyle(color: Colors.white),
                ),
                TextSpan(
                  text: "jsdfjhds",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Text(
            "lskdfjlsdjflksdf",
            style: TextStyle(fontSize: 16,color: Colors.white),
          ),
          SizedBox(height: 5,),
          Text(
            "lskdfjlsdjflksdfasdasdasdasd",
            style: TextStyle(fontSize: 14,color: Colors.white),
          ),
          Container(
            margin: EdgeInsets.only(top: 5  ),
            alignment: Alignment.centerRight,
            child: Text("创建于2019-07-15", style: TextStyle(color: Colors.white),),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text("创建于2019-07-15", style: TextStyle(color: Colors.white),),
          ),
//          Container(
//            width: 400,
//            child: ,
//          ),
          RowSelectDividerListWidget(
            margin: EdgeInsets.only(top: 10),
//            padding: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                border: Border(
                    top: Divider.createBorderSide(context, color: Colors.white,width: 1)
                )
            ),
            items: <RowSelectItem>[
              RowSelectItem(selectKey: "start",selectValue: "100", selectIcon: FgIcons.star),
              RowSelectItem(selectKey: "dynamic",selectValue: "2", selectIcon: FgIcons.dynamic),
//              RowSelectItem(selectKey: "watcher",selectValue: "30", selectIcon: FgIcons.watcher),
//              RowSelectItem(selectKey: "issue",selectValue: "40", selectIcon: FgIcons.electrocardiogram),
            ],
            builder: (RowSelectItem item, int index){
              return Expanded(
                child: FlatButton(
                  child: IconTextWidget(
                    icon: item.selectIcon,
                    iconColor: Colors.white,
                    iconSize: 14,
                    text: item.selectValue,
                    textStyle: TextStyle(color: Colors.white),
                  ),
                  onPressed: (){
                    print("${item.selectKey}");
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
