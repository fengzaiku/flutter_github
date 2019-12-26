
import 'package:flutter_github/pages/center/model/reposition_view.dart';
import 'package:flutter_github/pages/repository/bloc/repository_bloc.dart';

class RepositoryEntryBloc {
  RepositoryBloc _repositoryDynamicBloc;
  RepositoryBloc get repositoryDynamicBloc => _repositoryDynamicBloc;


  RepositoryEntryBloc(RepositionViewModel _repositionViewModel){
    _repositoryDynamicBloc = RepositoryBloc(_repositionViewModel);
  }

  void dispose(){
    _repositoryDynamicBloc.dispose();
  }
}