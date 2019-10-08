import 'package:flutter/material.dart';

class AlignLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
            title:Text("相对布局（align）")
        ),
        body:Container(

          color: Colors.blue[50],
          //align 只能包含一个子元素
          child:Align(
            //隐式设置宽高，父元素可以不用设置宽高
            widthFactor: 2,//子元素的宽*2
            heightFactor: 2,//子元素的高*2
           // alignment: Alignment.topRight,//相对位置
            //计算公式(Alignment.x*childWidth/2+childWidth/2, Alignment.x*childHeight+childHeight/2)
            //alignment: Alignment(2 ,0.0),//可以直接设置数字来指定位置
            //计算公式：实际偏移 = (FractionalOffse.x * childWidth, FractionalOffse.y * childHeight)
            alignment: FractionalOffset(0.2, 0.6),//通过设置偏移量来指定位置
            child: FlutterLogo(
              size: 60,
            ),
          ),

        ),
    );
  }
}




