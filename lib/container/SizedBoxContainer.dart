import 'package:flutter/material.dart';

class SizeBoxContainer extends StatelessWidget {
  Widget rebox = DecoratedBox(decoration: BoxDecoration(color: Colors.red));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("限制类容器（SizeBox）")),
      body: Container(
        child: SizedBox(
          width: 80,
          height: 80,
          child: rebox,
        ),
        /**
         * 等价于
         * ConstrainedBox(
         * constraints:BoxConstraints.tightFor(width:80,height:80)
         * child:redbox
         * )
         *
         */
      ),
    );
  }
}
