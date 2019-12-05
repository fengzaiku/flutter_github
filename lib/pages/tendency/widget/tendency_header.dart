import 'package:flutter/material.dart';
import 'package:flutter_github/widget/flutter_sliver_app_bar.dart';
enum WhyFarther { harder, smarter, selfStarter, tradingCharter }
class TendencyHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterSliverAppbarWidget(
      pinned: true,
      minHeight: 65,
      maxHeight: 65,
      builder: (BuildContext context, double shrinkOffset,
          bool overlapsContent) {
        final double lr = 10 - shrinkOffset / 65 * 10;
        return Container(
          color: Colors.black,
          margin: EdgeInsets.only(
              bottom: 15, top: lr, left: lr, right: lr),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: PopupMenuButton<WhyFarther>(
                  onSelected: (WhyFarther result) {
                    print("$result");
                  },
                  offset: Offset(0, 65),
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
                    PopupMenuItem<WhyFarther>(
                      value: WhyFarther.harder,
                      child: ListTile(
                        title: Text("今日"),
                      ),
                    ),
                    PopupMenuItem<WhyFarther>(
                      value: WhyFarther.smarter,
                      child: ListTile(
                        title: Text("今月"),
                      ),
                    ),
                    PopupMenuItem<WhyFarther>(
                      value: WhyFarther.selfStarter,
                      child: ListTile(
                        title: Text("今年"),
                      ),
                    ),
                  ],
                ),
              ),
              VerticalDivider(
                color: Colors.white,
                width: 1,
                thickness: 1,
                indent: 15,
                endIndent: 15,
              ),
              Expanded(
                child: PopupMenuButton<WhyFarther>(
                  onSelected: (WhyFarther result) {
                    print("$result");
                  },
                  offset: Offset(0, 65),
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
        );
      },
    );
  }
}
