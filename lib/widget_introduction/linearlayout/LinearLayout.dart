import 'package:flutter/material.dart';

class Linearlayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("线性布局"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "hello world"
                    ),
                    Text("I am Jack"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "hello world"
                    ),
                    Text("I am Jack"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "hello world"
                    ),
                    Text("I am Jack"),
                  ],
                ),
                Row(
                 verticalDirection: VerticalDirection.down,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "hello world",
                      style: TextStyle(
                        fontSize: 32.0
                      ),
                    ),
                    Text("I am Jack"),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 400,
          ),
        ],
      ),
    );
  }
}
