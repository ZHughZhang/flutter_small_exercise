import 'dart:math';

import 'package:flutter/material.dart';

class ListenerRouter extends StatefulWidget {
  @override
  _ListenerRouterState createState() => _ListenerRouterState();
}

class _ListenerRouterState extends State<ListenerRouter> {
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("原始指针事件处理")),
      body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Listener(
                onPointerDown: (event) => setState(() => _event = event),
                onPointerMove: (ev) => setState(() => _event = ev),
                onPointerUp: (ev) => setState(() => _event = ev),
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.blue,
                  width: 300,
                  height: 150,
                  child: Text(_event?.toString() ?? "",
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              _downA(),
              _behavior(),
              _absorbpointer(),
            ],
          )),
    );
  }

  Widget _downA() {
    return Listener(
      child: ConstrainedBox(
        constraints: BoxConstraints.tight(Size(300, 150)),
        child: Center(
          child: Text("Box A"),
        ),
      ),
      onPointerDown: (e) {
        print("Down A");
      },
    );
  }

  Widget _behavior() {
    return Stack(
      children: <Widget>[
        Listener(
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(Size(300, 200),),
            child: DecoratedBox(decoration: BoxDecoration(
              color: Colors.blue
            )),
          ),
          onPointerDown: (e)=>print("down0"),
        ),
        Listener(
          child: ConstrainedBox(constraints: BoxConstraints.tight(Size(200, 100)),
          child: Center(
            child: Text("左上角200*100范围非文本区域点击"),
          ),
          ),
          onPointerDown: (ev)=>print("down1"),
          behavior: HitTestBehavior.opaque,
        )
      ],
    );
  }
  //忽略PointerEvent
  /**
   * 点击Container时，由于它在AbsorbPointer的子树上，
   * 所以不会响应指针事件，所以日志不会输出"in"，
   * 但AbsorbPointer本身是可以接收指针事件的，
   * 所以会输出"up"。
   * 如果将AbsorbPointer换成IgnorePointer，
   * 那么两个都不会输出。
   */

  Widget _absorbpointer(){
      return Listener(
        child: IgnorePointer(
          child: Listener(
            child: Container(
              color: Colors.red,
              width: 200,
              height: 100,
            ),
            onPointerDown: (ev)=>print("int"),
          ),
        ),
        onPointerDown: (ev) => print("up"),
      );
  }
}
