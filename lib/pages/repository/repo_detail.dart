import 'package:flutter/material.dart';
import 'package:flutter_github/pages/repository/repo_dynamic_page.dart';
import 'package:flutter_github/pages/repository/widget/rep_bottom_bar.dart';
import 'package:flutter_github/widget/tabar_widget.dart';

class RepositionDetailPageWidget extends StatefulWidget {
  @override
  _RepositionDetailPageWidgetState createState() => _RepositionDetailPageWidgetState();
}

class _RepositionDetailPageWidgetState extends State<RepositionDetailPageWidget> with TickerProviderStateMixin<RepositionDetailPageWidget>{

  List _tabs = ["动态","详情","ISSUE","文件"];
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: _tabs.length,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return TabarPageWidget(
      tabItems: _tabs.map((name) => Tab(text: name)).toList(),
      floatingActionButton: FloatingActionButton(
        child: Text("关注"),
        onPressed: (){
          print("迪纳基");
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: RepositoryDetailBottomAppBar(),
      tabViews: <Widget>[
        RepositoryDynamicPageWidget(),
        Text("深刻理解电话反馈及时答复"),
        Text("深刻理解电话反馈及时答复"),
        Text("深刻理解电话反馈及时答复"),
      ],
//      tabItems: <Widget>[],
    );
  }
}