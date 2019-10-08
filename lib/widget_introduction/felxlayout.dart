import 'package:flutter/material.dart';

class FlexLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("弹性布局")),
      body: Column(
          children: <Widget>[
            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Container(
                      height: 30,
                      color: Colors.deepOrange,
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      height: 30,
                      color: Colors.deepPurple,
                    )),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: SizedBox(
                height: 100.0,

                child:   Flex(
                  direction: Axis.vertical,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 30.0,
                        color: Colors.purple,
                      ),
                      flex: 2,
                    ),
                    Spacer(//占位控件  
                      flex: 1,
                    ),
                    Expanded(
                      child: Container(
                        height: 30.0,
                        color: Colors.yellow,
                      ),
                      flex: 1,
                    )
                  ],
                ),
              )

            )
          ],
        ),
      );
  }
}
