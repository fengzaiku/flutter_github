import 'package:flutter/material.dart';
import 'package:flutter_github/common/utils/date_format.dart';
import 'package:flutter_github/common/utils/event_format.dart';
import 'package:flutter_github/model/CommitFile.dart';
import 'package:flutter_github/model/Event.dart';
import 'package:flutter_github/model/PushCommit.dart';
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
    actionUser    = event.actor.login;
    actionUserPic = event.actor?.avatarUrl;
    actionTime    = FormatDateUtils.getRelativeTime(event.createdAt);
    var other = EventFormat.getActionAndDes(event);
    actionDes = other["des"];
    actionTarget = other["actionStr"];
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
