import 'package:flutter/material.dart';
import 'package:flutter_github/model/RepositoryList.dart';
import 'package:flutter_github/pages/repository/repo_list_page.dart';

class PageRouter {

  static replaceHome(BuildContext context){
    Navigator.pushReplacementNamed(context, 'home_page');
  }

  static replaceLogin(BuildContext context){
    Navigator.pushReplacementNamed(context, 'login_page');
  }

  static goToRepositoryListPage(BuildContext context, RepositoryList repositoryList){
    Navigator.push(context, MaterialPageRoute(builder: (context) => RepositoryListWidget(repositoryList)));
  }
}