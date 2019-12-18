import 'package:flutter_github/common/const/api.dart';
import 'package:flutter_github/common/utils/http.dart';
import 'package:flutter_github/store/app_state.dart';
import 'package:redux/redux.dart';

final Function getTrendingList = () {
  return (Store<AppState> store) async {
    var results = await http.get(Api.getTrending("daily", "Java"));

  };
};