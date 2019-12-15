import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter_github/common/const/global_const.dart';
import 'package:flutter_github/common/utils/local_storage.dart';
import 'package:flutter_github/router/page_router.dart';
import 'package:flutter_github/store/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';

class WelcomePageWidget extends StatefulWidget {
  WelcomePageWidget({Key key}) : super(key: key);

  _WelcomePageWidgetState createState() => _WelcomePageWidgetState();
}

class _WelcomePageWidgetState extends State<WelcomePageWidget> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(Duration(seconds: 2,milliseconds: 500),() async{
      bool isLogin = await _initUserInfo();
      print("登陆过了-------------$isLogin");
      if(isLogin){
        PageRouter.replaceHome(context);
      } else {
        PageRouter.replaceLogin(context);
      }
    });
  }

  Future<bool> _initUserInfo() async{
      var token = await LocalStorage.getItem(GlobalConst.TOKEN_KEY);
      return token != null;
  }
  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
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
