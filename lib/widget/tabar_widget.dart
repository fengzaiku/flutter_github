import 'package:flutter/material.dart';

class TabarPageWidget extends StatefulWidget {
  final Widget title;

  final List<Widget> tabItems;

  final List<Widget> tabViews;

  final ValueChanged<int> onPageChanged;

  final ValueChanged<int> onTap;

  final Widget bottomNavigationBar;
  final Widget floatingActionButton;
  final FloatingActionButtonLocation floatingActionButtonLocation;

  TabarPageWidget({
    Key key,
    this.title,
    @required this.tabItems,
    @required this.tabViews,
    this.onTap,
    this.onPageChanged,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  }) : super(key: key);

  @override
  _TabarPageWidgetState createState() => _TabarPageWidgetState();
}

class _TabarPageWidgetState extends State<TabarPageWidget> with TickerProviderStateMixin<TabarPageWidget>{
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: widget.tabItems.length,
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
    return Scaffold(
      appBar: AppBar(
        title: widget.title,
        bottom: TabBar(
          controller: _tabController,
          tabs: widget.tabItems,
          onTap: (int index) {
            widget.onTap?.call(index);
          },
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: widget.tabViews,
      ),
      floatingActionButton: widget.floatingActionButton,
      bottomNavigationBar: widget.bottomNavigationBar,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
    );
  }
}
