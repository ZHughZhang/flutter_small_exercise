import 'package:flutter/material.dart';

class StackLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
            title:Text("层叠布局（stack和绝对定位）")
        ),
        body:Container(
          child: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.expand,//如果没有指定位置 那么将会充满布局 并且遮挡其下方的 控件
              children: <Widget>[

                Positioned(
                    left: 18,
                    child: Text("I am Jack")
                ),
                Container(
                  child: Text("hello World",style: TextStyle(
                      color: Colors.white
                  ),
                  ),
                  color: Colors.red,
                ),
                Positioned(
                    top: 18,
                    child: Text("Your friend"))
              ],
            ),


          ),


        ),
    );
  }
}




