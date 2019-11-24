import 'package:flutter/material.dart';

class IconTextWidget extends StatelessWidget {
  final Color     iconColor;
  final double    iconSize;
  final IconData  icon;
  final String    text;
  final TextStyle textStyle;
  final double    textWidth;

  IconTextWidget(
      {
        Key key, 
        @required this.icon, 
        this.iconColor = Colors.grey, 
        this.iconSize = 12,
        this.text = '',
        this.textStyle,
        this.textWidth = 0,
        }
      )
      : super(key: key);

  Widget _renderText(){
    return textWidth != 0 ?
      Container(
        width: textWidth,
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: textStyle,
        ),
      ) :
      Container(
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: textStyle,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = this.textStyle;
    textStyle ??= TextStyle(color: Colors.grey,fontSize: 12);

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
//        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            icon,
            color: iconColor,
            size:  iconSize,
          ),
          SizedBox(width: 5),
          _renderText()
        ],
      ),
    );
  }
}
