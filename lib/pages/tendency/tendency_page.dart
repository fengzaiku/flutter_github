import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:flutter_github/widget/sliver_persistent_header_delegate.dart';

class TendencyPageWidget extends StatefulWidget {
  TendencyPageWidget({Key key}) : super(key: key);

  @override
  _TendencyPageWidgetState createState() => _TendencyPageWidgetState();
}

final List _tabs = <String>["dahai", "xiaohai"];

// List<Widget> sliderver(BuildContext context, bool innerBoxIsScrolled){
//   return <Widget>[
//     SliverPersistentHeader(
//       delegate: SliverPersistentHeaderDelegateWidget(
//           minHeight: 65,
//           maxHeight: 65,
//           // changeSize: true,
//           snapConfig: FloatingHeaderSnapConfiguration(
//             vsync: this,
//             curve: Curves.bounceInOut,
//             duration: const Duration(milliseconds: 10),
//           ),
//           builder: (BuildContext context, double shrinkOffset,
//               bool overlapsContent) {
//             return TabBar(
//               // These are the widgets to put in each tab in the tab bar.
//               // tabs: _tabs.map((String name) => Tab(text: name)).toList(),
//               tabs: _tabs.map((name) {
//                 return Tab(text: name);
//               }).toList(),
//             );
//           }),
//     ),
//   ];
// }

class _TendencyPageWidgetState extends State<TendencyPageWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length, // This is the number of tabs.
      child: NestedScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          // These are the slivers that show up in the "outer" scroll view.
          // return sliderver(context, innerBoxIsScrolled);
          return <Widget>[
            SliverOverlapAbsorber(
              // This widget takes the overlapping behavior of the SliverAppBar,
              // and redirects it to the SliverOverlapInjector below. If it is
              // missing, then it is possible for the nested "inner" scroll view
              // below to end up under the SliverAppBar even when the inner
              // scroll view thinks it has not been scrolled.
              // This is not necessary if the "headerSliverBuilder" only builds
              // widgets that do not overlap the next sliver.
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              child: SliverAppBar(
                // title: const Text('Books'), // This is the title in the app bar.
                pinned: true,
                expandedHeight: 150.0,
                // The "forceElevated" property causes the SliverAppBar to show
                // a shadow. The "innerBoxIsScrolled" parameter is true when the
                // inner scroll view is scrolled beyond its "zero" point, i.e.
                // when it appears to be scrolled below the SliverAppBar.
                // Without this, there are cases where the shadow would appear
                // or not appear inappropriately, because the SliverAppBar is
                // not actually aware of the precise position of the inner
                // scroll views.
                // forceElevated: innerBoxIsScrolled,
                bottom: TabBar(
                  // These are the widgets to put in each tab in the tab bar.
                  // tabs: _tabs.map((String name) => Tab(text: name)).toList(),
                  tabs: _tabs.map((name) {
                    return Tab(text: name);
                  }).toList(),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          // These are the contents of the tab views, below the tabs.
          children: _tabs.map((name) {
            return SafeArea(
              top: false,
              bottom: false,
              child: CustomScrollView(
                key: PageStorageKey<String>(name),
                slivers: <Widget>[
                  SliverOverlapInjector(
                    // This is the flip side of the SliverOverlapAbsorber above.
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                  ),
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
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
