import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github/common/iconfont.dart';
import 'package:flutter_github/pages/code/code_detail.dart';
import 'package:flutter_github/utils/widget_standard.dart';
import 'package:flutter_github/widget/flutter_github_card.dart';

class PushCodeItemWidget extends StatelessWidget {
  final PushCodeItemViewModel pushCodeItemViewModel;
  final VoidCallback          onPressd;

  PushCodeItemWidget(this.pushCodeItemViewModel,{Key key,this.onPressd}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Text(
            pushCodeItemViewModel.path ?? "",
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
        ),
        FgCardItemWidget(padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 15),
          child: ListTile(
            leading: Icon(FgIcons.code),
            title: Text(
              pushCodeItemViewModel.name ?? "",
              style: TextStyle(fontSize: 14),
            ),
            onTap: onPressd,
          ),
        ),
      ],
    );
  }
}
