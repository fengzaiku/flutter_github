import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github/pages/home/home_widget/home_drawer.dart';
import 'package:flutter_github/pages/home/home_widget/home_buttom_navigation_bar.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {

  // final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      drawer: HomeDrawerWidget(),
      body: Text("首页"),
      bottomNavigationBar: HomeButtomNavigationBarWidgte(),
    );
  }
}