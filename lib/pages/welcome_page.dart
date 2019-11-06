import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class WelcomePageWidget extends StatefulWidget {
  static String routerName = "/";
  WelcomePageWidget({Key key}) : super(key: key);

  _WelcomePageWidgetState createState() => _WelcomePageWidgetState();
}

class _WelcomePageWidgetState extends State<WelcomePageWidget> {
  @override
  Widget build(BuildContext context) {
    return StoreBuilder(
      builder: (context, store) {
        return Container(
          color: Colors.white,
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Image(
                      image: AssetImage('statics/images/welcome.png'),
                    ),
                  ),
                ],
              ),
        );
      },
    );
  }
}