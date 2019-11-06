import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import './pages/welcome_page.dart';

// One simple action: Increment
enum Actions { Increment }

// The reducer, which takes the previous count and increments it in response
// to an Increment action.
int counterReducer(int state, dynamic action) {
  if (action == Actions.Increment) {
     print("更改state");
    return state + 1;
  }

  return state;
}

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

// void main() => runApp(MyApp());
class FlutterReduxApp extends StatelessWidget {
  final Store store = new Store<int>(counterReducer, initialState: 0);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
        store: store,
        child: MaterialApp(
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
          initialRoute: '/',
          routes: {
            WelcomePageWidget.routerName: (context) => WelcomePageWidget(),
          },
        ));
  }
}
