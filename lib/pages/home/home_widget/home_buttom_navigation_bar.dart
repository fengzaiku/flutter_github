import 'package:flutter/material.dart';
import 'package:flutter_github/common/iconfont.dart';
class HomeButtomNavigationBarWidgte extends StatefulWidget {
  HomeButtomNavigationBarWidgte({
    Key key,
    @required this.onChanged,
    // @required this.tabController
  }) : super(key: key);

  // final TabController tabController;
  final ValueChanged<int> onChanged;

  _HomeButtomNavigationBarWidgteState createState() => _HomeButtomNavigationBarWidgteState();
}

class _HomeButtomNavigationBarWidgteState extends State<HomeButtomNavigationBarWidgte> {
  int _currentIndex = 0;

  void _changeNavigation(int index){
    widget.onChanged(index);
    setState(() {
     _currentIndex = index; 
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
      currentIndex: _currentIndex,
      onTap: _changeNavigation
      );
  }
}
