import 'package:flutter/material.dart';
import 'dart:math' as math;

class TransformContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("变换（Transform）")),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              color: Colors.black,
              margin: EdgeInsets.only(bottom: 10),
              child: Transform(
                alignment: Alignment.topRight, //相对于坐标系原点对齐方式
                transform: Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
                child: Container(
                  padding: EdgeInsets.all(8),
                  color: Colors.deepOrange,
                  child: Text("Apartment for rent !"),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(color: Colors.red),
              child: Transform.translate(
                offset: Offset(-20, -5),
                child: Text("平移：hello Wold"),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.red),
              child: Transform.rotate(
                angle: math.pi / 2,
                child: Text("旋转： Hello World"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              color: Colors.red,
              child: Transform.scale(
                scale: 1.9,
                child: Text("旋转： HelloWold"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: Text("hello world"),
                  ),
                ),
                Text(
                  "你好 世界",
                  style: TextStyle(color: Colors.green),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 50, left: 120),
              //容器外填充
              constraints: BoxConstraints.tightFor(width: 200, height: 150),
              //卡片大小
              decoration: BoxDecoration(
                  //背景装饰器
                  gradient: RadialGradient(
                      colors: [Colors.red, Colors.orange],
                      center: Alignment.topLeft,
                      radius: .98),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 4
                  )
                ]
              ),
              transform: Matrix4.rotationZ(.2),
              alignment: Alignment.center,
              child: Text(
                "5.20",style: TextStyle(
                color: Colors.white,fontSize: 40
              ),
              ),

            )
          ],
        ),
      ),
    );
  }
}
