import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ReadmePageWidget extends StatelessWidget {
  final String data;

  ReadmePageWidget({Key key,@required this.data}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10,20,10,20),
      physics: BouncingScrollPhysics(),
      child: MarkdownBody(
        selectable: true,
        data: data,
      ),
    );
  }
}
