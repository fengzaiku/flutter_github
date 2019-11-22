import 'package:flutter/material.dart';

class MyCenterPageWidget extends StatefulWidget {
  MyCenterPageWidget({Key key}) : super(key: key);

  @override
  _MyCenterPageWidgetState createState() => _MyCenterPageWidgetState();
}

class _MyCenterPageWidgetState extends State<MyCenterPageWidget> {
  @override
  final GlobalKey centerKy = GlobalKey();
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: NestedScrollView(
          physics: BouncingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                key: centerKy,
                automaticallyImplyLeading: false,
//                  leading: Text("dasda"),
//                  title: const Text('Books'),
                  pinned: true,
                expandedHeight: 250.0,
                floating: true,
                snap: true,
                flexibleSpace: FlexibleSpaceBar(
//                    background: Image.asset('images/food01.jpeg', fit: BoxFit.cover),
                  background: Image.network('http://e.hiphotos.baidu.com/image/h%3D300/sign=a9e671b9a551f3dedcb2bf64a4eff0ec/4610b912c8fcc3cef70d70409845d688d53f20f7.jpg', fit: BoxFit.cover),
                ),
//                  forceElevated: innerBoxIsScrolled,
                bottom: TabBar(
                  tabs: <Widget>[
                    Tab(text: "大海华东",),
                    Tab(text: "大海华西",),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: <Widget>[
              ListView(
                itemExtent:50,
                children: <Widget>[
//                  SliverOverlapInjector(
//                      handle:NestedScrollView.sliverOverlapAbsorberHandleFor(context),
//                  ),
                  Text("text 1"),
                  Text("text 1"),
                  Text("text 1"),
                  Text("text 1"),
                  Text("text 1"),
                  Text("text 1"),
                  Text("text 1"),
                  Text("text 1"),
                  Text("text 1"),
                  Text("text 1"),
                  Text("text 1"),
                  Text("text 1"),
                  Text("text 1"),
                  Text("text 1"),
                  Text("text 1"),
                  Text("text 1"),
                  Text("text 1"),
                  Text("text 1"),
                  Text("text 1"),
                  Text("text 1"),
                ],
              ),
              ListView.builder(
                itemBuilder: (BuildContext context, int index){
                  return ListTile(
                    title: Text("text $index"),
                  );
                },
                itemCount: 30,
              ),
            ],
          ),
        )
    );
  }
}