import 'package:flutter/material.dart';
import 'package:flutter_small_exercise/TipRouter.dart';

class NewRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("New Router"),
        ),
        body: Center(
            child: RaisedButton(
          child: Text('打开提示页'),
          onPressed: () async {
            var result = await Navigator.of(context)
                .pushNamed("tiprouter", arguments: "我是提示xxx");
            print("路由返回值：$result");
          },
        )));
  }
}
