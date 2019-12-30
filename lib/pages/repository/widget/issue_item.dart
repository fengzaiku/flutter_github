import 'package:flutter/material.dart';
import 'package:flutter_github/common/iconfont.dart';
import 'package:flutter_github/utils/widget_standard.dart';
import 'package:flutter_github/widget/flutter_github_card.dart';
import 'package:flutter_github/widget/icon_text.dart';
import 'package:flutter_github/widget/user_icon.dart';

class IssueListItemWidget extends StatelessWidget {
  final IssueItemViewModel issueItemViewModel;
  IssueListItemWidget(this.issueItemViewModel, {Key key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return FgCardItemWidget(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UserIconWidget(
            image: issueItemViewModel.actionUserPic ?? "http://img4.imgtn.bdimg.com/it/u=3539647612,3468243892&fm=26&gp=0.jpg",
          ),
          Expanded(
              child:Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("${issueItemViewModel.actionUser}",style: TextStyle(fontSize: 14),),
                      Text("${issueItemViewModel.actionTime}",style: TextStyle(fontSize: 14, color: Colors.grey),)
                    ],
                  ),
                  SizedBox(height: 5,),
                  Text("${issueItemViewModel.issueComment}",style: TextStyle(fontSize: 12, color: Colors.grey)),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          IconTextWidget(
                            icon: FgIcons.point,
                            iconColor: issueItemViewModel.state == "closed" ? Colors.green : Colors.red,
                            iconSize: 12,
                            text: "${issueItemViewModel.state}",
                            textStyle: TextStyle(fontSize: 12, color: issueItemViewModel.state == "closed" ? Colors.green : Colors.red),
                          ),
                          Text("${issueItemViewModel.issueTag}",style: TextStyle(fontSize: 12, color: Colors.grey))
                        ],
                      ),
                      IconTextWidget(
                        icon: FgIcons.information,
                        iconColor: Colors.grey,
                        iconSize: 12,
                        textStyle:TextStyle(fontSize: 12, color: Colors.grey) ,
                        text: "${issueItemViewModel.commentCount}",
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
