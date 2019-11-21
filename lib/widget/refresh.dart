import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_github/pages/tendency/refresh.dart';

enum _RefreshIndicatorMode {
  drag,
  done,
  refresh,
  canceled,
  snap,
  armed, // 拖拽到足够大然后释放刷新
}

class NestedScrollViewRefreshIndicator extends StatefulWidget {
  final Widget child;
  final NestedScrollViewRefreshCallback onRefresh;
  final Color color;

  NestedScrollViewRefreshIndicator(
      {Key key, @required this.child, this.color, this.onRefresh})
      : super(key: key);

  @override
  _NestedScrollViewRefreshIndicatorState createState() =>
      _NestedScrollViewRefreshIndicatorState();
}

class _NestedScrollViewRefreshIndicatorState
    extends State<NestedScrollViewRefreshIndicator>
    with TickerProviderStateMixin {
  AnimationController _positionController;
  AnimationController _scaleController;
  Animation<double> _positionFactor;
  Animation<double> _scaleFactor;
  Animation<double> _value;
  Animation<Color> _valueColor;

  bool _isIndicatorAtTop = false;
  double _dragOffset;
  _RefreshIndicatorMode _mode;
  Future<void> _pendingController;

  static final Animatable<double> _sizePositionTween =
      Tween<double>(begin: 0, end: 0.75);

  @override
  void initState() {
    super.initState();
    _positionController = AnimationController(vsync: this);
    _positionFactor = _positionController.drive(Tween(begin: 0, end: 1.5));
    _value = _positionController.drive(_sizePositionTween);

    _scaleController = AnimationController(vsync: this);
    _scaleFactor = _scaleController.drive(Tween(begin: 1.0, end: 0));
  }

  @override
  void didChangeDependencies() {
    final ThemeData theme = Theme.of(context);

    _valueColor = _positionController.drive(ColorTween(
            begin: (widget.color ?? theme.accentColor).withOpacity(0.0),
            end: (widget.color ?? theme.accentColor).withOpacity(1.0))
        .chain(CurveTween(curve: const Interval(0.0, 1.0 / 1.5))));
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _positionController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  bool _start(AxisDirection direction) {
    switch (direction) {
      case AxisDirection.down:
        _isIndicatorAtTop = true;
        break;
      case AxisDirection.up:
        _isIndicatorAtTop = false;
        break;
      default:
//        _isIndicatorAtTop = null;
    }
    _dragOffset = 0.0;
    _scaleController.value = 0.0;
    _positionController.value = 0.0;
    return true;
  }

  Future<void> _dismiss(_RefreshIndicatorMode newMode) async {
    switch (newMode) {
      case _RefreshIndicatorMode.done:
        print("adadsasdasda");
        await _scaleController.animateTo(1.0,
            duration: Duration(milliseconds: 200));
        break;
      case _RefreshIndicatorMode.canceled:
        await _positionController.animateTo(0.0,
            duration: Duration(milliseconds: 200));
        break;
      default:
//
    }
    if (mounted) {
      _dragOffset = null;
      _isIndicatorAtTop = false;
      setState(() {
        _mode = null;
      });
    }
  }

  bool _handleNotification(ScrollNotification notification) {
    // 手指按下
    if (notification is ScrollNotification &&
        _mode == null &&
        _start(notification.metrics.axisDirection)) {
      setState(() {
        _mode = _RefreshIndicatorMode.drag;
      });
      return false;
    }

//    print("_valueColor.value------------------------${_valueColor.value.alpha}");
    if (notification is OverscrollNotification &&
        notification.metrics.extentAfter > 0 &&
        _mode != _RefreshIndicatorMode.refresh) {
      _dragOffset -= notification.overscroll / 2;
      double newValue =
          _dragOffset / (notification.metrics.viewportDimension / 4);
//      print("notification.overscroll------------------${notification.overscroll}");
//      print("scaleFactor.value------------------------${_scaleController.value}");
//      print("_valueColor.value------------------------${_valueColor.value.alpha}");
      _positionController.value = newValue.clamp(0.0, 2.0);

      // 已经下拉到足够大，可以去刷新页面
      if (_RefreshIndicatorMode.drag == _mode &&
          _valueColor.value.alpha == 255) {
        _mode = _RefreshIndicatorMode.armed;
      }
//      print(notification.metrics.viewportDimension);
//      print(notification.overscroll/notification.metrics.viewportDimension);
//      print(_dragOffset);
//      print(newValue);
    }
    if (notification is ScrollUpdateNotification) {
      if (_mode == _RefreshIndicatorMode.drag ||
          _mode == _RefreshIndicatorMode.armed) {
        if (notification.metrics.extentBefore > 0 &&
            _mode != _RefreshIndicatorMode.refresh) {
          _dismiss(_RefreshIndicatorMode.canceled);
        }
      }
    }

    if (notification is ScrollEndNotification) {
      switch (_mode) {
        case _RefreshIndicatorMode.armed:
          _show();
          break;
        // 在下拉还没有触发，刷新的时候，停止下拉时。则立即停止
        case _RefreshIndicatorMode.drag:
          _dismiss(_RefreshIndicatorMode.canceled);
          break;
        default:
//
      }
    }

//    print("notification--------------------------------------------${notification.runtimeType}");
//    print("当前位置--------------------------------------------${notification.metrics.pixels}");
//    print("是否在顶部或底部------------------------------------${notification.metrics.atEdge}");
//    print("垂直或水平滚动--------------------------------------${notification.metrics.axis}");
//    print("滚动方向是down还是up--------------------------------${notification.metrics.axisDirection}");
//    print("视口底部距离列表底部有多大--------------------------${notification.metrics.extentAfter}");
//    print("视口顶部距离列表顶部有多大--------------------------${notification.metrics.extentBefore}");
//    print("视口范围内的列表长度--------------------------------${notification.metrics.extentInside}");
//    print("最大滚动距离，列表长度-视口长度---------------------${notification.metrics.maxScrollExtent}");
//    print("最小滚动距离----------------------------------------${notification.metrics.minScrollExtent}");
//    print("视口长度--------------------------------------------${notification.metrics.viewportDimension}");
//    print("是否越过边界----------------------------------------${notification.metrics.outOfRange}");

//     print(notification.metrics.axisDirection);
    switch (notification.metrics.axisDirection) {
      case AxisDirection.down:
        break;
      default:
//
    }
//    print("-------------------------------->$notification");
    return true;
  }

  void _show() {
    final Completer completer = Completer();
    _pendingController = completer.future;
    _positionController
        .animateTo(1 / 1.5, duration: Duration(milliseconds: 150))
        .then<void>((void value) {
      setState(() {
        _mode = _RefreshIndicatorMode.refresh;
      });

      final Future<void> requestFuture = widget.onRefresh();

      if (requestFuture == null) return;

      requestFuture.whenComplete(() {
        completer.complete();
        _dismiss(_RefreshIndicatorMode.done);
      });
    });
  }

  Future show() {
    return _pendingController;
  }

  bool _handleGlowNotification(OverscrollIndicatorNotification notification) {
//    if(_mode == _RefreshIndicatorMode.refresh){
//      notification.disallowGlow();
//      return true;
//    }
//    print("notification.depth:${notification.depth}-------------notification.leading:${notification.leading}");
//    notification.disallowGlow();
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final bool showIndeterminateIndicator =
        _mode == _RefreshIndicatorMode.refresh ||
            _mode == _RefreshIndicatorMode.done;

    Widget child = NotificationListener<ScrollNotification>(
      onNotification: _handleNotification,
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: _handleGlowNotification,
        child: widget.child,
      ),
    );
    return Stack(
      children: <Widget>[
        child,
        Positioned(
          top: _isIndicatorAtTop ? 0 : null,
          bottom: !_isIndicatorAtTop ? 0 : null,
          left: 0,
          right: 0,
          child: SizeTransition(
            axisAlignment: _isIndicatorAtTop ? 1 : -1,
            sizeFactor: _positionFactor,
            child: Container(
              padding: _isIndicatorAtTop
                  ? EdgeInsets.only(top: 10)
                  : EdgeInsets.only(bottom: 10),
              alignment: _isIndicatorAtTop
                  ? Alignment.topCenter
                  : Alignment.bottomCenter,
              child: ScaleTransition(
                scale: _scaleFactor,
                child: AnimatedBuilder(
                  animation: _positionController,
                  builder: (BuildContext context, Widget child) {
                    return RefreshProgressIndicator(
                      value: showIndeterminateIndicator ? null : _value.value,
                      valueColor: _valueColor,
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
