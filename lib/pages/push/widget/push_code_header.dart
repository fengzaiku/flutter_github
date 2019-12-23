import 'package:flutter/material.dart';
import 'package:flutter_github/common/iconfont.dart';
import 'package:flutter_github/utils/widget_standard.dart';
import 'package:flutter_github/widget/flutter_github_card.dart';
import 'package:flutter_github/widget/icon_text.dart';
import 'package:flutter_github/widget/user_icon.dart';

class PushCodeHeaderWidget extends StatelessWidget {
  final PushHeaderViewModel pushHeaderViewModel;

  PushCodeHeaderWidget(this.pushHeaderViewModel,{Key key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return FgCardItemWidget(
      color: Colors.black87,
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UserIconWidget(
              image: pushHeaderViewModel.actionUserPic,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
//                变换状态
                Row(
                  children: <Widget>[
                    IconTextWidget(
                      icon: FgIcons.edit,
                      iconColor: Colors.white,
                      text: pushHeaderViewModel.editCount ?? 0,
                      textStyle: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    IconTextWidget(
                      icon: FgIcons.add,
                      iconColor: Colors.white,
                      text: pushHeaderViewModel.addCount ?? 0,
                      textStyle: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    IconTextWidget(
                      icon: FgIcons.reduce,
//                      iconSize: 12,
                      iconColor: Colors.white,
                      text: pushHeaderViewModel.deleteCount ?? 0,
                      textStyle: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
//                修改时间
                Text(
                    pushHeaderViewModel.pushTime ?? "",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: 6,
                ),
//                修改内容
                Text(
                  pushHeaderViewModel.pushDes ?? "",
                  style: TextStyle(color: Colors.white),
                )
              ],
            )
          ],
        ),
    );
  }
}