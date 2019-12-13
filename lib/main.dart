import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_github/model/User.dart';
import 'package:flutter_github/store/app_state.dart';
import 'package:flutter_github/store/app_reducer.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_github/pages/welcome_page.dart';

import 'package:flutter_github/pages/login/login_page.dart';
import 'package:flutter_github/pages/home/page_home.dart';
import 'package:redux_thunk/redux_thunk.dart';

// One simple action: Increment
enum Actions { Increment }

void main() {
  runZoned(() {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      print(details);
      Zone.current.handleUncaughtError(details.exception, details.stack);
      return Container(
        color: Colors.transparent,
      );
    };
    runApp(FlutterReduxApp());
  }, onError: (Object exception, StackTrace stack) {
    print(exception);
    print(stack);
  });
}

String reducer(String state, dynamic action) =>
    action is String ? action : state;

class FlutterReduxApp extends StatelessWidget {
  final Store store = Store<AppState>(
    appReducer,
    initialState: AppState(
      userInfo: User.empty()
    ),
    middleware: [
      thunkMiddleware
    ]
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      store: store,
      child: StoreBuilder<AppState>(
        builder: (context, store){
        return  MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
          ),
//        home: Scaffold(
//          body: Text("看似简单发货卡死的回复"),
//        ),
          initialRoute: 'login_page',
          routes: {
            WelcomePageWidget.routerName: (context) => WelcomePageWidget(),
            'login_page': (context) => LoginPageWidget(),
            'home_page': (context) => HomePageWidget(),
          },
        );
      },),
    );
  }
}
