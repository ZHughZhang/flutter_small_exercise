import 'package:flutter/material.dart';
import 'package:flutter_small_exercise/pointer_event/ListenerRouter.dart';
import 'package:flutter_small_exercise/pointer_event/gesturedetectortestroute.dart';

import 'notification.dart';

class PointerEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("事件处理与通知")),
      body: Container(
        child: Column(
          children: <Widget>[
            FlatButton(
                onPressed: () => _pushBuilder(context, ListenerRouter()),
                child: Text("原始指针事件处理")),
            FlatButton(
                onPressed: () => _pushBuilder(context, GestureDetectorRouter()),
                child: Text("手势识别")),
            FlatButton(
                onPressed: () => _pushBuilder(context, Drag()),
                child: Text("手势识别之滑动.拖动")),
            FlatButton(
                onPressed: () => _pushBuilder(context, Zoom()),
                child: Text("手势识别之缩放")),
            FlatButton(
                onPressed: () => _pushBuilder(context, GestureRecognizerTestRoute()),
                child: Text("手势识别之GestureRecognizer")),
            FlatButton(
                onPressed: () => _pushBuilder(context, BothDirectionTestRoute()),
                child: Text("手势识别之竞争与冲突")),
            FlatButton(
                onPressed: () => _pushBuilder(context, NotificationRouter()),
                child: Text("通知")),
            FlatButton(
                onPressed: () => _pushBuilder(context, NotificationRoute2()),
                child: Text("自定义通知")),
          ],
        ),
      ),
    );
  }

  void _pushBuilder(context, widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }
}
