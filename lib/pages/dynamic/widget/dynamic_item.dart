import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github/pages/push/push_detail_page.dart';
import 'package:flutter_github/utils/widget_standard.dart';
import 'package:flutter_github/widget/flutter_github_card.dart';
import 'package:flutter_github/widget/user_icon.dart';

class DynamicItemWidget extends StatelessWidget {
  final bool            needUserIcon;
  final EventViewModel  eventViewItem;

  DynamicItemWidget(this.eventViewItem,{
    Key key,
    this.needUserIcon = true,
  }) : super(key: key);

  Widget _renderDynamicHeader(){
    return needUserIcon ? Row(
      children: <Widget>[
        UserIconWidget(
          image: eventViewItem?.actionUserPic,
          onPressed: () {
            print("什么情况");
          },
        ),
        Text(eventViewItem?.actionUser ?? "暂无数据"),
        Expanded(
          child: Align(
            alignment: Alignment.topRight,
            child: Text(eventViewItem.actionTime  ?? "暂无数据"),
//            child: Text(" 天前"),
          ),
        )
      ],
    ) : Row(
      children: <Widget>[
        Text(eventViewItem?.actionUser ?? "暂无数据"),
        Expanded(
          child: Align(
            alignment: Alignment.topRight,
            child: Text(eventViewItem?.actionTime ?? "暂无数据"),
//            child: Text(" 天前"),
          ),
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return eventViewItem != null ? FgCardItemWidget(
      child: FlatButton(
        onPressed: () {
          Navigator.push(context,
              CupertinoPageRoute(builder: (context) => PushDetailPageWidget()));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _renderDynamicHeader(),
            Text(eventViewItem?.actionDes),
            SizedBox(
              height: 5,
            ),
            Text(
              eventViewItem?.actionTarget,
              maxLines: 3,
              style: TextStyle(color: Colors.grey),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    ) : Container(
      child: Text("数据不存在"),
    );
  }
}