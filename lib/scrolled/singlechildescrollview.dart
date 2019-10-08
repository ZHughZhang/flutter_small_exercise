import 'package:flutter/material.dart';

class SingleChildeScrollViews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";


    return Scaffold(
        appBar:AppBar(
            title:Text("SingleChildeScrollView")
        ),
        body:Container(


          /**
           *SingleChildScrollView({
           *  this.scrollDirection = Axis.vertical, //滚动方向，默认是垂直方向
           *  //是否按照阅读方向反向滑动，true 为从右边向左，false 反之，本质是滚动组件的起始位置的改变
           *  this.reverse = false,
           *  this.padding,
           *  //是否指定widget树中默认的PrimaryScrollController；当滑动方向为垂直方向（scrolldeirection值为Axis.vertical）并且没有指定controller时，primary默认为true
           *  bool primary,
           *  this.physics,
           *  this.controller,
           *  this.child,
           *  })
           */
        child: Scrollbar(
          child: SingleChildScrollView(
            padding:EdgeInsets.all(16),
            child: Center(
              child: Column(
                children:
                  str.split("").map((e){
                        return Text(e,textScaleFactor: 2,);
                  }).toList(),
              ),
            ),
        ),)


        ),
    );
  }
}




