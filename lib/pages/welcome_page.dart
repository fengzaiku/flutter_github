import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter_redux/flutter_redux.dart';

class WelcomePageWidget extends StatefulWidget {
  static String routerName = "/";
  WelcomePageWidget({Key key}) : super(key: key);

  _WelcomePageWidgetState createState() => _WelcomePageWidgetState();
}

class _WelcomePageWidgetState extends State<WelcomePageWidget> {

  @override
  void didChangeDependencies() {
    Future.delayed(Duration(seconds: 2),(){
      print("时间到了");
      Navigator.pushNamed(context, 'login_page');
    });
    super.didChangeDependencies();
  }

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
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: FlareActor(
                    'statics/flr/flare_flutter_logo_.flr',
                    alignment: Alignment.bottomCenter,
                    fit: BoxFit.fill,
                    animation: "WelcomeLogoFlr",
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
