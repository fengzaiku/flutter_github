import 'package:flutter/material.dart';
import 'package:flutter_github/common/iconfont.dart';

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

class _TabarPageWidgetState extends State<TabarPageWidget>
    with TickerProviderStateMixin<TabarPageWidget> {
  TabController _tabController;
  PageController _pageViewController;

  @override
  void initState() {
    _tabController = TabController(
      initialIndex: 0,
      length: widget.tabItems.length,
      vsync: this,
    );
    _pageViewController = PageController(
      initialPage: 0
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
        actions: <Widget>[
          PopupMenuButton(
            onCanceled: (){

            },
            onSelected: (select){
              print(select);
            },
            child: Icon(FgIcons.ellipsis),
            itemBuilder: (BuildContext context){
              return [
                PopupMenuItem(
                  value: "浏览器打开",
//                  textStyle: TextStyle(color: Colors.black),
                  child: Text('浏览器打开'),
                ),
                PopupMenuItem(
                  value: "复制链接",
                  child: Text('复制链接'),
                ),
                PopupMenuItem(
                  value: "分享",
                  child: Text('分享'),
                ),
                PopupMenuItem(
                  value: "版本",
                  child: Text('版本'),
                ),
                PopupMenuItem(
                  value: "分支",
                  child: Text('分支'),
                ),
              ];
            },
          ),
          SizedBox(width: 20,)
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: widget.tabItems,
          onTap: (int index) {
            print("index-------------------------------------$index");
            widget.onTap?.call(index);
            if(index == 1){
              _tabController.animateTo(_tabController.previousIndex);
            } else {
              _pageViewController.animateToPage(index > 1 ? index -1 : index, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
            }
          },
        ),
      ),
      body: PageView(
        controller: _pageViewController,
        children: widget.tabViews,
//        onPageChanged: (int index){
//          _tabController.animateTo(index < 1 ? index : index + 1);
//        },
        physics: NeverScrollableScrollPhysics(),
      ),
//      body: TabBarView(
//        controller: _tabController,
//        children: widget.tabViews,
//      ),
      floatingActionButton: widget.floatingActionButton,
      bottomNavigationBar: widget.bottomNavigationBar,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
    );
  }
}
