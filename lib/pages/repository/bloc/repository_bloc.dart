import 'package:flutter_github/common/const/api.dart';
import 'package:flutter_github/common/utils/http.dart';
import 'package:flutter_github/model/Event.dart';
import 'package:flutter_github/model/RepoCommit.dart';
import 'package:flutter_github/model/Repository.dart';
import 'package:flutter_github/pages/center/model/reposition_view.dart';
import 'package:flutter_github/utils/widget_standard.dart';
import 'package:rxdart/rxdart.dart';

class RepositoryBloc {
  int _page = 1;
  RepositionViewModel _repositionViewModel;
  List<EventViewModel> repoCommits = List();
  BehaviorSubject<List<EventViewModel>> _repoCommitsBehaviorSubject;
  BehaviorSubject<ReposHeaderViewModel> _repoHeaderBehaviorSubject;

//  动态/详情当前选择的Tab
  BehaviorSubject<String> _selectTabPublishSubject;

  RepositoryBloc(repViewModel) {
    _repositionViewModel = repViewModel;
    _repoCommitsBehaviorSubject = BehaviorSubject<List<EventViewModel>>();
    _repoHeaderBehaviorSubject = BehaviorSubject<ReposHeaderViewModel>();
    _selectTabPublishSubject = BehaviorSubject<String>.seeded("dynamic");
  }

  BehaviorSubject<List<EventViewModel>> get repoCommitsObservable =>
      _repoCommitsBehaviorSubject;

  BehaviorSubject<String> get selectTabObservable => _selectTabPublishSubject;
  BehaviorSubject<ReposHeaderViewModel> get repoHeaderObservable => _repoHeaderBehaviorSubject;

//  获取仓库commit 列表
  Future getRepositoryCommits() async {
    var result;
    if (_selectTabPublishSubject.value == "dynamic") {
      result = await http.get(Api.getReposEvent(_repositionViewModel.ownerName,
              _repositionViewModel.repositoryName) +
          Api.getPageParams(_page));
    } else {
      result = await http.get(Api.getReposCommitsInfo(
              _repositionViewModel.ownerName,
              _repositionViewModel.repositoryName,
              null) +
          Api.getPageParams(_page));
    }

    if (result != null && result is List) {
      _page++;
      result.forEach((repoCommit) {
        if (_selectTabPublishSubject.value == "dynamic") {
          repoCommits
              .add(EventViewModel.fromEventMap(Event.fromJson(repoCommit)));
        } else {
          repoCommits.add(
              EventViewModel.fromCommitMap(RepoCommit.fromJson(repoCommit)));
        }
      });
    }
    _repoCommitsBehaviorSubject.add(repoCommits);
    return;
  }

//  获取仓库详情
  Future getRepositoryDetail() async {
    var result = await http.get(Api.getReposDetail(
            _repositionViewModel.ownerName,
            _repositionViewModel.repositoryName) +
        "?ref=master");

    if (result != null && result is Map) {

      _repoHeaderBehaviorSubject.add(
          ReposHeaderViewModel.fromHttpMap(_repositionViewModel.ownerName,
              _repositionViewModel.repositoryName, Repository.fromJson(result)));
    } else {
      _repoHeaderBehaviorSubject.add(
          ReposHeaderViewModel.fromHttpMap(_repositionViewModel.ownerName,
              _repositionViewModel.repositoryName, Repository.empty()));
    }
    return;
  }

//  更新Tab把选项
  void updateSelectTab(String selectTap) {
    if (selectTap != null) {
      _selectTabPublishSubject.add(selectTap);
      clearRepositoryCommits();
      getRepositoryCommits();
    }
  }

//  获取仓库commit 列表
  void clearRepositoryCommits() {
    _page = 1;
    repoCommits.clear();
    _repoCommitsBehaviorSubject.add(repoCommits);
  }

  void dispose() {
    _repoCommitsBehaviorSubject.close();
    _selectTabPublishSubject.close();
    _repoHeaderBehaviorSubject.close();
  }
}
