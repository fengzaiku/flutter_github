import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_github/common/iconfont.dart';
import 'package:flutter_github/widget/user_icon.dart';
import 'package:flutter_github/widget/icon_text.dart';
import 'package:flutter_github/widget/pull_load.dart';
import 'package:flutter_github/widget/center_item_list.dart';
import 'package:flutter_github/widget/flutter_github_card.dart';
import 'package:flutter_github/widget/sliver_persistent_header_delegate.dart';

class MyCenterPageWidget extends StatefulWidget {
  MyCenterPageWidget({Key key}) : super(key: key);

  @override
  _MyCenterPageWidgetState createState() => _MyCenterPageWidgetState();
}

class _MyCenterPageWidgetState extends State<MyCenterPageWidget>
    with TickerProviderStateMixin<MyCenterPageWidget> {
  @override
  Widget build(BuildContext context) {
    return RefreshLoadedWidget(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
      return <Widget>[
        SliverPersistentHeader(
          delegate: SliverPersistentHeaderDelegateWidget(
              maxHeight: 210,
              minHeight: 210,
              snapConfig: FloatingHeaderSnapConfiguration(
                vsync: this,
                curve: Curves.easeOut,
              ),
              builder: (BuildContext context, double shrinkOffset,
                  bool overlapsContent) {
                return FgCardItemWidget(
                  elevation: 0,
                  color: Colors.black,
                  margin: EdgeInsets.all(0.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: SizedBox.expand(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 10, left: 10, right: 10, bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              UserIconWidget(width: 60, height: 60),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text("大海啊啊啊开始阶段和",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white)),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        FgIcons.alarm,
                                        size: 16,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  IconTextWidget(
                                    icon: FgIcons.community_dynamics,
                                    iconColor: Colors.white,
                                    text: "目前什么都没有",
                                    textStyle: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                  IconTextWidget(
                                    icon: FgIcons.access_trend,
                                    iconColor: Colors.white,
                                    text: "目前什么都没有",
                                    textStyle: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  )
                                ],
                              )
                            ],
                          ),
                          Text.rich(
                            TextSpan(text: "创建于:", children: <TextSpan>[
                              TextSpan(text: "2019-11-24"),
                            ]),
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
        SliverPersistentHeader(
          pinned: true,
          delegate: SliverPersistentHeaderDelegateWidget(
              minHeight: 70,
              maxHeight: 70,
              snapConfig: FloatingHeaderSnapConfiguration(vsync: this),
              builder: (BuildContext context, double shrinkOffset,
                  bool overlapsContent) {
                print(
                    "shrinkOffset------------------------------------------$shrinkOffset");
                double radius = ((70 - shrinkOffset) / 70) * 10;
                return FgCardItemWidget(
                  elevation: 0,
                  color: Colors.black,
                  margin: EdgeInsets.all(0.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(radius),
                        bottomRight: Radius.circular(radius)),
                  ),
                  child: CenterItemListWidget(
                    onPressed: () {},
                  ),
                );
              }),
        ),
        SliverPersistentHeader(
          delegate: SliverPersistentHeaderDelegateWidget(
              minHeight: 210,
              maxHeight: 210,
              snapConfig: FloatingHeaderSnapConfiguration(vsync: this),
              builder: (BuildContext context, double shrinkOffset,
                  bool overlapsContent) {
                return SizedBox.expand(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          height: 50,
                          child: Text(
                            "个人动态",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        FgCardItemWidget(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
//                            physics: BouncingScrollPhysics(),
                            child: Container(
                              child: Image.network(
                                "http://e.hiphotos.baidu.com/image/pic/item/4610b912c8fcc3cef70d70409845d688d53f20f7.jpg",
                                width:
                                    MediaQuery.of(context).size.width * 3 / 2,
                                height: 140,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        )
      ];
    }, itemBuilder: (BuildContext context, int index) {
      return FgCardItemWidget(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  UserIconWidget(),
                  Text("与在校"),
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text("${index + 1} 天前"),
                    ),
                  )
                ],
              ),
              Text("卡技术大会卡机但是空手道解放和看见士大夫 $index")
            ],
          ),
        ),
      );
    }
//        itemCount: 30,
        );
  }
}
