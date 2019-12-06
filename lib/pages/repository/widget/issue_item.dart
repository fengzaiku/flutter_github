import 'package:flutter/material.dart';
import 'package:flutter_github/common/iconfont.dart';
import 'package:flutter_github/widget/flutter_github_card.dart';
import 'package:flutter_github/widget/icon_text.dart';
import 'package:flutter_github/widget/user_icon.dart';

class IssueListItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FgCardItemWidget(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UserIconWidget(),
          Expanded(
              child:Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("dahai",style: TextStyle(fontSize: 14),),
                      Text("9 天前",style: TextStyle(fontSize: 14, color: Colors.grey),)
                    ],
                  ),
                  SizedBox(height: 5,),
                  Text("拉萨扩大飞机螺丝扣江东父老看世界的方式来上课的房间里上空的飞机乐山大佛就是领导看",style: TextStyle(fontSize: 12, color: Colors.grey)),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          IconTextWidget(
                            icon: FgIcons.point,
                            iconColor: Colors.green,
                            iconSize: 12,
                            text: "closed",
                            textStyle: TextStyle(fontSize: 12, color: Colors.green),
                          ),
                          Text("#345345",style: TextStyle(fontSize: 12, color: Colors.grey))
                        ],
                      ),
                      IconTextWidget(
                        icon: FgIcons.information,
                        iconColor: Colors.grey,
                        iconSize: 12,
                        textStyle:TextStyle(fontSize: 12, color: Colors.grey) ,
                        text: "1",
                      ),
                    ],
                  )
                ],
              ),
          )
        ],
      ),
    );
  }
}
