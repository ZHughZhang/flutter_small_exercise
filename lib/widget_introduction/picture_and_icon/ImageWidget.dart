import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final List<BoxFit> list = List();
  final String imageUrl =
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568627247524&di=5318578d03ce8980f00b6656f75488a3&imgtype=0&src=http%3A%2F%2Fimg.99danji.com%2Fuploadfile%2F2018%2F0514%2F20180514053300374.jpg";

  void _BotxFitMode() {
    list
      ..add(BoxFit.none)
      ..add(BoxFit.fill)
      ..add(BoxFit.contain)
      ..add(BoxFit.fitWidth)
      ..add(BoxFit.fitWidth)
      ..add(BoxFit.scaleDown);
  }

  @override
  Widget build(BuildContext context) {
    _BotxFitMode();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "图片",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image(
                  image: AssetImage("images/haha.gif"),
                  width: 100.0,
                ),
                Image(
                  image: AssetImage("images/haha.gif"),
                  width: 100.0,
                  color: Colors.blue,
                  colorBlendMode: BlendMode.difference,
                ),
                Image(
                  image: AssetImage("images/haha.gif"),
                  width: 100.0,
                  height: 400.0,
                  repeat: ImageRepeat.repeat,
                ),
                Image.asset(
                  "images/haha.gif",
                  width: 100,
                ),
                Image(
                  image: NetworkImage(
                      "https://ss1.baidu.com/-4o3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=a9e671b9a551f3dedcb2bf64a4eff0ec/4610b912c8fcc3cef70d70409845d688d53f20f7.jpg"),
                  width: 100.0,
                  height: 100.0,
                ),
                Image.network(
                  "https://ss1.baidu.com/-4o3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=a9e671b9a551f3dedcb2bf64a4eff0ec/4610b912c8fcc3cef70d70409845d688d53f20f7.jpg",
                  width: 100.0,
                  height: 100.0,
                ),
                Row(
                  children: <Widget>[
                    Image.network(imageUrl,width:300,fit: BoxFit.none,),
                    Text("BoxFit:none")
                  ],
                ),
                Row(
                  children: <Widget>[
                    Image.network(imageUrl,width: 300,fit: BoxFit.fill,),
                    Text("BoxFit:fill")
                  ],
                ),
                Row(
                  children: <Widget>[
                    Image.network(imageUrl,width: 300,fit: BoxFit.contain,),
                    Text("BoxFit:contain")
                  ],
                ),
                Row(
                  children: <Widget>[
                    Image.network(imageUrl,width: 300,fit: BoxFit.fitWidth,),
                    Text("BoxFit:fitWidth")
                  ],
                ),
                Row(
                  children: <Widget>[
                    Image.network(imageUrl,width: 300,fit: BoxFit.fitHeight,),
                    Text("BoxFit:fitHeight")
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      Image.network(imageUrl,width: 300,fit: BoxFit.scaleDown,),
                      Text("BoxFit:scaleDown")
                    ],
                  ),
                )

              ],
            ),
          )),
    );
  }
}
