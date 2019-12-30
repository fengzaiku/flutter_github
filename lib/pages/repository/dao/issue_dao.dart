import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github/common/const/api.dart';
import 'package:flutter_github/common/utils/http.dart';
import 'package:flutter_github/pages/center/model/reposition_view.dart';

class IssueDao {
  RepositionViewModel repositionViewModel;

  IssueDao(this.repositionViewModel);

//  获取仓库的issue
  getRepositoryIssue(state, page) async {
    var result = await http.get(
        Api.getReposIssue(repositionViewModel.ownerName,
                repositionViewModel.repositoryName, state, null, null) +
            Api.getPageParams(page,"&"),
        options: Options(headers: {
          "Accept":
              'application/vnd.github.html,application/vnd.github.VERSION.raw'
        }));
    return result;
  }

//  搜索仓库的issue
  searchRepositoryIssue(query, state, page) async {
    String queryUrl;
    if (state == null || state == 'all') {
      queryUrl = query +
          "&repo%3A${repositionViewModel.ownerName}%2F${repositionViewModel.repositoryName}";
    } else {
      queryUrl = query +
          "&repo%3A${repositionViewModel.ownerName}%2F${repositionViewModel.repositoryName}+state%3A$state";
    }
    var result = await http.get(
        Api.repositoryIssueSearch(queryUrl) + Api.getPageParams(page,"&"));
    return result;
  }
}
