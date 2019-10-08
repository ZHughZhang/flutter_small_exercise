import 'package:flutter/material.dart';

class TipRouter extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(args),
              RaisedButton(onPressed: (){
                Navigator.pop(context,"我是返回值");

                },
              child: Text("BACK"),)
        ],
      ),
    ),)
    ,
    );
  }

  TipRouter({Key key, @required this.title}) :super(key: key);
  final String title;
}
