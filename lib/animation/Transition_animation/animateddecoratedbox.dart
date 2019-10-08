import 'package:flutter/material.dart';

class AnimatedDecoratedBox extends ImplicitlyAnimatedWidget{
  final BoxDecoration decoration;

  final Widget child;




  AnimatedDecoratedBox({
    Key key,
    @required this.decoration,
    this.child,
    Curve curve = Curves.linear,
    @required Duration duration,
}) :super(key:key,curve:curve,duration:duration,);

  @override
  _AnimatedDecoratedBoxSrate createState() {
    return _AnimatedDecoratedBoxSrate();
  }


}


class _AnimatedDecoratedBoxSrate extends AnimatedWidgetBaseState<AnimatedDecoratedBox>{

  DecorationTween _decoration;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(decoration: _decoration.evaluate(animation),
    child: widget.child,
    );
  }

  @override
  void forEachTween(visitor) {
    _decoration = visitor(_decoration,widget.decoration,(value) => DecorationTween(begin: value));
  }

}
