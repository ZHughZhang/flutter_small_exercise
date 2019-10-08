import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class ScaleAnimationRoute extends StatefulWidget {
  @override
  _ScaleAnimationRouteState createState() => _ScaleAnimationRouteState();
}

class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = Tween(begin: 0.0, end: 300.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("动画基本结构")),
      body: Container(
        child: Image.asset(
          "images/haha.gif",
          width: animation.value,
          height: animation.value,
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class AnimatedImage extends AnimatedWidget {
  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Image.asset(
        "images/01.jpg",
        width: animation.value,
        height: animation.value,
      ),
    );
  }

  AnimatedImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);
}

class ScaleAnimationRoute1 extends StatefulWidget {
  @override
  _ScaleAnimationRoute1State createState() => _ScaleAnimationRoute1State();
}

class _ScaleAnimationRoute1State extends State<ScaleAnimationRoute1> with SingleTickerProviderStateMixin{

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this,duration: const Duration(seconds: 3));
    animation  = Tween(begin: 0.0,end: 300.0).animate(controller);
    animation.addStatusListener((status){
      if (status == AnimationStatus.completed){
        controller.reverse();
      }else if (status == AnimationStatus.dismissed){
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
            title:Text("自定义Image动画")
        ),
        body:Container(
          child: AnimatedImage(animation:animation),
        ),

    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();

  }
}

