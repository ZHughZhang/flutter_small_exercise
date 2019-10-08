import 'package:flutter/material.dart';

class InheritedWidgetTestRoute extends StatefulWidget {
  @override
  _InheritedWidgetTestRouteState createState() => _InheritedWidgetTestRouteState();
}

class _InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute> {


  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("数据共享"),
      ),
      body:  Center (
        child: ShareDataWidget(
          data: count,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: _TestWidget(),//子widget中依赖ShareDataWidget
              ),
              RaisedButton(onPressed: (){
                setState(() {
                  ++count;
                });
              },
                child: Text("Increment"),)
            ],
          ),
        ),
      ),
    );
  }
}

class ShareDataWidget extends InheritedWidget{




  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    return oldWidget.data !=data;
  }

  ShareDataWidget({@required this.data,Widget child}):super(child:child);
  final int data;

  //定义一个便捷的方法，方便子树中的widget获取共享数据
  static ShareDataWidget of(BuildContext context) {
     // return context.inheritFromWidgetOfExactType(ShareDataWidget);
    return context.ancestorInheritedElementForWidgetOfExactType(ShareDataWidget).widget;

  }


}


class _TestWidget extends StatefulWidget {
  @override
  __TestWidgetState createState() => __TestWidgetState();
}

class __TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
          child: Text(ShareDataWidget.of(context).data.toString()),
        );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("Dependencies change");
  }
}




