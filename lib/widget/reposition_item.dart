import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github/common/iconfont.dart';
import 'package:flutter_github/pages/center/model/reposition_view.dart';
import 'package:flutter_github/pages/repository/repo_detail.dart';
import 'package:flutter_github/widget/user_icon.dart';
import 'package:flutter_github/widget/icon_text.dart';
import 'package:flutter_github/widget/flutter_github_card.dart';

class RepositionItemWidget extends StatelessWidget {
  final RepositionViewModel repositionViewModel;
  final VoidCallback onPressed;
  RepositionItemWidget(this.repositionViewModel,{Key key, this.onPressed}) : super(key: key);
  Widget _renderButtomItem(BuildContext context, IconData icon, String text,
      {int flex = 0}) {
    return Expanded(
      flex: 1,
      child: Container(
        alignment: Alignment.centerLeft,
        child: IconTextWidget(
          icon: icon,
          text: text,
      ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FgCardItemWidget(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                UserIconWidget(
                  image: repositionViewModel.ownerPic,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      repositionViewModel.ownerName ?? "",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    IconTextWidget(
                      key: ValueKey("FgIcons.community_dynamics"),
                      icon: FgIcons.community_dynamics,
                      text: repositionViewModel.ownerName ?? "",
                    ),
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(repositionViewModel.repositoryType ?? ""),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                repositionViewModel.repositoryDes?.trim() ?? "",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                _renderButtomItem(context, FgIcons.star, repositionViewModel.repositoryStar),
                _renderButtomItem(context, FgIcons.dynamic, repositionViewModel.repositoryType),
                _renderButtomItem(context, FgIcons.point, repositionViewModel.repositoryWatch)
              ],
            )
          ],
        ),
        onTap: onPressed,
      ),
    );
  }
}
