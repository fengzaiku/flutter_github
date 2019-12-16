import 'package:flutter_github/model/RepositoryList.dart';
import 'package:redux/redux.dart';

class UpdateRepositoryListAction{
  final RepositoryList repositoryList;
  UpdateRepositoryListAction(this.repositoryList);
}

final RepositoryListReducer = combineReducers<RepositoryList>([
  TypedReducer<RepositoryList, UpdateRepositoryListAction>(_updateRepositoryList),
]);

RepositoryList _updateRepositoryList(RepositoryList repositoryList, action){
  repositoryList = action.repositoryList;
  return repositoryList;
}
