import 'package:flutter/material.dart';

class TabarPageWidget extends StatefulWidget {
  final Widget title;

  final List<Widget> tabItems;

  final List<Widget> tabViews;

  final ValueChanged<int> onPageChanged;

  final ValueChanged<int> onTap;

  final Widget bottomNavigationBar;

  final PageController _pageController = PageController();
//  final TabController _tabController;

  TabarPageWidget({
    Key key,
    this.title,
    this.tabItems,
    this.tabViews,
    this.onTap,
    this.onPageChanged,
//    this._tabController,
    this.bottomNavigationBar,
  }) : super(key: key);

  @override
  _TabarPageWidgetState createState() => _TabarPageWidgetState();
}

class _TabarPageWidgetState extends State<TabarPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.title,
        bottom: TabBar(
//          controller: widget._tabController,
          tabs: widget.tabItems,
          onTap: (int index) {
            widget.onTap?.call(index);
            return index;
          },
        ),
      ),
      body: PageView(
        controller: widget._pageController,
        children: widget.tabViews,
        onPageChanged: (int index) {
          widget.onPageChanged?.call(index);
        },
      ),
      bottomNavigationBar: widget.bottomNavigationBar,
    );
  }
}
