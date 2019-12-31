import 'package:flutter_github/model/Repository.dart';

class RepositionViewModel{
  String ownerName;
  String ownerPic;
  String repositoryName;
  String repositoryStar;
  String repositoryFork;
  String repositoryWatch;
  String hideWatchIcon;
  String repositoryType = "";
  String repositoryDes;
  String repositoryHtmlUrl;

  RepositionViewModel();

  RepositionViewModel.fromMap(Repository data) {
    ownerName = data.owner.login;
    ownerPic = data.owner.avatarUrl;
    repositoryName = data.name;
    repositoryStar = data.watchersCount.toString();
    repositoryFork = data.forksCount.toString();
    repositoryWatch = data.openIssuesCount.toString();
    repositoryType = data.language ?? '---';
    repositoryDes = data.description ?? '---';
    repositoryHtmlUrl = data.htmlUrl ?? 'https://github.com/${data.name}';
  }
  RepositionViewModel.fromTrendMap(model) {
    ownerName = model.name;
    if (model.contributors.length > 0) {
      ownerPic = model.contributors[0];
    } else {
      ownerPic = "";
    }
    repositoryName = model.reposName;
    repositoryStar = model.starCount?.trim();
    repositoryFork = model.forkCount?.trim();
    repositoryWatch = model.meta?.trim();
    repositoryType = model.language;
    repositoryDes = model.description;
    repositoryHtmlUrl = 'https://github.com/${model.name}/${model.reposName}';
  }
}