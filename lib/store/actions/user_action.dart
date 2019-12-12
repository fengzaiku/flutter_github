import 'package:redux/redux.dart';
//import 'package:flutter_github/store/middleware/chunk.dart';
import 'package:flutter_github/model/User.dart';
// Action
//class UserUpdateAction{
//  final User userInfo;
//  UserUpdateAction(this.userInfo);
//}

void action(Store<User> store) async {
  print(store);
  final String searchResults = await Future.delayed(
    Duration(seconds: 1),
        (){
          print("来这里了");
          return "Search Results1231";
        },
  );
  print("132123123123");
  store.dispatch(searchResults);
}