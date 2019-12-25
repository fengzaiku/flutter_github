import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
// import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_github/common/const/api.dart';
import 'package:flutter_github/common/utils/http.dart';
import 'package:flutter_github/model/Repository.dart';
import 'package:flutter_github/model/RepositoryList.dart';
import 'package:flutter_github/pages/center/model/reposition_view.dart';
import 'package:flutter_github/store/app_state.dart';

import 'package:flutter_github/widget/reposition_item.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class RepositoryListWidget extends StatefulWidget {
  final String type;

//  RepositoryListWidget({Key key}) : super(key: key);
  RepositoryListWidget(this.type,{Key key}) : super(key: key);

  @override
  _RepositoryListWidgetState createState() => _RepositoryListWidgetState();
}

class _RepositoryListWidgetState extends State<RepositoryListWidget>{
  List<Repository> repositoryList = List();
  int page = 1;

  Future<void> _onRefresh() async {
    page = 1;
    repositoryList.clear();
    await _onLoad();
  }
  
  Future<void> _onLoad() async {
    RepositoryList repositorys;
//    荣耀
    if(widget.type == "glory"){
      Store store = StoreProvider.of<AppState>(context);
      repositorys = store.state.repositoryList;
    }
//    仓库
    if(widget.type == "warehouse"){
      repositorys = await _getWareHouse();
      page ++;
    }
//    星标
    if(widget.type == "star"){
      repositorys = await _getUserStart();
      page ++;
    }

    setState(() {
      repositoryList.addAll(repositorys.repositoryList ?? []);
    });
  }

//  仓库列表
  Future<RepositoryList> _getWareHouse() async {
    String url = await Api.getUserRepos();
    var res = await http.get(url+"&page=$page");
    if(res != null && res.length > 0){
      return RepositoryList.fromJson(res);
    }
    return RepositoryList.empty();
  }

//  星标列表
  Future<RepositoryList> _getUserStart() async {
    String url = await Api.getUserStar();
    var res = await http.get(url+"&page=$page");
    if(res != null && res.length > 0){
      return RepositoryList.fromJson(res);
    }
    return RepositoryList.empty();
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
      builder: (BuildContext context, store) {
        return Scaffold(
          appBar: AppBar(title: Text("仓库列表")),
          body: EasyRefresh(
//          controller: _easyRefreshController,
            header: MaterialHeader(),
//            footer: MaterialFooter(),
            firstRefresh: true,
            onRefresh:_onRefresh,
            onLoad: _onLoad,
            child: repositoryList.length > 0
                ? ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return RepositionItemWidget(
                    RepositionViewModel.fromMap(repositoryList[index]));
              },
              itemCount: repositoryList.length,
            )
                : Text("页面为空"),
          ),
        );
      },
    );
  }
}
