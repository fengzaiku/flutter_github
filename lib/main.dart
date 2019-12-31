import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_github/common/event/event_bus.dart';
import 'package:flutter_github/mixin/http_error_listener.dart';
import 'package:flutter_github/model/RepositoryList.dart';
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
        child: Text(details.exception ?? "数据异常"),
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

class FlutterReduxApp extends StatefulWidget {
  @override
  _FlutterReduxAppState createState() => _FlutterReduxAppState();
}

class _FlutterReduxAppState extends State<FlutterReduxApp> with HttpListenerError<FlutterReduxApp>{
  final Store store = Store<AppState>(appReducer,
      initialState: AppState(
        userInfo:  User.empty(),
        repositoryList: RepositoryList.empty(),
        loginStatus: false,
      ),
      middleware: [thunkMiddleware]);
  GlobalKey _flutterReduxAppKey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        key: _flutterReduxAppKey,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: WelcomePageWidget(),
//            initialRoute: 'login_page',
        routes: {
          'login_page': (context) => LoginPageWidget(),
          'home_page': (context) => HomePageWidget(),
        },
      ),
    );
  }
}
