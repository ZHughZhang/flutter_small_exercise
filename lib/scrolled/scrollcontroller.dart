import 'package:flutter/material.dart';

class ScrollControllers extends StatefulWidget {
  @override
  _ScrollControllersState createState() => _ScrollControllersState();
}

class _ScrollControllersState extends State<ScrollControllers> {
  @override
  Widget build(BuildContext context) {
    return ScrollNotificationTestRoute();
  }
}

class ScrollControllersListenre extends StatefulWidget {
  @override
  _ScrollControllersListenreState createState() =>
      _ScrollControllersListenreState();
}

class _ScrollControllersListenreState extends State<ScrollControllersListenre> {
  ScrollController _controller = ScrollController();
  bool showToToBtn = false;

  @override
  void initState() {
    _controller.addListener(() {
      print(_controller.offset); //打印滚动的距离
      if (_controller.offset < 1000 && showToToBtn) {
        setState(() {
          showToToBtn = false;
        });
      } else if (_controller.offset >= 1000 && showToToBtn == false) {
        setState(() {
          showToToBtn = true;
        });
      }
    });

    @override
    void dispose() {
      _controller.dispose();

      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(" ScrollController")),
      floatingActionButton: !showToToBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _controller.animateTo(.0,
                    duration: Duration(milliseconds: 200), curve: Curves.ease);
              },
            ),
      body: Container(
        child: Scrollbar(
          child: ListView.builder(
              itemExtent: 50,
              itemCount: 100,
              controller: _controller,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("$index"),
                );
              }),
        ),
      ),
    );
  }
}

class ScrollNotificationTestRoute extends StatefulWidget {
  @override
  _ScrollNotificationTestRouteState createState() =>
      _ScrollNotificationTestRouteState();
}

class _ScrollNotificationTestRouteState
    extends State<ScrollNotificationTestRoute> {
  String _progress = "0%";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("滑动控制")),
      body: Container(
        child: Scrollbar(
            //监听滚动通知
            child: NotificationListener<ScrollNotification>(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ListView.builder(
                  itemCount: 300,
                  itemExtent: 50,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("$index"),
                    );
                  }),
              CircleAvatar(
                //显示滑动的进度
                radius: 30,
                child: Text(_progress),
                backgroundColor: Colors.black54,
              )
            ],
          ),
          onNotification:
              /**
               *  pixels：当前滚动位置。
               *  maxScrollExtent：最大可滚动长度。
               *  extentBefore：滑出ViewPort顶部的长度；
               *  此示例中相当于顶部滑出屏幕上方的列表长度。
               *  extentInside：ViewPort内部长度；
               *  此示例中屏幕显示的列表部分的长度。
               *  extentAfter：列表中未滑入ViewPort部分的长度；
               *  此示例中列表底部未显示到屏幕范围部分的长度。
               *  atEdge：是否滑到了可滚动组件的边界
               *  （此示例中相当于列表顶或底部）。
               */
              (ScrollNotification notification) {
            double progress = notification.metrics.pixels /
                notification.metrics.maxScrollExtent;
            //更新进度
            setState(() {
              _progress = "${(progress * 100).toInt()}%";
            });
            print("BottomEdge: ${notification.metrics.extentAfter == 0}");
            //return true; //添加这行进度条将会失效
          },
        )),
      ),
    );
  }
}
