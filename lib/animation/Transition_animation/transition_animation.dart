import 'package:flutter/material.dart';
import 'package:flutter_small_exercise/animation/Transition_animation/animatedecoratedbox1.dart';
import 'package:flutter_small_exercise/animation/Transition_animation/animatedwidgetstest.dart';

import 'animateddecoratedbox.dart';

class TransitionAnimation extends StatefulWidget {
  @override
  _TransitionAnimationState createState() => _TransitionAnimationState();
}

class _TransitionAnimationState extends State<TransitionAnimation> {
  Color _decorationColor = Colors.blue;
  var duration = Duration(seconds: 2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("过渡动画")),
      body: Container(
        child: AnimatedWidgetsTest(),
//        child: AnimatedDecoratedBox(
//            duration: Duration(
//                milliseconds: _decorationColor == Colors.red ? 400 : 2000),
//            decoration: BoxDecoration(color: _decorationColor),
//          child: Builder(builder: (context){
//            return FlatButton(
//              onPressed: (){
//                setState(() {
//                  _decorationColor = _decorationColor == Colors.blue? Colors.red:Colors.blue;
//                });
//              },
//              child: Text("AnimateDecoratedBox1",style: TextStyle(color: Colors.white)),
//            );
//
//          }),
//        ),
//              child: FlatButton(onPressed: (){
//                setState(() {
//                  _decorationColor = Colors.red;
//
//                });
//              }, child: Text("AnimateDecoratedBox1",style: TextStyle(color: Colors.white),)),
//            ),
      ),
    );
  }
}
