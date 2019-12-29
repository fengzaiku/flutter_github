import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github/common/const/api.dart';
import 'package:flutter_github/common/iconfont.dart';
import 'package:flutter_github/common/utils/http.dart';
import 'package:flutter_github/model/FileModel.dart';
import 'package:flutter_github/pages/code/code_detail.dart';
import 'package:flutter_github/widget/flutter_github_card.dart';

class RepositionFileListWidget extends StatefulWidget {
  String userName;
  String repositoryName;
  RepositionFileListWidget(this.userName, this.repositoryName,{
    Key key
}):super(key:key);

  @override
  _RepositionFileListWidgetState createState() =>
      _RepositionFileListWidgetState();
}

class _RepositionFileListWidgetState extends State<RepositionFileListWidget> {
  List<String> _headerList = ["root",];
  List<FileModel> files = List();
  String path = "";

  @override
  void initState() {
    super.initState();
    _onRefresh();
  }

  ///下拉刷新数据
  Future<void> _onRefresh() async {
    path = _headerList.sublist(1,_headerList.length).join("/");
    var result = await http.get(Api.getReposDataDir(widget.userName, widget.repositoryName,path),options: Options(
      headers: {"Accept": 'application/vnd.github.VERSION.raw'},
        contentType: "json"
    ));

    if(result != null && result is List){
      setState(() {
        files.clear();
        result.forEach((item){
          FileModel file = FileModel.fromJson(item);
          if(file.type == "dir"){
            files.insert(0, file);
          } else {
            files.add(file);
          }
        });
      });
    }
  }

  Future<void> _goToCodeDetail(FileModel file) async {
    path = _headerList.sublist(1,_headerList.length).join("/");
    var result = await http.get(Api.getReposDataDir(widget.userName, widget.repositoryName,path+"/"+file.name),options: Options(
      headers: {"Accept": 'application/vnd.github.html'},
        contentType: "text"
    ));
    print("result-----------------------------$result");
    if(result != null){
      Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => CodeDetailPageWidget(
        title: file.name,
        htmlBody: result,
      )));
    }
  }

  void fileModelItemTap(FileModel file){
    if(file.type == "dir"){
      _headerList.add(file.name);
      _onRefresh();
    } else {
      _goToCodeDetail(file);
    }
  }

  Widget _repositionItem(FileModel file) {
    return FgCardItemWidget(
      padding: EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
      child: ListTile(
          leading: file.type == "file" ? Icon(FgIcons.code) : Icon(FgIcons.file),
          title: Text(file.name ?? ""),
          trailing: file.type == "dir" ? Icon(FgIcons.rightArrow) : SizedBox(),
          onTap: () {
            fileModelItemTap(file);
          },
      ),
    );
  }

  Future<bool> onWillPopScope() async{
    if(_headerList.length > 1){
      _resolveHeaderClick(_headerList.length - 2);
      return Future.value(false);
    }
    return Future.value(true);
  }

  void _resolveHeaderClick(index){
    if(index >= 0){
      _headerList = _headerList.sublist(0, index + 1);
      _onRefresh();
    }
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
                onPressed: (){_resolveHeaderClick(index);},
              );
            },
            itemCount: _headerList.length,
          ),
        ),
        backgroundColor: Colors.white70,
        leading: Container(),
      ),
      body: WillPopScope(
        onWillPop: (){
          return onWillPopScope();
        },
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return _repositionItem(files[index]);
            },
            itemCount: files.length,
          ),
        ),
      ),
    );
  }
}
