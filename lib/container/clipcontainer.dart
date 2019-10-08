import 'package:flutter/material.dart';

class ClipContainer extends StatelessWidget {
  Widget avatar = Image.asset("images/haha.gif");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("剪裁（Clip）")),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            avatar,
            ClipOval(
              child: avatar,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: avatar,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  widthFactor: .5,
                  child: avatar,
                ),
                Text(
                  "你好世界",
                  style: TextStyle(color: Colors.green),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRect(
                  child: Align(
                    alignment: Alignment.topLeft,
                    widthFactor: .5,
                    child: avatar,
                  ),
                ),
                Text(
                  "你好世界",
                  style: TextStyle(color: Colors.green),
                )
              ],
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.red
              ),
              child: ClipRect(
                clipper: MyClipper(),
                child: avatar,
              ),
            )
          ],
        ),
      ),
    );
  }
}



class MyClipper extends CustomClipper<Rect>{
  @override
  Rect getClip(Size size) => Rect.fromLTWH(10, 15, 40, 30);

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }

}
