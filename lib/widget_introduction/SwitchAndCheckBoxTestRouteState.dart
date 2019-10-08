import 'package:flutter/material.dart';

class SwitchAndCheckBoxTestRouteState extends StatefulWidget {
  @override
  _SwitchAndCheckBoxTestRouteStateState createState() => _SwitchAndCheckBoxTestRouteStateState();
}

class _SwitchAndCheckBoxTestRouteStateState extends State<SwitchAndCheckBoxTestRouteState> {


  bool _switchSelected = true;
  bool _checkboxSelected = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("单选框与复选框"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Switch(value: _switchSelected, onChanged: (value){
              setState(() {
                _switchSelected = value;

              });
            }),
            Checkbox(value: _checkboxSelected, onChanged: (value){
             setState(() {
               _checkboxSelected = value;
             });
            },
            activeColor: Colors.red,
            tristate: true,

            )
          ],
        ),
      ),
    );
  }
}
