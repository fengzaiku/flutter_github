import 'package:flutter/material.dart';

class UserIconWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: EdgeInsets.only(top: 0, left: 0,right: 5),
      onPressed: (){
        print("点击了");
      },
      constraints: BoxConstraints(
        minWidth: 0,
        minHeight: 0
      ),
      child: ClipOval(
        child: FadeInImage(
          placeholder: AssetImage("statics/images/logo.png"),
          image: NetworkImage("http://e.hiphotos.baidu.com/image/pic/item/4610b912c8fcc3cef70d70409845d688d53f20f7.jpg"),
          width: 40,
          height: 40,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}