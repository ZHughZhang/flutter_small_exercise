import 'package:flutter/material.dart';
import 'package:flutter_small_exercise/animation/HeroAnimation.dart';
import 'package:flutter_small_exercise/animation/ScaleAnimationRoute.dart';
import 'package:flutter_small_exercise/animation/Transition_animation/transition_animation.dart';
import 'package:flutter_small_exercise/animation/animatedswitcher.dart';
import 'package:flutter_small_exercise/animation/staggeranimation.dart';
class AnimationRouter extends StatefulWidget {
  @override
  _AnimationRouterState createState() => _AnimationRouterState();
}

class _AnimationRouterState extends State<AnimationRouter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
            title:Text("动画")
        ),
        body:Container(
          child:Column(
            children: <Widget>[
              FlatButton(onPressed: (){
                _pushBuilder(context,ScaleAnimationRoute());
              }, child: Text('动画结构')),
              FlatButton(onPressed: (){
                _pushBuilder(context,ScaleAnimationRoute1());
              }, child: Text('动画结构自定义简化')),
              FlatButton(onPressed: (){
                _pushBuilder(context,HeroAnimationRoute());
              }, child: Text('Hero动画')),
              FlatButton(onPressed: (){
                _pushBuilder(context,StaggerRoute());
              }, child: Text('交织动画')),
              FlatButton(onPressed: (){
                _pushBuilder(context,AnimatedSwitcherCounterRoute());
              }, child: Text('AnimatedSwitcher')),
              FlatButton(onPressed: (){
                _pushBuilder(context,TransitionAnimation());
              }, child: Text('过渡动画')),
            ],
          ),
        ),

    );
  }
}


  void _pushBuilder(context,widget){
    Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 500),//动画时间为500毫秒
          pageBuilder: (context,animation,secondrayAnimation){
            return FadeTransition(
              //使用渐隐入过渡
              opacity: animation,
              child: widget,
            );
          }
        )
    );
  }

