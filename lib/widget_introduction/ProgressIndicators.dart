import 'package:flutter/material.dart';


class ProgressIndicators extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text("进度指示器"),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              LinearProgressIndicator(
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation(
                    Colors.orange), //设置进度条的颜色为一种颜色
              ),
              LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.orange),
                value: 0.5,
              ),
              CircularProgressIndicator(
                backgroundColor: Colors.red,
                valueColor: AlwaysStoppedAnimation(Colors.greenAccent),

              ),
              CircularProgressIndicator(
                backgroundColor: Colors.red,
                valueColor: AlwaysStoppedAnimation(Colors.greenAccent),
                value: .5,

              ),
              SizedBox(
                height: 3,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.teal[90],
                  valueColor: AlwaysStoppedAnimation(Colors.green),
                  value: .5,
                ),
              ),
              SizedBox(
                height: 100,
                width: 100,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.deepPurple,
                  valueColor: AlwaysStoppedAnimation(Colors.yellow),
                  value: .7,
                ),
              ),
              ProgressRoute(),
            ],
          ),
        ),
      );
  }
}


//进度色动画

class ProgressRoute extends StatefulWidget {
  @override
  _ProgressRouteState createState() => _ProgressRouteState();
}

class _ProgressRouteState extends State<ProgressRoute>
    with SingleTickerProviderStateMixin {

  AnimationController _animationController;

  @override
  void initState() {

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    _animationController.forward();
    _animationController.addListener(() => setState(() => {}));
    super.initState();
  }

  @override
  void dispose() {
  _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(16),
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: ColorTween(begin: Colors.deepPurple,end: Colors.deepOrange).animate(_animationController),
              value: _animationController.value,

            ),

          )
        ],
      ),
    );
  }
}


