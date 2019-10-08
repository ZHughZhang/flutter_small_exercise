import 'package:flutter/material.dart';

class HeroAnimationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
            title:Text("Hero动画")
        ),
        body:Container(
          alignment: Alignment.topCenter,
          child: InkWell(
            child: Hero(tag: "avatar", child: ClipOval(
              child: Image.asset('images/01.jpg',
                width: 50,),
            ),),
            onTap: (){
                Navigator.push(context, PageRouteBuilder(pageBuilder: (context,animation,secondaryAnimation){
                  return FadeTransition(
                    opacity: animation,
                    child: Scaffold(
                      body: HoroAnimationRouteB(),
                      appBar: AppBar(title: Text("原图"),
                  ),),);
                }));
        },
          ),
        ),
    );
  }
}

class HoroAnimationRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
          tag: "avatar", //标记与上一个跳过来的tag 一致
          child: Image.asset('images/01.jpg')),
    );
  }
}







