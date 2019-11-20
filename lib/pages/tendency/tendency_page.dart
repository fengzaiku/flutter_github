import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_github/widget/refresh.dart';
import 'package:flutter_github/widget/tendency_item.dart';
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
//        floating: true,
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
              final double rd = 10 - shrinkOffset / 8 * 10;
//              print("shrinkOffset------------------------------$lr");
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
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(rd),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: PopupMenuButton<WhyFarther>(
                            onSelected: (WhyFarther result) {
                              print("$result");
                            },
                            child: Center(
                              child: Text(
                                "惦记我",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<WhyFarther>>[
                              const PopupMenuItem<WhyFarther>(
                                value: WhyFarther.harder,
                                child: Text('今日'),
                              ),
                              const PopupMenuItem<WhyFarther>(
                                value: WhyFarther.smarter,
                                child: Text('本周'),
                              ),
                              const PopupMenuItem<WhyFarther>(
                                value: WhyFarther.selfStarter,
                                child: Text('本月'),
                              ),
                            ],
                          ),
                        ),
                        VerticalDivider(
                          color: Colors.white,
                          width: 1,
                          thickness:1,
                          indent: 15,
                          endIndent: 15,
                        ),
                        Expanded(
                          child: PopupMenuButton<WhyFarther>(
                            onSelected: (WhyFarther result) {
                              print("$result");
                            },
                            child: Center(
                              child: Text(
                                "惦记我1111",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
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
                                child:
                                    Text('Placed in charge of trading charter'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    ];
  }

  Future _onRefreshGetDate(){
    return Future.delayed(Duration(milliseconds: 1000)).then((value) {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollViewRefreshIndicator(
        child: NestedScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          // These are the slivers that show up in the "outer" scroll view.
          return _sliderver(context, innerBoxIsScrolled);
        },
        body: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return TendencyItemWidget();
          },
          itemCount: 10,
        ),
      ),
        onRefresh: _onRefreshGetDate
      ),
    );
  }
}
