import 'package:flutter/material.dart';

class NotificationRouter extends StatefulWidget {
  @override
  _NotificationRouterState createState() => _NotificationRouterState();
}

class _NotificationRouterState extends State<NotificationRouter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
            title:Text("通知")
        ),
        body:Container(
          child: NotificationListener(
            onNotification: (notification){
              switch(notification.runtimeType){
                case ScrollNotification:print("正在滚动");break;
                case ScrollUpdateNotification:print("正在滚动");break;
                case ScrollEndNotification:print("滚动停止");break;
                case OverscrollNotification:print("滚动到边界");break;
              }
            },
              child: ListView.builder(
                itemCount: 20,
              itemBuilder: (cx,index){
                return ListTile(title: Text("$index"));
          },
          )),
        ),

    );
  }
}



//自定义通知

class NotificationRoute2 extends StatefulWidget {
  @override
  _NotificationRoute2State createState() => _NotificationRoute2State();
}

class _NotificationRoute2State extends State<NotificationRoute2> {
  String _msg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
            title:Text("自定义通知")
        ),
        body:Container(
          child: NotificationListener<MyNotification>(

              onNotification: (notification){
                setState(() {
                  _msg += notification.msg+" ";
                });

                //NotificationListener 嵌套 NotificationListener 可以阻止冒泡通知
                //return false;
              },
              child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Builder(builder: (cx){
                  return RaisedButton(onPressed: (){
                    MyNotification("hi").dispatch(cx);
                  },
                  child: Text("Send Notification"),
                  );
                }),
                Text(_msg)
              ],
            ),
          )),
        ),

    );
  }
}


class MyNotification extends Notification{
  final String msg;

  MyNotification(this.msg);
}