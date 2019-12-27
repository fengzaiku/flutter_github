import 'package:flutter_github/common/const/api.dart';
import 'package:flutter_github/common/utils/http.dart';
import 'package:flutter_github/model/Event.dart';
import 'package:flutter_github/model/RepoCommit.dart';
import 'package:flutter_github/pages/center/model/reposition_view.dart';
import 'package:flutter_github/utils/widget_standard.dart';
import 'package:rxdart/rxdart.dart';

class RepositoryBloc{
  int _page = 1;
  RepositionViewModel _repositionViewModel;
  List<EventViewModel> repoCommits = List();
  BehaviorSubject<List<EventViewModel>> _repoCommitsBehaviorSubject;
//  动态/详情当前选择的Tab
  BehaviorSubject<String> _selectTabPublishSubject;

  RepositoryBloc(repViewModel) {
    _repositionViewModel = repViewModel;
    _repoCommitsBehaviorSubject = BehaviorSubject<List<EventViewModel>>();
    _selectTabPublishSubject = BehaviorSubject<String>.seeded("push");
  }

  BehaviorSubject<List<EventViewModel>> get repoCommitsObservable => _repoCommitsBehaviorSubject;
  BehaviorSubject<String> get selectTabObservable => _selectTabPublishSubject;

//  获取仓库commit 列表
  Future getRepositoryCommits() async {
    var result;
    print("_selectTabPublishSubject.stream-----------------${_selectTabPublishSubject.value}");
    if(_selectTabPublishSubject.value == "push"){
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
        if(_selectTabPublishSubject.value == "push"){
          repoCommits.add(EventViewModel.fromEventMap(Event.fromJson(repoCommit)));
        }else{
          repoCommits.add(EventViewModel.fromCommitMap(RepoCommit.fromJson(repoCommit)));
        }
      });
    }
    _repoCommitsBehaviorSubject.add(repoCommits);
    return;
  }

//  更新Tab把选项
  void updateSelectTab(String selectTap) {
    if(selectTap != null){
      _selectTabPublishSubject.add(selectTap);
      clearRepositoryCommits();
    }
  }

//  获取仓库commit 列表
  void clearRepositoryCommits(){
      _page = 1;
      repoCommits.clear();
      _repoCommitsBehaviorSubject.add(repoCommits);
      getRepositoryCommits();
  }

  void dispose() {
    _repoCommitsBehaviorSubject.close();
    _selectTabPublishSubject.close();
  }
}
