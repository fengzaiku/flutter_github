import 'package:flutter/material.dart';

class NestedScrollViewRefreshIndicator extends StatefulWidget {
  final Widget child;

  NestedScrollViewRefreshIndicator({Key key, @required this.child})
      : super(key: key);
  @override
  _NestedScrollViewRefreshIndicatorState createState() =>
      _NestedScrollViewRefreshIndicatorState();
}

class _NestedScrollViewRefreshIndicatorState
    extends State<NestedScrollViewRefreshIndicator>
    with TickerProviderStateMixin {

  AnimationController _positionController;
  Animation           _positionFactor;
  Animation<double>   _value;

  static final Animatable<double> _sizePositionTween = Tween<double>(begin: 0, end: 0.75); 

  @override
  void initState() {
    super.initState();
    _positionController =   AnimationController(vsync: this);
    _positionFactor     =   _positionController.drive(Tween(begin: 0, end: 1.5));
    _value              =   _positionController.drive(_sizePositionTween);
  }

  @override
  void dispose() {
    _positionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget child = NotificationListener(
      onNotification: (notification) {
        // print(notification.runtimeType);
        // print(notification);
        print("-------------------------------->$notification");
        return true;
      },
      child: widget.child,
    );
    return Stack(
      children: <Widget>[
        child,
        Positioned(
          top: 0,
          bottom: null,
          left: 0,
          right: 0,
          // child: SizeTransition(
          //   sizeFactor: _positionFactor,
            child: Container(
              // padding: EdgeInsets.only(top: 10),
              alignment: Alignment.topCenter,
              // child: RefreshProgressIndicator(
              //         // value: _value.value,
              //           // valueColor: Animation.,
              //           ),
              child: AnimatedBuilder(
                animation: _positionController,
                builder: (BuildContext context, Widget child) {
                  return RefreshProgressIndicator(
                    // value: _value.value,
                      // valueColor: Animation.,
                      );
                },
              ),
            ),
          // ),
        ),
      ],
    );
  }
}
