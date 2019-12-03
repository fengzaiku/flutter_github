import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_github/common/iconfont.dart';
import 'package:flutter_github/utils/common_dialog.dart';
import 'package:flutter_github/utils/create_widget.dart';
import 'package:flutter_github/widget/flutter_github_card.dart';
import 'package:flutter_github/widget/icon_text.dart';
import 'package:flutter_github/widget/row_select_divider_list.dart';
import 'package:flutter_github/widget/row_select_list.dart';
import 'package:flutter_github/utils/widget_standard.dart';

class RepositionDynamicHeadCardWidget extends StatefulWidget {
  @override
  _RepositionDynamicHeadCardWidgetState createState() =>
      _RepositionDynamicHeadCardWidgetState();
}

class _RepositionDynamicHeadCardWidgetState
    extends State<RepositionDynamicHeadCardWidget> {

  Widget _getIssueDetail(){

    return Container(
      child: Column(
        children: createRepeatWidget([
          RowSelectItem(selectKey: "12qwe3",selectValue: "qwe"),
          RowSelectItem(selectKey: "12qwe3",selectValue: "lskdfj"),
          RowSelectItem(selectKey: "12qwe3",selectValue: "ldskfjk"),
        ], (item){
          return RaisedButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            color: Colors.amberAccent,
            child: Container(
              width: 80,
              alignment: Alignment.center,
              child: Text(item.selectValue),
            ),
          );
        }
        ),
      ),
    );
  }

  Widget _getRowSelectDividerList() {
    return RowSelectDividerListWidget(
      margin: EdgeInsets.only(top: 20),
      boxHeight: 50,
      indent: 15,
      endIndent: 15,
      decoration: BoxDecoration(
          border: Border(
              top: Divider.createBorderSide(context,
                  color: Colors.white, width: 1))),
      items: <RowSelectItem>[
        RowSelectItem(
            selectKey: "start", selectValue: "100", selectIcon: FgIcons.star),
        RowSelectItem(
            selectKey: "dynamic",
            selectValue: "2",
            selectIcon: FgIcons.dynamic),
        RowSelectItem(
            selectKey: "start", selectValue: "100", selectIcon: FgIcons.star),
        RowSelectItem(
            selectKey: "watcher",
            selectValue: "30",
            selectIcon: FgIcons.watcher),
        RowSelectItem(
            selectKey: "issue",
            selectValue: "40",
            selectIcon: FgIcons.electrocardiogram),
      ],
      builder: (RowSelectItem item, int index) {
        return Expanded(
          child: GestureDetector(
            child: IconTextWidget(
              icon: item.selectIcon,
              iconColor: Colors.white,
//                      iconSpace: 2,
              iconSize: 14,
              text: item.selectValue,
              textStyle: TextStyle(color: Colors.white),
            ),
            onTap: () {
              print("${item.selectKey}");
              if (item.selectKey == "issue") {
                CommonDialog.flutterGitHubDialog(context, _getIssueDetail());
              }
            },
          ),
        );
      },
    );
  }

  Widget _getRepositionTags() {
    return RowSelectListWidget(
      items: <RowSelectItem>[
        RowSelectItem(selectKey: "cli", selectValue: "cli"),
        RowSelectItem(selectKey: "information", selectValue: "information"),
        RowSelectItem(selectKey: "linux", selectValue: "linux"),
        RowSelectItem(selectKey: "maos", selectValue: "maos"),
        RowSelectItem(selectKey: "osint", selectValue: "osint"),
        RowSelectItem(selectKey: "start", selectValue: "start"),
        RowSelectItem(selectKey: "dynamic", selectValue: "dynamic"),
        RowSelectItem(selectKey: "watcher", selectValue: "watcher"),
        RowSelectItem(selectKey: "issue", selectValue: "issue"),
      ],
      showWrap: true,
      spacing: 10,
      runSpacing: 10,
      builder: (RowSelectItem item, int index) {
        return RawMaterialButton(
          onPressed: () {
            print(item.selectKey);
          },
          padding: EdgeInsets.all(0.0),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          constraints: BoxConstraints(minHeight: 0.0, minWidth: 0.0),
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white30,
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: Text(
              item.selectValue,
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FgCardItemWidget(
      color: Colors.black,
      child: IntrinsicHeight(
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
            SizedBox(
              height: 10,
            ),
            Text(
              "lskdfjlsdjflksdf",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "lskdfjlsdjflksdfasdasdasdasd",
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              alignment: Alignment.centerRight,
              child: Text(
                "创建于2019-07-15",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "创建于2019-07-15",
                style: TextStyle(color: Colors.white),
              ),
            ),
            _getRowSelectDividerList(),
            _getRepositionTags(),
          ],
        ),
      ),
    );
  }
}
