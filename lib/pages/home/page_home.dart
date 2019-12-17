import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github/common/iconfont.dart';
import 'package:flutter_github/pages/drawer/home_drawer.dart';
import 'package:flutter_github/pages/home/home_widget/home_buttom_navigation_bar.dart';

import 'package:flutter_github/pages/dynamic/dynamic_page.dart';
import 'package:flutter_github/pages/center/center_page.dart';
import 'package:flutter_github/pages/search/search_page.dart';
import 'package:flutter_github/pages/tendency/tendency_page.dart';
//import 'package:flutter_github/utils/common_dialog.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
//   final TabController tabController;
  PageController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
        actions: <Widget>[
          IconButton(
            icon: Icon(FgIcons.search),
            onPressed: (){
              Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => SearchPageWidget()));
            },
          )
        ],
      ),
      drawer: HomeDrawerWidget(),
//      body: Text("空手道解放和喀什酱豆腐"),
      body: PageView(
        controller: _controller,
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
//         scrollDirection: Axis.vertical,
        children: <Widget>[
          DynamicPageWidget(),
          TendencyPageWidget(),
          MyCenterPageWidget()
        ],
      ),
      bottomNavigationBar: HomeButtonNavigationBarWidget(
        currentIndex: _currentIndex,
        onChanged: (int index) {
          setState(() {
             _controller.jumpTo(MediaQuery.of(context).size.width * index);
          });
        },
      ),
    );
  }
}
