

import 'package:flutter/material.dart';

class Default_TextStyle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("设置默认样式"),
      ),
      body: Container(
        child: DefaultTextStyle(
            style: TextStyle(
              color: Colors.red,
              fontSize: 20.0
            ),
            textAlign: TextAlign.left,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Hello Wold"),
                Text("What is Fuck"),
                Text(
                  "I Want FreeDown",
                style: TextStyle(
                  inherit: false,//不继承默认样式
                  color: Colors.greenAccent
                ),
                )
              ],
        ))
      ),
    );
  }
}
