import 'package:flutter/material.dart';

class WrapLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
            title:Text("流式布局（wrap）")
        ),
        body:Container(
          child: Wrap(
            spacing: 8.0,//主轴方向间距
            runSpacing: 4.0,//纵轴方向的间距
            alignment:
            WrapAlignment.center,//沿主轴方向居中对齐
            children: <Widget>[
              Chip(
                label: Text("Hamilton"),
                avatar: CircleAvatar(
                  backgroundColor: Colors.purple,
                  child: Text("A"),
                ),
              ),
              Chip(
                label: Text("Lafayette"),
                avatar: CircleAvatar(
                  backgroundColor: Colors.purple,
                  child: Text("M"),
                ),
              ),
              Chip(
                label: Text("Mulligan"),
                avatar: CircleAvatar(
                  backgroundColor: Colors.purple,
                  child: Text("H"),
                ),
              ),
              Chip(
                label: Text("Zhang"),
                avatar: CircleAvatar(
                  backgroundColor: Colors.purple,
                  child: Text("Z"),
                ),
              ),
              Chip(
                label: Text("Guo"),
                avatar: CircleAvatar(
                  backgroundColor: Colors.purple,
                  child: Text("G"),
                ),
              ),

            ],
          ),
        ),
    );
  }
}




