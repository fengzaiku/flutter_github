import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_github/common/iconfont.dart';
import 'package:flutter_github/pages/repository/bloc/repository_bloc.dart';
import 'package:flutter_github/pages/repository/bloc/repository_entry_bloc.dart';
//import 'package:flutter_github/utils/common_dialog.dart';
//import 'package:flutter_github/utils/create_widget.dart';
import 'package:flutter_github/widget/flutter_github_card.dart';
import 'package:flutter_github/widget/icon_text.dart';
import 'package:flutter_github/widget/row_select_divider_list.dart';
import 'package:flutter_github/widget/row_select_list.dart';
import 'package:flutter_github/utils/widget_standard.dart';
import 'package:provider/provider.dart';

class RepositionDynamicHeadCardWidget extends StatefulWidget {
  @override
  _RepositionDynamicHeadCardWidgetState createState() =>
      _RepositionDynamicHeadCardWidgetState();
}

class _RepositionDynamicHeadCardWidgetState
    extends State<RepositionDynamicHeadCardWidget> {

//  Widget _getIssueDetail(){
//    return Container(
//      child: Column(
//        children: createRepeatWidget([
//          RowSelectItem(selectKey: "12qwe3",selectValue: "qwe"),
//          RowSelectItem(selectKey: "12qwe3",selectValue: "lskdfj"),
//          RowSelectItem(selectKey: "12qwe3",selectValue: "ldskfjk"),
//        ], (item){
//          return RaisedButton(
//            onPressed: (){
//              Navigator.of(context).pop();
//            },
//            color: Colors.amberAccent,
//            child: Container(
//              width: 80,
//              alignment: Alignment.center,
//              child: Text(item.selectValue),
//            ),
//          );
//        }
//        ),
//      ),
//    );
//  }

  Widget _getRowSelectDividerList(ReposHeaderViewModel data) {
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
            selectKey: "start", selectValue: "${data?.repositoryStar}", selectIcon: FgIcons.star),
        RowSelectItem(
            selectKey: "fork",
            selectValue: "${data?.repositoryFork}",
            selectIcon: FgIcons.dynamic),
        RowSelectItem(
            selectKey: "watcher",
            selectValue: "${data?.repositoryWatch}",
            selectIcon: FgIcons.watcher),
        RowSelectItem(
            selectKey: "issue",
            selectValue: "${data?.repositoryIssue}",
            selectIcon: FgIcons.electrocardiogram),
      ],
      builder: (RowSelectItem item, int index) {
        return Expanded(
          child: Center(
            child: IconTextWidget(
              icon: item.selectIcon,
              iconColor: Colors.white,
//                      iconSpace: 2,
              iconSize: 14,
              text: item.selectValue,
              textStyle: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  Widget _getRepositionTags(ReposHeaderViewModel data) {
    if(data == null || data.topics == null){
      return SizedBox();
    }

    return RowSelectListWidget(
      items: data.topics.map((String string){
        return RowSelectItem(selectKey: string ?? "");
      }).toList(),
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
              item.selectKey,
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    RepositoryBloc repositoryDynamicBloc = Provider.of<RepositoryEntryBloc>(context).repositoryDynamicBloc;
    return StreamBuilder<ReposHeaderViewModel>(
      stream: repositoryDynamicBloc.repoHeaderObservable,
      builder: (BuildContext context, AsyncSnapshot<ReposHeaderViewModel> snapshot){
        return FgCardItemWidget(
          padding: EdgeInsets.all(0.0),
//          color: Colors.black,
          child: ClipRRect(
            borderRadius:BorderRadius.all(Radius.circular(4.0)),
            child: Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(snapshot.data?.ownerPic ?? "http://img95.699pic.com/photo/40166/2807.jpg_wh300.jpg")
                  )
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX:8.0,sigmaY: 1.0,),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text.rich(
                        TextSpan(
                          text: snapshot.data?.ownerName ?? "",
                          style: TextStyle(color: Colors.blue, fontSize: 18),
                          children: <TextSpan>[
                            TextSpan(
                              text: "/",
                              style: TextStyle(color: Colors.white),
                            ),
                            TextSpan(
                              text: snapshot.data?.repositoryName ?? "",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
//                    语言
                          Text(
                            "语言：${snapshot.data?.repositoryType}",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                          SizedBox(width: 10,),
//                    大小
                          Text(
                            "大小：${snapshot.data?.repositorySize}",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
//                协议
                      Text(
                        "协议：${snapshot.data?.license}",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          snapshot.data?.repositoryDes ?? "",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
//                创建时间
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        alignment: Alignment.centerRight,
                        child: Text(
                          "更新于${snapshot.data?.pushAt}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
//                上传时间
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "创建于${snapshot.data?.createdAt}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      _getRowSelectDividerList(snapshot.data),
                      _getRepositionTags(snapshot.data),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
