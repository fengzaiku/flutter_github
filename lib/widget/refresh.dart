import 'dart:async';
import 'package:flutter/material.dart';

//AxisDirection不用于检测滚动方向，它用于返回Scrollable结构，在您的情况下，默认情况下，NestedScrollView具有scrollDirection = Axis.Vertical结构，使其从顶部开始，并从AxisDirection = AxisDirection.down开始。所以当你试图上下滚动时，你会得到相同的结果，因为滚动事件不会改变列表结构。
enum _RefreshIndicatorMode {
  drag,
  done,
  refresh,
  canceled,
  snap,
  armed, // 拖拽到足够大然后释放刷新
}

enum _ScrollDirection {
 down,    //向下
 up,      //向上
 left,    //向左
 right    //向右
}

class NestedScrollViewRefreshIndicator extends StatefulWidget {
  final Widget child;
  final Future<void> Function() onRefresh;
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
  _ScrollDirection  _direction;

  double _currentPosition = 0.0;
  static const int _differenceValue = 20;

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
        _isIndicatorAtTop = false;
//        _isIndicatorAtTop = null;
        return false;
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
//    判断滚动方向
    _judgeScrollDirection(notification);
    // 手指按下
    if (notification is ScrollNotification &&
        _mode == null &&
        _start(notification.metrics.axisDirection)) {
      setState(() {
        _mode = _RefreshIndicatorMode.drag;
      });
      return false;
    }

    if (notification is OverscrollNotification &&
        notification.metrics.extentAfter > 0 &&
        _mode != _RefreshIndicatorMode.refresh &&
        notification.metrics.axisDirection == AxisDirection.down) {
      _dragOffset -= notification.overscroll / 2;
      double newValue =
          _dragOffset / (notification.metrics.viewportDimension / 4);

      _positionController.value = newValue.clamp(0.0, 2.0);

      // 已经下拉到足够大，可以去刷新页面
      if (_RefreshIndicatorMode.drag == _mode &&
          _valueColor.value.alpha == 255) {
        _mode = _RefreshIndicatorMode.armed;
      }
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
//    print("notification.depth:---------------------------------------${notification.depth}");
//    print("notification--------------------------------------------${notification.runtimeType}");
//    print("当前位置--------------------------------------------${notification.metrics.pixels}");
//    print("是否在顶部或底部------------------------------------${notification.metrics.atEdge}");
//    print("垂直或水平滚动--------------------------------------${notification.metrics.axis}");
//    print("滚动方向是down还是up--------------------------------${notification.metrics.axisDirection}");
//    print("滚动方向是down还是up--------------------------------${notification.metrics.axisDirection}");
//    print("视口底部距离列表底部有多大--------------------------${notification.metrics.extentAfter}");
//    print("视口顶部距离列表顶部有多大--------------------------${notification.metrics.extentBefore}");
//    print("视口范围内的列表长度--------------------------------${notification.metrics.extentInside}");
//    print("最大滚动距离，列表长度-视口长度---------------------${notification.metrics.maxScrollExtent}");
//    print("最小滚动距离----------------------------------------${notification.metrics.minScrollExtent}");
//    print("视口长度--------------------------------------------${notification.metrics.viewportDimension}");
//    print("是否越过边界----------------------------------------${notification.metrics.outOfRange}");
//    print("_direction滚动方向是--------------------------------${_direction}");
    if (notification is UserScrollNotification) {
      print("UserScrollNotification滚动方向是--------------------------------${notification.direction}");
    }
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

  void _judgeScrollDirection(scrollInfo){
    switch(scrollInfo.metrics.axisDirection){
      case AxisDirection.down:
        if(scrollInfo.metrics.pixels - _currentPosition >= _differenceValue){
          _direction = _ScrollDirection.down;
          _currentPosition = scrollInfo.metrics.pixels;
        }

        if(_currentPosition - scrollInfo.metrics.pixels >= _differenceValue){
          _direction = _ScrollDirection.up;
          _currentPosition = scrollInfo.metrics.pixels;
        }
        break;
      case AxisDirection.up:
        if(scrollInfo.metrics.pixels - _currentPosition >= _differenceValue){
          _direction = _ScrollDirection.up;
          _currentPosition = scrollInfo.metrics.pixels;
        }

        if(_currentPosition - scrollInfo.metrics.pixels >= _differenceValue){
          _direction = _ScrollDirection.down;
          _currentPosition = scrollInfo.metrics.pixels;
        }
        break;
      case AxisDirection.right:
        if(scrollInfo.metrics.pixels - _currentPosition >= _differenceValue){
          _direction = _ScrollDirection.left;
          _currentPosition = scrollInfo.metrics.pixels;
        }

        if(_currentPosition - scrollInfo.metrics.pixels >= _differenceValue){
          _direction = _ScrollDirection.right;
          _currentPosition = scrollInfo.metrics.pixels;
        }
        break;
      case AxisDirection.left:
        if(scrollInfo.metrics.pixels - _currentPosition >= _differenceValue){
          _direction = _ScrollDirection.right;
          _currentPosition = scrollInfo.metrics.pixels;
        }

        if(_currentPosition - scrollInfo.metrics.pixels >= _differenceValue){
          _direction = _ScrollDirection.left;
          _currentPosition = scrollInfo.metrics.pixels;
        }
        break;
      default:
//
    }
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

      if (widget.onRefresh != null) {
        final Future<void> requestFuture = widget.onRefresh();

        requestFuture.whenComplete(() {
          completer.complete();
          _dismiss(_RefreshIndicatorMode.done);
        });
      } else {
        completer.complete();
        _dismiss(_RefreshIndicatorMode.done);
      }
    });
  }

  Future show() {
    return _pendingController;
  }

  bool _handleGlowNotification(OverscrollNotification notification) {
//    if(notification is OverscrollNotification){
      print("direction -----------------------------------滚动了${notification.overscroll}");
//    }
//    if (notification.depth == 1) {
//      notification.disallowGlow();
//      return true;
//    }
//    if(_mode == _RefreshIndicatorMode.refresh){
//      notification.disallowGlow();
//      return true;
//    }
//    print("notification.depth:${notification.depth}-------------notification.leading:${notification.leading}");
//
    return false;
  }

  final GlobalKey _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final bool showIndeterminateIndicator =
        _mode == _RefreshIndicatorMode.refresh ||
            _mode == _RefreshIndicatorMode.done;

    Widget child = NotificationListener<ScrollNotification>(
      key: _key,
      onNotification: _handleNotification,
      child: NotificationListener<OverscrollNotification>(
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
