import 'package:flutter/material.dart';

class IconTextWidget extends StatelessWidget {
  final Color     iconColor;
  final double    iconSize;
  final IconData  icon;
  final String    text;
  final TextStyle textStyle;
  final double    textWidth;
  final double    iconSpace;

  IconTextWidget(
      {
        Key key, 
        @required this.icon, 
        this.iconColor = Colors.grey, 
        this.iconSize = 12,
        this.text = '',
        this.textStyle,
        this.textWidth,
        this.iconSpace = 5,
        }
      )
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = this.textStyle;
    textStyle ??= TextStyle(color: Colors.grey,fontSize: 12);

    return IntrinsicWidth(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: iconColor,
            size:  iconSize,
          ),
          SizedBox(width: iconSpace),
          Expanded(
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textStyle,
            ),
          )
        ],
      ),
    );
  }
}
