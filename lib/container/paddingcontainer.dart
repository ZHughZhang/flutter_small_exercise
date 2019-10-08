import 'package:flutter/material.dart';

class PaddingContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("内填充（padding）")),
      body: Container(
        child: Padding(
          /**
           * EdgeInsets
           * fromLTRB(double left,doueble top,doueble right,double bottom);
           * 分别指定四个方向填充
           * all(double value):所有方向填充相同的数值
           * only({left,top,right,bottom}) 选择性填充想要填充的位置
           * symmetric({vertical,hoizontal}): 用于设置对称方向的填充
           * vertical 对应 bottom 与 top
           * horizontal 对应 right 与 left
           *
           */
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                //左边添加8像素补白
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("Hello world"),
              ),
              Padding(
                //上下各添加8像素补白
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text("I am Jack"),
              ),
              Padding(
                // 分别指定四个方向的补白
                padding: const EdgeInsets.fromLTRB(20.0, .0, 20.0, 20.0),
                child: Text("Your friend"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
