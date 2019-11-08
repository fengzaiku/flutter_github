import 'package:flutter/material.dart';
import 'package:flutter_github/common/iconfont.dart';
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
            icon: Icon(FgIcons.dynamic)
          ),
          BottomNavigationBarItem(
            title: Text("趋势"),
            icon: Icon(FgIcons.uptrend)
            // icon: Icon(FgIcons.electrocardiogram)
          ),
          BottomNavigationBarItem(
            title: Text("我的"),
            icon: Icon(FgIcons.person)
          )
        ],
        currentIndex: this.currentIndex,
       onTap: _getPageCurrentIndex,
      );
  }
}
