import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBackIntercept extends StatefulWidget {
  @override
  _NavBackInterceptState createState() => _NavBackInterceptState();
}

class _NavBackInterceptState extends State<NavBackIntercept> {
  DateTime _lastPressedAt; //上一次点击时间

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("导航返回拦截")),
      body: Container(
        child: WillPopScope(
            child: Container(
              alignment: Alignment.center,
              child: Text("2秒内连续按两次返回键退出"),
            ),
            onWillPop: () async {
              if (_lastPressedAt == null ||
                  DateTime.now().difference(_lastPressedAt) >
                      Duration(seconds: 2)) {
                //点击两次的时间超过两秒则重新开计时
                _lastPressedAt = DateTime.now();
                return false;
              }
              return true;
            }),
      ),
    );
  }
}
