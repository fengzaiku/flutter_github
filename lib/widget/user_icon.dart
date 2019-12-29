import 'package:flutter/material.dart';

class UserIconWidget extends StatelessWidget {
  final double width;
  final double height;
  final String image;
  final VoidCallback onPressed;

  UserIconWidget(
      {Key key,
      this.width = 40.0,
      this.height = 40.0,
      this.image,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: EdgeInsets.only(top: 0, left: 0, right: 5),
      onPressed: () {
        print("点击了");
        this.onPressed?.call();
      },
      constraints: BoxConstraints(minWidth: 0, minHeight: 0),
      child: ClipOval(
        child: FadeInImage(
          placeholder: AssetImage("statics/images/logo.png"),
          image: NetworkImage(image ??
              "http://img95.699pic.com/photo/40166/2807.jpg_wh300.jpg"),
          width: width,
          height: height,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
