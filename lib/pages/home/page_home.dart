import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github/pages/home/home_widget/home_drawer.dart';
import 'package:flutter_github/pages/home/home_widget/home_buttom_navigation_bar.dart';

import 'package:flutter_github/pages/dynamic/dynamic_page.dart';
import 'package:flutter_github/pages/center/center_page.dart';
import 'package:flutter_github/pages/tendency/tendency_page.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  // final TabController tabController;
  final PageController _controller = PageController();
  // int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      drawer: HomeDrawerWidget(),
      body: PageView(
        controller: _controller,
        onPageChanged: (int index) {
          setState(() {
            // _currentIndex = index;
          });
        },
        // scrollDirection: Axis.vertical,
        children: <Widget>[
          DynamicPageWidget(),
          TendencyPageWidget(),
          MyCenterPageWidget()
        ],
      ),
      bottomNavigationBar: HomeButtomNavigationBarWidgte(
        onChanged: (int index) {
          print(index);
          setState(() {
            // _controller.jumpTo(MediaQuery.of(context).size.width * index);
            _controller.jumpToPage(index);
          });
          // return index;
        },
      ),
    );
  }
}
