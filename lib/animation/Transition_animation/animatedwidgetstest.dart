import 'package:flutter/material.dart';
import 'package:flutter_small_exercise/animation/Transition_animation/animateddecoratedbox.dart';

class AnimatedWidgetsTest extends StatefulWidget {
  @override
  _AnimatedWidgetsTestState createState() => _AnimatedWidgetsTestState();
}

class _AnimatedWidgetsTestState extends State<AnimatedWidgetsTest> {
  double _padding = 10;
  var _align = Alignment.topRight;
  double _height = 100;
  double _left = 0;
  Color _color = Colors.red;
  TextStyle _sttyle = TextStyle(color: Colors.black);
  Color _decorationColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    var duration = Duration(seconds: 5);

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              setState(() {
                _padding = 20;
              });
            },
            child: AnimatedPadding(
              padding: EdgeInsets.all(_padding),
              duration: duration,
              child: Text("AnimatedPadding"),
            ),
          ),
          SizedBox(
            height: 50,
            child: Stack(
              children: <Widget>[
                AnimatedPositioned(
                  left: _left,
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        _left = 100;
                      });
                    },
                    child: Text("AnimatedPositioned"),
                  ),
                  duration: duration,
                )
              ],
            ),
          ),
          Container(
            height: 100,
            color: Colors.grey,
            child: AnimatedAlign(
              alignment: _align,
              duration: duration,
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    _align = Alignment.center;
                  });
                },
                child: Text("AnimatedAlign"),
              ),
            ),
          ),
          AnimatedContainer(
            duration: duration,
            height: _height,
            color: _color,
            child: FlatButton(
                onPressed: () {
                  setState(() {
                    _height = 150;
                    _color = Colors.blue;
                  });
                },
                child: Text(
                  "AnimatedContainer",
                  style: TextStyle(color: Colors.white),
                )),
          ),
          AnimatedDefaultTextStyle(
            child: GestureDetector(
              child: Text("hello world"),
              onTap: () {
                setState(
                  () {
                    _sttyle = TextStyle(
                        color: Colors.blue,
                        decorationStyle: TextDecorationStyle.solid,
                        decorationColor: Colors.blue);
                  },
                );
              },
            ),
            style: _sttyle,
            duration: duration,
          ),
          AnimatedDecoratedBox(decoration: BoxDecoration(color: _decorationColor), duration: duration,
            child: FlatButton(
              onPressed: (){
                setState(() {
                  _decorationColor = Colors.red;
                });
              },
              child: Text("AnimatedDecoratedBox",style: TextStyle(color: Colors.white),),
            ),
          )
        ].map((e){
          return Padding(padding: EdgeInsets.symmetric(vertical: 16),
          child: e,
          );
        }).toList(),
      ),
    );
  }
}
