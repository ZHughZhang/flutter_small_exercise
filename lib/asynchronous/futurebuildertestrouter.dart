import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_small_exercise/expansiontile.dart';

class FutureBuildertTestRouter extends StatefulWidget {
  @override
  _FutureBuildertTestRouterState createState() => _FutureBuildertTestRouterState();
}

class _FutureBuildertTestRouterState extends State<FutureBuildertTestRouter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
            title:Text("FutureBuilder")
        ),
        body:Container(
          child: FutureBuilder(
            future: mockNetworkData(),
            builder: (context,snapshot){


              /**
               * enum ConnectionState {
                  /// 当前没有异步任务，比如[FutureBuilder]的[future]为null时
                  none,

                  /// 异步任务处于等待状态
                  waiting,

                  /// Stream处于激活状态（流上已经有数据传递了），对于FutureBuilder没有该状态。
                  active,

                  /// 异步任务已经终止.
                  done,
                  }
               */
              if (snapshot.connectionState == ConnectionState.done){
                if (snapshot.hasError) {
                  return Text("Error： ${snapshot.error}");
                }else{
                  return Text("contents： ${snapshot.data}");
                }
              }else{
                return CircularProgressIndicator();
              }

            },
          ),


        ),

    );
  }

  Future<String> mockNetworkData() async{
    return Future.delayed(Duration(seconds: 2),() => "我是从互联网上获得的数据");

  }


}




class StreamBuilderRouter extends StatefulWidget {
  @override
  _StreamBuilderRouterState createState() => _StreamBuilderRouterState();
}


class _StreamBuilderRouterState extends State<StreamBuilderRouter> {
StreamController _controller;

  Stream<int> counter() {
    return Stream.periodic(Duration(seconds: 1),(i){
      if (i>10)
      return i;

    },);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
            title:Text('StreamBuilder')
        ),
        body:Container(
          child: Center(
            child: StreamBuilder<int>(
                stream: counter(),
                builder: (context,snapshot){
              if (snapshot.hasError){
                return Text("Error：${snapshot.error}");
              }
              switch (snapshot.connectionState){
                case ConnectionState.none:
                  return Text("没有Stream");
                case ConnectionState.waiting:
                  return Text("等待数据");
                  break;
                case ConnectionState.active:
                  return Text("active: ${snapshot.data}");
                  break;
                case ConnectionState.done:
                  return Text("Stream已经关闭");
                  break;
              }

            }),
          ),
        ),
    
    );
  }
}
