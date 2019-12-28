import 'package:flutter/material.dart';
import 'package:flutter_github/common/iconfont.dart';
import 'package:flutter_github/common/utils/date_format.dart';
import 'package:flutter_github/common/utils/event_format.dart';
import 'package:flutter_github/model/CommitFile.dart';
import 'package:flutter_github/model/Event.dart';
import 'package:flutter_github/model/PushCommit.dart';
import 'package:flutter_github/model/RepoCommit.dart';
import 'package:flutter_github/model/Repository.dart';

class DividerVertical {
  double  width;
  double  thickness;
  double  indent;
  double  endIndent;
  Color   color;

  DividerVertical(
      {this.width, this.thickness, this.indent, this.endIndent, this.color});
}

class RowSelectItem {
  String    selectKey;
  String    selectName;
  dynamic   selectValue;
  IconData  selectIcon;


  RowSelectItem({
    this.selectKey,
    this.selectName,
    this.selectValue,
    this.selectIcon,
  });
}

class SearchFilterModel {
  String  name;
  String  value;
  bool    select;

  SearchFilterModel({this.name, this.value, this.select});
}

class ConfigurationCard {
  final Color               color;
  final double              elevation;
  final ShapeBorder         shape;
  final Clip                clipBehavior;
  final EdgeInsetsGeometry  margin;
  final EdgeInsetsGeometry  padding;

  ConfigurationCard({
    this.color,
    this.elevation,
    this.shape,
    this.margin,
    this.padding,
    this.clipBehavior,
  });
}


class EventViewModel {
  String actionUser;
  String actionUserPic;
  String actionDes;
  String actionTime;
  String actionTarget;

  EventViewModel.fromEventMap(Event event){
    actionUser    = event.actor?.login;
    actionUserPic = event.actor?.avatarUrl;
    actionTime    = FormatDateUtils.getRelativeTime(event.createdAt);
    var other = EventFormat.getActionAndDes(event);
    actionDes = other["des"];
    actionTarget = other["actionStr"];
  }

  EventViewModel.fromCommitMap(RepoCommit eventMap) {
    actionTime = FormatDateUtils.getRelativeTime(eventMap.commit.committer.date);
    actionUser = eventMap.commit.committer.name;
    actionDes = "sha:" + eventMap.sha;
    actionTarget = eventMap.commit.message;
  }
}

class PushHeaderViewModel {
  String actionUser = "---";
  String actionUserPic = "---";
  String pushDes = "---";
  String pushTime = "---";
  String editCount = "---";
  String addCount = "---";
  String deleteCount = "---";
  String htmlUrl = "https://www.wanandroid.com/blog/show/2260";

  PushHeaderViewModel();

  PushHeaderViewModel.forMap(PushCommit pushMap) {
    String name = "---";
    String pic = "---";
    if (pushMap.committer != null) {
      name = pushMap.committer.login;
    } else if (pushMap.commit != null && pushMap.commit.author != null) {
      name = pushMap.commit.author.name;
    }
    if (pushMap.committer != null && pushMap.committer.avatarUrl != null) {
      pic = pushMap.committer.avatarUrl;
    }
    actionUser = name;
    actionUserPic = pic;
    pushDes = "Push at " + pushMap.commit.message;
    pushTime = FormatDateUtils.getRelativeTime(pushMap.commit.committer.date);
    editCount = pushMap.files.length.toString() + "";
    addCount = pushMap.stats.additions.toString() + "";
    deleteCount = pushMap.stats.deletions.toString() + "";
    htmlUrl = pushMap.htmlUrl;
  }
}

class PushCodeItemViewModel {
  String path;
  String name;
  String patch;

  String blob_url;

  PushCodeItemViewModel();

  PushCodeItemViewModel.fromMap(CommitFile map) {
    String filename = map.fileName;
    List<String> nameSplit = filename.split("/");
    name = nameSplit[nameSplit.length - 1];
    path = filename;
    patch = map.patch;
    blob_url = map.blobUrl;
  }
}

class ReposViewModel {
  String ownerName;
  String ownerPic;
  String repositoryName;
  String repositoryStar;
  String repositoryFork;
  String repositoryWatch;
  String hideWatchIcon;
  String repositoryType = "";
  String repositoryDes;

  ReposViewModel();

  ReposViewModel.fromMap(Repository data) {
    ownerName = data.owner.login;
    ownerPic = data.owner.avatarUrl;
    repositoryName = data.name;
    repositoryStar = data.watchersCount.toString();
    repositoryFork = data.forksCount.toString();
    repositoryWatch = data.openIssuesCount.toString();
    repositoryType = data.language ?? '---';
    repositoryDes = data.description ?? '---';
  }

  ReposViewModel.fromTrendMap(model) {
    ownerName = model.name;
    if (model.contributors.length > 0) {
      ownerPic = model.contributors[0];
    } else {
      ownerPic = "";
    }
    repositoryName = model.reposName;
    repositoryStar = model.starCount;
    repositoryFork = model.forkCount;
    repositoryWatch = model.meta;
    repositoryType = model.language;
    repositoryDes = model.description;
  }
}

class ReposHeaderViewModel {
  String ownerName = '---';
  String ownerPic;
  String repositoryName = "---";
  String repositorySize = "---";
  String repositoryStar = "---";
  String repositoryFork = "---";
  String repositoryWatch = "---";
  String repositoryIssue = "---";
  String repositoryIssueClose = "";
  String repositoryIssueAll = "";
  String repositoryType = "---";
  String repositoryDes = "---";
  String repositoryLastActivity = "";
  String repositoryParentName = "";
  String repositoryParentUser = "";
  String createdAt = "";
  String pushAt = "";
  String license = "";
  List<String> topics;
  int allIssueCount = 0;
  int openIssuesCount = 0;
  bool repositoryStared = false;
  bool repositoryForked = false;
  bool repositoryWatched = false;
  bool repositoryIsFork = false;

  ReposHeaderViewModel();

  ReposHeaderViewModel.fromHttpMap(ownerName, reposName, Repository map) {
    this.ownerName = ownerName;
    if (map == null || map.owner == null) {
      return;
    }
    this.ownerPic = map.owner.avatarUrl;
    this.repositoryName = reposName;
    this.allIssueCount = map.allIssueCount;
    this.topics = map.topics;
    this.openIssuesCount = map.openIssuesCount;
    this.repositoryStar =
    map.watchersCount != null ? map.watchersCount.toString() : "";
    this.repositoryFork =
    map.forksCount != null ? map.forksCount.toString() : "";
    this.repositoryWatch =
    map.subscribersCount != null ? map.subscribersCount.toString() : "";
    this.repositoryIssue =
    map.openIssuesCount != null ? map.openIssuesCount.toString() : "";
    this.repositorySize =
        ((map.size / 1024.0)).toString().substring(0, 3) + "M";
    this.repositoryType = map.language;
    this.repositoryDes = map.description;
    this.repositoryIsFork = map.fork;
    this.license = map.license != null ? map.license.name : "";
    this.repositoryParentName = map.parent != null ? map.parent.fullName : null;
    this.repositoryParentUser =
    map.parent != null ? map.parent.owner.login : null;
    this.createdAt = FormatDateUtils.getRelativeTime(map.createdAt);
    this.pushAt = FormatDateUtils.getRelativeTime(map.pushedAt);
  }
}

class BottomStatusModel {
  String watchText;
  String starText;
  IconData watchIcon;
  IconData starIcon;
  bool star = false;
  bool watch = false;

  BottomStatusModel();

  BottomStatusModel.fromJson(Map<String, bool> json){
    if(json == null){
      json = {
        "star": false,
        "watch": false,
      };
    }
    this.watchText = json["watch"] ?? false ? "UnWatch" : "Watch";
    this.starText = json["star"] ?? false ? "UnStar" : "Star";
    this.watchIcon = json["watch"] ?? false ? FgIcons.watcher : FgIcons.un_watcher;
    this.starIcon = json["star"] ?? false ? FgIcons.star : FgIcons.un_star;
    this.star = json["star"] ?? false;
    this.watch = json["watch"] ?? false;
  }
}