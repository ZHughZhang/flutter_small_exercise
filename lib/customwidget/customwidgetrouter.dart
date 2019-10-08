import 'package:flutter/material.dart';
import 'package:flutter_small_exercise/customwidget/custombutton.dart';

class CustomWidgetRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
            title:Text("自定义组件")
        ),
        body:Container(

          child: Column(
            children: <Widget>[
              FlatButton(onPressed: (){
                _pushBuilder(context,CustomButton());
              }, child: Text('自定义按钮')),
            ],
          ),
        ),
    );
  }
}

void _pushBuilder(context,widget){
  Navigator.push(
      context,
      PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 500),//动画时间为500毫秒
          pageBuilder: (context,animation,secondrayAnimation){
            return FadeTransition(
              //使用渐隐入过渡
              opacity: animation,
              child: widget,
            );
          }
      )
  );
}




