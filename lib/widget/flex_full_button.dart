import 'package:flutter/material.dart';

class FlexFullButton extends StatelessWidget {
  FlexFullButton({
    Key key,
    this.mainAxisAlignment,
    this.direction,
    this.text,
    this.textStyle,
    this.fontSize,
    this.textColor,
    this.color,
    this.onPressed
    }):super(key:key);

  final MainAxisAlignment mainAxisAlignment;
  final Axis              direction;
  final String            text;
  final TextStyle         textStyle;
  final double            fontSize;
  final Color             textColor;
  final Color             color;
  final VoidCallback      onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: this.color?? Theme.of(context).primaryColor,
      // splashColor: Colors.blue,
      // highlightColor: Colors.blue,
      // colorBrightness: Brightness.dark,
      // hoverColor: Colors.blue,
      // disabledColor: Colors.blue,
      // disabledTextColor: Colors.blue,
      // focusColor: Colors.blue,

      // highlightElevation:1,
      // focusElevation:1,
      onPressed: () {
        onPressed?.call();
      },
      child: Flex(
        mainAxisAlignment: this.mainAxisAlignment??MainAxisAlignment.center,
        direction: this.direction??Axis.horizontal,
        children: <Widget>[
          Expanded(
            child: Text(this.text??"按钮文案",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: this.fontSize, color: this.textColor ?? Colors.white),
            ),
          )
        ],
      ),
    );
  }
}