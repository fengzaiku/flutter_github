import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_github/common/iconfont.dart';
import 'package:flutter_github/utils/widget_standard.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

class AppBarActionWidget extends StatefulWidget {
  final String url;
  List<RowSelectItem> extraPopupMenuItems;

  AppBarActionWidget({
    Key key,
    @required this.url,
    this.extraPopupMenuItems,
  }) : super(key:key);
  @override
  _AppBarActionWidgetState createState() => _AppBarActionWidgetState();
}

class _AppBarActionWidgetState extends State<AppBarActionWidget> {

  Future launchUrl(String url) async {
    if(await canLaunch(url)){
      await launch(url);
    }
  }

  Future goToShare(context, url) async {
    final RenderBox box = context.findRenderObject();
    Share.share(widget.url,
        subject: "Flutter_github 分享",
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size
    ).then((result){
      print("share-result-----------------------------结果123");
    });

  }

  Future toClipboard(url) async {
    Clipboard.setData(ClipboardData(text: widget.url)).then((result){
      print("share-result-----------------------------结果");
    });
  }

  @override
  Widget build(BuildContext context) {

    List<RowSelectItem> popupMenuItems = [
      RowSelectItem(
          selectKey: "BrowserOpen",
          selectName: "浏览器打开",
          onSelected: () {
            launchUrl(widget.url);
          }
      ),
      RowSelectItem(
          selectKey: "BrowserOpen",
          selectName: "复制链接",
          onSelected: (){
            toClipboard(widget.url);
          }
      ),
      RowSelectItem(
          selectKey: "Share",
          selectName: "分享",
          onSelected: (){
            goToShare(context, widget.url);
          }
      ),
    ];

    List<PopupMenuItem> readerPopupMenuItem(List<RowSelectItem> list) {
      return list.map((RowSelectItem selectItem){
        return PopupMenuItem(
          value: selectItem,
          child: Text('${selectItem.selectName}'),
        );
      }).toList();
    }

    return PopupMenuButton(
      onCanceled: () {},
      onSelected: (select) {
        print("select-----------------------------$select");
        select.onSelected?.call();
      },
      child: Icon(FgIcons.ellipsis),
      itemBuilder: (BuildContext context) {
        return readerPopupMenuItem([...popupMenuItems, ...?widget.extraPopupMenuItems]);
      },
    );
  }
}

