import 'package:flutter/material.dart';

class AnimateDecoratedBox1 extends StatefulWidget {
  final BoxDecoration decortation;

  final Widget child;

  final Curve curve;

  final Duration duration;

  final Duration reverseDuration;




  @override
  _AnimateDecoratedBox1State createState() => _AnimateDecoratedBox1State();

  AnimateDecoratedBox1({
    Key key,
    @required this.decortation,
    this.child,
    this.curve = Curves.linear,
    @required this.duration,
    this.reverseDuration,
});
}

class _AnimateDecoratedBox1State extends State<AnimateDecoratedBox1> with SingleTickerProviderStateMixin {

  @protected
  AnimationController get controller => _controller;
  AnimationController _controller;
  Animation<double> get animation => _animation;
  Animation _animation;

  DecorationTween _tween;



  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: _animation, builder: (context,child){
      return DecoratedBox(
        decoration: _tween.animate(_animation).value,
        child: child,
      );
    },
    child: widget.child,
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      reverseDuration: widget.reverseDuration,
      vsync: this,
    );
    _tween = DecorationTween(begin: widget.decortation);
    _updateCurve();
  }

  void _updateCurve() {
    if (widget.curve != null) {
      _animation = CurvedAnimation(parent: _controller,curve: widget.curve);

    }else {
      _animation = _controller;

    }
  }

  @override
  void didUpdateWidget(AnimateDecoratedBox1 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.curve != oldWidget.curve) {
      _updateCurve();
      _controller.duration = widget.duration;
      _controller.reverseDuration = widget.reverseDuration;
    }
    if (widget.decortation != (_tween.end?? _tween.begin)) {
      _tween..begin = _tween.evaluate(_animation)
          ..end=widget.decortation;
      _controller..value = 0.0
      ..forward();

    }
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();

  }


}

