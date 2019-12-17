import 'package:flutter_github/common/const/api.dart';
import 'package:flutter_github/common/utils/http.dart';
import 'package:flutter_github/model/RepositoryList.dart';
import 'package:flutter_github/store/app_state.dart';
import 'package:flutter_github/store/reducers/repository_reducers.dart';
import 'package:redux/redux.dart';

final Function getRepositoryList = (String username) {
  return (Store<AppState> store) async {
    var results = await http.get(await Api.getUserRepos(username, 'pushed') + "&page=1&per_page=100");

    if(results != null){
      store.dispatch(UpdateRepositoryListAction(RepositoryList.fromJson(results)));
    }
//    return true;
  };
};
