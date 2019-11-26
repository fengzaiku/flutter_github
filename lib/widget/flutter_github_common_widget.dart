import 'package:flutter/material.dart';

class FlutterGithubColumnFlatButtonWidget extends StatelessWidget {
  final List children;
  final VoidCallback onPressed;
  final int flex;
  FlutterGithubColumnFlatButtonWidget({
    @required this.onPressed,
    @required this.children,
    this.flex = 1
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: FlatButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
