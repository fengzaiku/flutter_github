import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_github/pages/login/widget/login_text_input.dart';
import 'package:flutter_github/store/async_reducers/user_reducers.dart';
import 'package:flutter_github/store/app_state.dart';
import 'package:flutter_github/widget/flex_full_button.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPageWidget extends StatefulWidget {
  LoginPageWidget({Key key}) : super(key: key);

  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  String  _username;
  String  _password;

  void _loginInputValueChange(String name, String value){
      if(name == 'username'){
        _username = value;
      }
      if(name == 'password'){
        _password = value;
      }
  }

  void _goTologin(store, context){
    if(_checkSubmit()){
      store.dispatch(loginAction(_username,_password, context));
    }
  }


  bool _checkSubmit(){
    String tostMsg = '';
    if(_username == null){
      tostMsg = "用户名不能为空";
    }
    if(_username != null && _password == null){
      tostMsg = "密码不能为空";
    }

    if(tostMsg.isNotEmpty){
      Fluttertoast.showToast(
          msg: tostMsg,
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.red,
          gravity: ToastGravity.TOP,
//          textColor: Colors.white,
          timeInSecForIos: 1
      );
    }
    return tostMsg.isEmpty;
  }
  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
      builder: (context, store){
        return Scaffold(
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    margin: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                    child: Padding(
                      padding:
                      EdgeInsets.only(left: 30, top: 40, right: 30, bottom: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image(
                            image: AssetImage('statics/images/logo.png'),
                            width: 100,
                            height: 100,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          LoginTextInput(
                            icon: Icons.person,
                            name: "username",
                            hintText: "请输入用户名",
                            onChanged: _loginInputValueChange,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          LoginTextInput(
                            name: "password",
                            icon: Icons.lock,
                            obscureText: true,
                            hintText: "请输入密码",
                            onChanged: _loginInputValueChange,
                          ),
                          SizedBox(
                            height: 20,
                          ),
//                          StoreConnector<AppState, dynamic>(
//                              converter: (Store<AppState> store){
//                                return (String username, String password,BuildContext context) =>
//                                    store.dispatch(loginAction(username, password, context));
//                              },
//                            builder: (BuildContext context, login){
//                                return FlexFullButton(
//                                  text: store.state.userInfo.name,
//                                  onPressed: (){
//                                    login(_username,_password,context);
//                                  },
//                                );
//                            },
//                          ),
                          FlexFullButton(
                            text: store.state.userInfo.name,
                            onPressed: (){
                              print("$_username---------------$_password---------------------${store.state}");
                              _goTologin(store,context);
//                              store.dispatch(loginAction(_username,_password, context));
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
