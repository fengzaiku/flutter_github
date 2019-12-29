import 'package:flutter/material.dart';
import 'package:flutter_github/widget/readme.dart';

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
 String _markDownString = "";

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _onRefresh();
  }

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
        onRefresh: _onRefresh,
        child: ReadmePageWidget(data: widget.string ?? _markDownString,),
      ),
    );
  }
}
