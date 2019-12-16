import 'package:flutter/material.dart';
import 'package:flutter_github/model/Repository.dart';
import 'package:flutter_github/model/RepositoryList.dart';
import 'package:flutter_github/pages/center/model/reposition_view.dart';

import 'package:flutter_github/widget/reposition_item.dart';

class RepositoryListWidget extends StatefulWidget {
  RepositoryList repositoryList;

  RepositoryListWidget(repositoryList, {Key key}) : super(key: key);

  @override
  _RepositoryListWidgetState createState() => _RepositoryListWidgetState();
}

class _RepositoryListWidgetState extends State<RepositoryListWidget> {

  @override
  Widget build(BuildContext context) {
    List<Repository> repositoryList = widget.repositoryList?.repositoryList ?? [];

    return Material(
      child: Scaffold(
        appBar: AppBar(title: Text("仓库列表")),
        body: repositoryList.length > 0 ? ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return RepositionItemWidget(RepositionViewModel.fromMap(repositoryList[index]));
          },
          itemCount: repositoryList.length,
        ) : Text("页面数据为空"),
      ),
    );
  }
}
