import 'package:flutter_github/common/const/api.dart';
import 'package:flutter_github/common/utils/http.dart';
import 'package:flutter_github/model/RepoCommit.dart';
import 'package:flutter_github/pages/center/model/reposition_view.dart';
import 'package:rxdart/rxdart.dart';

class RepositoryBloc {
  int _page = 1;
  RepositionViewModel _repositionViewModel;
  List<RepoCommit> repoCommits = List();
  BehaviorSubject<List<RepoCommit>> _repoCommitsBehaviorSubject;

  RepositoryBloc(repViewModel) {
    _repositionViewModel = repViewModel;
    _repoCommitsBehaviorSubject = BehaviorSubject<List<RepoCommit>>();
  }

  Stream<List<RepoCommit>> get stream => _repoCommitsBehaviorSubject.stream;

//  获取仓库commit 列表
  Future getRepositoryCommits() async {
    var result = await http.get(Api.getReposCommitsInfo(
            _repositionViewModel.ownerName,
            _repositionViewModel.repositoryName,
            null) +
        Api.getPageParams(_page));

    if(result != null){
      _page++;
      repoCommits.addAll(result);
      _repoCommitsBehaviorSubject.add(repoCommits);
    }
    return;
  }

//  获取仓库commit 列表
  void clearRepositoryCommits(){
      _page = 1;
      repoCommits.clear();
      _repoCommitsBehaviorSubject.add(repoCommits);
  }

  void dispose() {
    _repoCommitsBehaviorSubject.close();
  }
}
