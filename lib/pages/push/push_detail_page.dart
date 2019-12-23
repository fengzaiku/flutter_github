import 'package:flutter/material.dart';
import 'package:flutter_github/common/const/api.dart';
import 'package:flutter_github/common/utils/http.dart';
import 'package:flutter_github/pages/push/widget/push_code_header.dart';
import 'package:flutter_github/pages/push/widget/push_code_item.dart';
import 'package:flutter_github/utils/widget_standard.dart';

class PushDetailPageWidget extends StatefulWidget {
  final String reposOwner;
  final String reposName;
  final String sha;

  PushDetailPageWidget(this.reposOwner, this.reposName, this.sha, {Key key})
      : super(key: key);

  @override
  _PushDetailPageWidgetState createState() => _PushDetailPageWidgetState();
}

class _PushDetailPageWidgetState extends State<PushDetailPageWidget> {
  int _count = 20;

  @override
  void initState() {
//    _controller = EasyRefreshController();
    super.initState();
  }

  Future<void> _onRefresh() async {
    var result = await http.get(Api.getReposCommitsInfo(
        widget.reposOwner, widget.reposName, widget.sha));
//    PushHeaderViewModel.forMap()
  }

//  @override
//  void dispose() {
//    super.dispose();
//    _controller.dispose();
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("push 详情页"),
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
//        child: SingleChildScrollView(
//              child: ListView.builder(
//                shrinkWrap: true,
//                itemBuilder: (BuildContext context, int index) {
////                  return PushCodeItemWidget();
//                  return Text("kasjdfhksjdfh-----------------$index");
//                },
//                itemCount: _count,
//              ),
//            ),
//        ),
        child: Column(
          children: <Widget>[
            PushCodeHeaderWidget(),
            Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return PushCodeItemWidget();
                  },
                  itemCount: _count,
                ),
            ),
          ],
        ),
      ),
    );
  }
}
