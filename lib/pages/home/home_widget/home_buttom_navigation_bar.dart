import 'package:flutter/material.dart';

class HomeButtomNavigationBarWidgte extends StatefulWidget {
  HomeButtomNavigationBarWidgte({Key key}) : super(key: key);

  _HomeButtomNavigationBarWidgteState createState() => _HomeButtomNavigationBarWidgteState();
}

class _HomeButtomNavigationBarWidgteState extends State<HomeButtomNavigationBarWidgte> {
  int currentIndex = 0;

  void _getPageCurrentIndex (int index){
    setState(() {
      this.currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            title: Text("动态"),
            icon: Icon(Icons.local_activity)
          ),
          BottomNavigationBarItem(
            title: Text("趋势"),
            icon: Icon(Icons.lock)
          ),
          BottomNavigationBarItem(
            title: Text("我的"),
            icon: Icon(Icons.person)
          )
        ],
        currentIndex: this.currentIndex,
       onTap: _getPageCurrentIndex,
      );
  }
}
