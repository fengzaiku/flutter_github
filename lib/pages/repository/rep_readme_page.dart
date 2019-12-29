import 'package:flutter/material.dart';
import 'package:flutter_github/widget/readme.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

typedef FutureValueCallBack = Future<String> Function();

class RepositionReadmePageWidget extends StatefulWidget {
  final String string;
  final String title;
  final FutureValueCallBack onRefresh;
  RepositionReadmePageWidget({Key key, this.string, this.title, this.onRefresh}) : super(key:key);
  @override
  _RepositionReadmePageWidgetState createState() => _RepositionReadmePageWidgetState();
}

class _RepositionReadmePageWidgetState extends State<RepositionReadmePageWidget> with AutomaticKeepAliveClientMixin{
// GlobalKey _refreshIndictorKey = GlobalKey<_RepositionReadmePageWidgetState>();
 GlobalKey<RefreshIndicatorState> _refreshIndictorKey = GlobalKey<RefreshIndicatorState>();
 String _markDownString = "";

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _onRefresh();
  }

//  @override
//  void didChangeDependencies() {
//    print(" _refreshIndictorKey.currentState.show().then((value){});-------------------${ _refreshIndictorKey.currentState}");
//    super.didChangeDependencies();
////    if(_refreshIndictorKey.currentState.show != null){
////      _refreshIndictorKey.currentState.show().then((value){});
////    }
//  }

  Future _onRefresh() async {
      if(widget.string != null){return;}
      if(widget.onRefresh != null){
        String result = await widget.onRefresh?.call();
        setState(() {
          _markDownString = result;
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: RefreshIndicator(
        key: _refreshIndictorKey,
        onRefresh: _onRefresh,
        child: ReadmePageWidget(data: widget.string ?? _markDownString,),
      ),
    );
  }
}
