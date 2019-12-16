import 'package:flutter_github/model/Repository.dart';

class RepositoryList{
  List<Repository> repositoryList;
  int watchersCountTotal;
  RepositoryList(this.repositoryList, {this.watchersCountTotal});

  factory RepositoryList.fromJson(List<dynamic> list) {
    int count = 0;

//    排序
    list.sort((r1, r2) => r2.watchersCount - r1.watchersCount);

    List<Repository> _repository = list.map((e){
      if(e == null){
        return null;
      }
      count += e.watchersCount;
      return Repository.fromJson(e as Map<String, dynamic>);
    })?.toList();

    return RepositoryList(_repository, watchersCountTotal: count);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'repositoryList': this.repositoryList,
    'watchersCountTotal': this.watchersCountTotal,
  };

  RepositoryList.empty();
}