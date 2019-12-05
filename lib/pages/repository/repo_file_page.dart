import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github/common/iconfont.dart';
import 'package:flutter_github/pages/code/code_detail.dart';
import 'package:flutter_github/widget/flutter_github_card.dart';

class RepositionFileListWidget extends StatefulWidget {
  @override
  _RepositionFileListWidgetState createState() =>
      _RepositionFileListWidgetState();
}

class _RepositionFileListWidgetState extends State<RepositionFileListWidget> {
  List<String> _headerList = ["Root", "Sources", "Plot", "Api"];

  ///下拉刷新数据
  Future<void> _onRefresh() async {
    //await Future.delayed(Duration(seconds: 1));
    return await Future.delayed(Duration(milliseconds: 1000));
  }

  Widget _repositionItem(int index) {
    return FgCardItemWidget(
      padding: EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
      child: ListTile(
          leading: index > 6 ? Icon(FgIcons.code) : Icon(FgIcons.file),
          title: Text("收到回复空手道解放和喀"),
          trailing: index <= 6 ? Icon(FgIcons.rightArrow) : null,
          onTap: () {
            if(index > 6){
              Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => CodeDetailPageWidget()));
            }else {
              print("你点到文件了");
            }
          },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        title: Text("卡升级的话"),
        flexibleSpace: Container(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return RawMaterialButton(
                constraints: BoxConstraints(minWidth: 0, minHeight: 0),
                child: index == 0 ? Text(_headerList[index]) : Text('>'+_headerList[index]),
                onPressed: (){},
              );
            },
            itemCount: _headerList.length,
          ),
        ),
        backgroundColor: Colors.white70,
        leading: Container(),
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return _repositionItem(index);
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
