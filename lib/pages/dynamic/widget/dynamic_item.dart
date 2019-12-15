import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github/model/Event.dart';
import 'package:flutter_github/pages/push/push_detail_page.dart';
import 'package:flutter_github/widget/flutter_github_card.dart';
import 'package:flutter_github/widget/user_icon.dart';

class DynamicItemWidget extends StatelessWidget {
  final bool            needUserIcon;
  final EventViewModel  eventViewItem;

  DynamicItemWidget({
    Key key,
    this.eventViewItem,
    this.needUserIcon = true,
  }) : super(key: key);

  Widget _renderDynamicHeader(){
    return needUserIcon ? Row(
      children: <Widget>[
        UserIconWidget(
//          image: eventViewItem.actionUserPic,
          onPressed: () {
            print("什么情况");
          },
        ),
        Text(eventViewItem.actionUser ?? "暂无数据"),
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
        Text(eventViewItem.actionUser ?? "暂无数据"),
        Expanded(
          child: Align(
            alignment: Alignment.topRight,
            child: Text(eventViewItem.actionTime ?? "暂无数据"),
//            child: Text(" 天前"),
          ),
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return FgCardItemWidget(
//      padding: EdgeInsets.all(10),
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
            Text("卡技术大会卡机但是空手道解放和看见士大夫"),
            SizedBox(
              height: 5,
            ),
            Text(
              "slkdfj螺丝扣搭街坊立刻撒旦解放善良的开房纪录时刻提防螺丝扣搭街坊立刻撒旦解放螺丝钉咖啡碱流口水的份螺丝钉咖啡碱老师肯定dslkfjkfjsljdflskjdflksldfjsdlkfjlskdflkj空手道解放和快速搭建",
              maxLines: 3,
              style: TextStyle(color: Colors.grey),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}


class EventViewModel {
  String actionUser;
  String actionUserPic;
  String actionDes;
  String actionTime;
  String actionTarget;

  EventViewModel.fromEventMap(Event event){
    actionUser    = event.actor.login;
    actionUserPic = event.actor?.avatarUrl;
    actionTime    = formatDate(event.createdAt, [yyyy,"-",mm,"-",dd]);
//    actionDes
//  actionTarget;
  }
}