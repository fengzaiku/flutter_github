import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_github/widget/sliver_persistent_header_delegate.dart';

class TendencyPageWidget extends StatefulWidget {
  TendencyPageWidget({Key key}) : super(key: key);

  @override
  _TendencyPageWidgetState createState() => _TendencyPageWidgetState();
}

class _TendencyPageWidgetState extends State<TendencyPageWidget>
    with SingleTickerProviderStateMixin {
  final List _tabs = <String>["dahai", "xiaohai"];

  List<Widget> _sliderver(BuildContext context, bool innerBoxIsScrolled) {
    return <Widget>[
      SliverPersistentHeader(
        delegate: SliverPersistentHeaderDelegateWidget(
            minHeight: 65,
            maxHeight: 65,
            // changeSize: true,
            snapConfig: FloatingHeaderSnapConfiguration(
              vsync: this,
              curve: Curves.bounceInOut,
              duration: const Duration(milliseconds: 10),
            ),
            builder: (BuildContext context, double shrinkOffset,
                bool overlapsContent) {
              return TabBar(
                // These are the widgets to put in each tab in the tab bar.
                // tabs: _tabs.map((String name) => Tab(text: name)).toList(),
                tabs: _tabs.map((name) {
                  return Tab(
                      child: Text(
                    name,
                    style: TextStyle(color: Colors.black),
                  ));
                }).toList(),
              );
            }),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: _tabs.length, // This is the number of tabs.
        child: NestedScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            // These are the slivers that show up in the "outer" scroll view.
            return _sliderver(context, innerBoxIsScrolled);
          },
          // body: ListView.builder(
          //   physics: const AlwaysScrollableScrollPhysics(),
          //   itemBuilder: (context, index) {
          //     return Text("$index");
          //   },
          //   itemCount: 50,
          // ),
          body: TabBarView(
            // These are the contents of the tab views, below the tabs.
            children: _tabs.map((name) {
              return CustomScrollView(
                key: PageStorageKey<String>(name),
                slivers: <Widget>[
                  // SliverOverlapInjector(
                  //   // This is the flip side of the SliverOverlapAbsorber above.
                  //   handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                  //       context),
                  // ),
                  SliverPadding(
                    padding: const EdgeInsets.all(8.0),
                    sliver: SliverFixedExtentList(
                      itemExtent: 48.0,
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return ListTile(
                            title: Text('Item $index'),
                          );
                        },
                        childCount: 30,
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
