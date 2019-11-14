import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_github/widget/sliver_persistent_header_delegate.dart';

class TendencyPageWidget extends StatefulWidget {
  TendencyPageWidget({Key key}) : super(key: key);

  @override
  _TendencyPageWidgetState createState() => _TendencyPageWidgetState();
}

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class _TendencyPageWidgetState extends State<TendencyPageWidget>
    with SingleTickerProviderStateMixin {
  // final List _tabs = <String>["dahai"];

  List<Widget> _sliderver(BuildContext context, bool innerBoxIsScrolled) {
    return <Widget>[
      SliverPersistentHeader(
        pinned: true,
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
              final double lr = 10 - shrinkOffset / 65 * 10;
              print("shrinkOffset------------------------------$lr");
              // return SizedBox.expand(
              //   child: Padding(
              //      padding:
              //         EdgeInsets.only(top: lr, bottom: 15, left: lr, right: lr),
              //     child: Text("dahaihasdoasduiioadssu"),
              //   ),
              // );
              return SizedBox.expand(
                child: Padding(
                  padding:
                      EdgeInsets.only(bottom: 15, top: lr, left: lr, right: lr),
                  child: PopupMenuButton<WhyFarther>(
                    onSelected: (WhyFarther result) {
                      print("$result");
                    },
                    child: Text("惦记我"),
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<WhyFarther>>[
                      const PopupMenuItem<WhyFarther>(
                        value: WhyFarther.harder,
                        child: Text('Working a lot harder'),
                      ),
                      const PopupMenuItem<WhyFarther>(
                        value: WhyFarther.smarter,
                        child: Text('Being a lot smarter'),
                      ),
                      const PopupMenuItem<WhyFarther>(
                        value: WhyFarther.selfStarter,
                        child: Text('Being a self-starter'),
                      ),
                      const PopupMenuItem<WhyFarther>(
                        value: WhyFarther.tradingCharter,
                        child: Text('Placed in charge of trading charter'),
                      ),
                    ],
                  ), // These are the widgets to put in each tab in the tab bar.
                ),
              );
            }),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
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
          body: CustomScrollView(
                  key: PageStorageKey<String>("dahai"),
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
                ),
        ),
    );
  }
}
