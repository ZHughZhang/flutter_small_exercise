import 'package:flutter/material.dart';

class UnconstrainedBoxContainer extends StatelessWidget {

  Widget rebox = DecoratedBox(decoration: BoxDecoration(color: Colors.red));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("尺寸限制类容器（UnConstrainedBox）")
      ),
      body: Container(
          child: ConstrainedBox(constraints: BoxConstraints(
              minWidth: 60,
              minHeight: 100
          ),
              child: UnconstrainedBox(//去掉父级的限制 完全使用子元素的自己的设置 但是不会去掉 父级原本就存在的宽高
              child: ConstrainedBox(constraints: BoxConstraints(
              minHeight: 20,
              minWidth: 90,
          ),
                child: rebox,
              ),
    ),)
    ,
    )
    ,
    );
  }
}




