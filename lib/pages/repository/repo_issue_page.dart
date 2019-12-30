import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_github/model/Issue.dart';
import 'package:flutter_github/pages/center/model/reposition_view.dart';
import 'package:flutter_github/pages/repository/dao/issue_dao.dart';
import 'package:flutter_github/pages/repository/widget/issue_item.dart';
import 'package:flutter_github/pages/repository/widget/issue_tab.dart';
import 'package:flutter_github/utils/widget_standard.dart';
import 'package:flutter_github/widget/search_input.dart';

class RepositionIssuePageWidget extends StatefulWidget {
  RepositionViewModel repositionViewModel;

  RepositionIssuePageWidget(this.repositionViewModel,{Key key}): super(key: key);

  @override
  _RepositionIssuePageWidgetState createState() =>
      _RepositionIssuePageWidgetState();
}

class _RepositionIssuePageWidgetState extends State<RepositionIssuePageWidget>{
  IssueDao issueDao;
  int page = 1;
  String state = "all";
  TextEditingController _searchTextController;
  List<Issue> issueList = List();

  @override
  void initState() {
    super.initState();
    _searchTextController = TextEditingController();
    issueDao = IssueDao(widget.repositionViewModel);
    _onRefresh();
  }

  Future _onRefresh() async {
    issueList.clear();
    page = 1;
    _onLoadMore();
  }

  Future _onLoadMore() async {
    var result;
    print("_searchTextController.value--------------------------${_searchTextController.text}");
    if(_searchTextController.text.length > 0){
      result =  await issueDao.searchRepositoryIssue(_searchTextController.text,state,page);
    } else {
      result =  await issueDao.getRepositoryIssue(state, page);
    }

    if(result != null){
      page ++;
      if(result is List){
        setState(() {
          result.forEach((issueItem){
            issueList.add(Issue.fromJson(issueItem));
          });
        });
      }
      if(result is Map && result["items"] is List){
        setState(() {
          result["items"].forEach((issueItem){
            issueList.add(Issue.fromJson(issueItem));
          });
        });
      }
    }
  }

  void _onStateChange(value){
    setState(() {
      state = value;
    });
    _onRefresh();
  }

  @override
  void dispose() {
    super.dispose();
    _searchTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        flexibleSpace: SearchInputWidget(
          controller: _searchTextController,
          onSearch: (value){
            _onRefresh();
          },
        ),
        backgroundColor: Colors.white70,
      ),
      body: EasyRefresh.custom(
          header: MaterialHeader(),
          footer: MaterialFooter(),
          onRefresh: _onRefresh,
          onLoad: _onLoadMore,
          slivers: <Widget>[
            IssueSelectListWidget(
              selectKey: state,
              onStateChange: _onStateChange,
            ),
            SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
//                return Text("顺利打开附件是扩大飞机");
                return IssueListItemWidget(IssueItemViewModel.fromMap(issueList[index]));
              }, childCount: issueList.length),
            )
          ]),
    );
  }
}
