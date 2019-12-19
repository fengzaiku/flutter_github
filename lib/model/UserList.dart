import 'package:flutter_github/model/User.dart';

class UserList{
  List<User> userList;
  UserList(this.userList);

  factory UserList.fromJson(List list) {
    List<User> _repository = list.map((e){
      if(e == null){
        return null;
      }
      return User.fromJson(e as Map<String, dynamic>);
    })?.toList();

    return UserList(_repository);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'userList': this.userList,
  };

  UserList.empty();
}