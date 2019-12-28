import 'package:flutter/foundation.dart';
import 'package:flutter_github/common/const/api.dart';
import 'package:flutter_github/common/utils/http.dart';
import 'package:flutter_github/pages/center/model/reposition_view.dart';

class ActionProvider with ChangeNotifier{
  RepositionViewModel repositionViewModel;
  Map<String, bool>  _actionStatus;

  ActionProvider(this.repositionViewModel);
  Map<String, bool> get actionStatus => _actionStatus;

  set actionStatus(Map<String, bool> json){
    _actionStatus = json;
    notifyListeners();
  }

  void setActionStatus(Map<String, bool> itemValue){
    actionStatus = itemValue;
  }

  getRepositoryStatus() async{
    var star = await http.get(Api.resolveStarRepos(repositionViewModel.ownerName, repositionViewModel.repositoryName));
    var watch = await http.get(Api.resolveWatcherRepos(repositionViewModel.ownerName, repositionViewModel.repositoryName));

    print("star--------------------------------$star");
    print("watch--------------------------------$watch");
    setActionStatus({
      "star": star ?? false,
      "watch": watch ?? false,
    });
  }
}