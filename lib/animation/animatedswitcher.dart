import 'package:flutter/material.dart';

class AnimatedSwitcherCounterRoute extends StatefulWidget {
  @override
  _AnimatedSwitcherCounterRouteState createState() =>
      _AnimatedSwitcherCounterRouteState();
}

class _AnimatedSwitcherCounterRouteState
    extends State<AnimatedSwitcherCounterRoute> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("通过'切换动画' 组件")),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (child, animation) {
                  var tween =
                      Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
                  //左右滑出
                  return SlideTranstionX(
                    position: animation,
                    child: child,
                      direction: AxisDirection.down

                  );
//                  return MySlideTranstion(
//                    position: tween.animate(animation),
//                    child: child,
//                  );

                  //淡出
                  /*return ScaleTransition(
                    scale: animation,
                    child: child,
                  );*/
                },
                child: Text(
                  '$_count',
                  key: ValueKey<int>(_count),
                  style: Theme.of(context).textTheme.display1,
                ),
              ),
              RaisedButton(
                  child: Text('+1'),
                  onPressed: () {
                    setState(() {
                      _count += 1;
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class MySlideTranstion extends AnimatedWidget {
  final Widget child;
  final bool transformHitTests;

  Animation<Offset> get postion => listenable;

  @override
  Widget build(BuildContext context) {
    Offset offset = postion.value;
    //动画反向执行时，调整x偏移，实现'从左边滑出隐藏
    if (postion.status == AnimationStatus.reverse) {
      offset = Offset(-offset.dy, -offset.dx);
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }

  MySlideTranstion(
      {Key key,
      @required Animation<Offset> position,
      this.transformHitTests = true,
      this.child})
      : assert(position != null),
        super(key: key, listenable: position);
}
/**
 * 左出右入 动画
 */
class SlideTranstionX extends AnimatedWidget {
  Animation<double> get position => listenable;
  final bool transformHitsTests;
  final Widget child;
  final AxisDirection direction;

  Tween<Offset> _tween;

  @override
  Widget build(BuildContext context) {

    Offset offset = _tween.evaluate(position);
    if(position.status == AnimationStatus.reverse){
      switch (direction){
        case AxisDirection.up:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.right:
          offset = Offset(-offset.dx, offset.dy);
          break;
        case AxisDirection.down:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.left:
          offset = Offset(-offset.dx, offset.dy);
          break;
      }
    }

    return FractionalTranslation(translation: offset,
    transformHitTests: transformHitsTests,child: child,);
  }

  SlideTranstionX(
      {Key key,
      @required Animation<double> position,
      this.transformHitsTests = true,
      this.direction = AxisDirection.down,
      this.child})
      : assert(position != null),
        super(key: key, listenable: position) {
    //偏移在内部处理
    switch (direction) {
      case AxisDirection.up:
        _tween = Tween(begin: Offset(0, 1), end: Offset(0, 0));
        break;
      case AxisDirection.right:
        _tween = Tween(begin: Offset(-1, 0), end: Offset(0, 0));
        break;
      case AxisDirection.down:
        _tween = Tween(begin: Offset(0, -1), end: Offset(0, 0));
        break;
      case AxisDirection.left:
        _tween = Tween(begin: Offset(1, 0), end: Offset(0, 0));
        break;
    }
  }
}
