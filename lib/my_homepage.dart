import 'package:flutter/material.dart';
import 'package:flutter_small_exercise/alertdialog/alertdialogrouter.dart';
import 'package:flutter_small_exercise/animation/AnimationRouter.dart';
import 'package:flutter_small_exercise/animation/routeranimation.dart';
import 'package:flutter_small_exercise/customwidget/customwidgetrouter.dart';
import 'package:flutter_small_exercise/functional_component/InheritedWidgetTestRoute.dart';
import 'package:flutter_small_exercise/functional_component/cart/Cartpage.dart';
import 'package:flutter_small_exercise/pointer_event/pointer_event.dart' as prefix0;
import 'package:flutter_small_exercise/theme/navbar.dart';
import 'package:flutter_small_exercise/widget_demo/TabBarPageWidget.dart';
import 'package:flutter_small_exercise/widget_introduction/abbout_widget.dart';
import 'package:flutter_small_exercise/widget_introduction/about_provider/ParentWidget.dart';
import 'package:flutter_small_exercise/widget_introduction/about_provider/TapboxA.dart';

import 'asynchronous/futurebuildertestrouter.dart';
import 'functional_component/nav_back_intercept.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();

  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
}

class _MyHomePageState extends State<MyHomePage> {
  int _count = 0;

  void _incrementCounter() {
    setState(() {
      //状态修改并通到调用 的地方
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "You have pushed the button this  many times:" * 1, //重复的次数
                textAlign: TextAlign.left,
                //对齐方式
                maxLines: 1,
                //最大行数
                overflow: TextOverflow.ellipsis,
                //截断方式
                textScaleFactor: 2.0,
                //缩放因子
                style: TextStyle(
                    color: Colors.teal,
                    //字体颜色
                    fontSize: 10.0,
                    //字体大小
                    height: 1,
                    //字体高度
                    fontFamily: "Couriter",
                    //字体样式
                    background: Paint()..color = Colors.deepOrange,
                    //背景色
                    decoration: TextDecoration.lineThrough,
                    //字体装饰线
                    decorationStyle: TextDecorationStyle.dashed //字体装饰线样式
                ),
              ),
              Text(
                '$_count',
                style: Theme.of(context).textTheme.display1,
              ),
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: "富文本:",
                  ),
                  TextSpan(
                    text: "https://www.baidu.com",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                    //recognizer:_点击之后处理
                  )
                ]),
              ),
              FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "new_page");

                    /*//将页面加入stack 中
              Navigator.push(context, MaterialPageRoute(


                */ /**
                                        * @required this.builder,
                                        * widgetbuild 类型的回调函数，
                                        * 作用是构建路由器页面的具体内容，
                                        * 返回值是一个widget ，
                                        * RouteSettings settings,
                                        * 包含路由器的配置信息。
                                        * this.maintainState = true,
                                        * 默认情况下，当入栈一个新路由时，
                                        * 原来的路由仍然会被保存在内存中，
                                        * 如果想在路由没用的时候释放其所占用的所有资源，
                                        * 可以设置maintainState为false。
                                        * bool fullscreenDialog = false,
                                        * 表示新的路由页面是否是一个全屏的模态对话框，
                                        * 在ios中，如果设置为true 新界面将会从屏幕的底部滑入
                                        * 而不是水平方向
                                        * */ /*
                builder: (context){
                  return NewRouter();
                }
              )
              );*/
                    //退出栈
                    //Navigator.pop(context);
                  },
                  child: Text("open newrouter")),
              FlatButton(
                child: Text("About"),
                onPressed: () {
                  _pushBuilder(context,AboutWidge());
                },
              ),
              FlatButton(
                child: Text("TabBarPageWidget"),
                onPressed: () {
                  _pushBuilder(context,TabBarPageWidget());
                },
              ),
              FlatButton(
                  onPressed: () {
                    _pushBuilder(context,FunctionalComponent());
                  },
                  child: Text("FunctionalComponent")),
              FlatButton(
                  onPressed: () {
                    _pushBuilder(context,TabboxA());
                  },
                  child: Text("TapboxA")),
              FlatButton(
                  onPressed: () {
                    _pushBuilder(context,ParentWidget());
                  },
                  child: Text("TapboxB")),
              FlatButton(
                  onPressed: () {
                    _pushBuilder(context,ThemeAndColor());
                  },
                  child: Text("颜色和主题")),
              FlatButton(
                  onPressed: () {
                    _pushBuilder(context,Asynchronous());
                  },
                  child: Text("异步")),
              FlatButton(
                  onPressed: () {
                    _pushBuilder(context,Dialog());
                  },
                  child: Text("提示框")),
              FlatButton(
                  onPressed: () {
                    _pushBuilder(context,prefix0.PointerEvent());
                  },
                  child: Text("事件处理与通知")),
              FlatButton(
                  onPressed: () {
                    _pushBuilder(context,AnimationRouter());
                  },
                  child: Text("动画")),
              FlatButton(
                  onPressed: () {
                    _pushBuilder(context,CustomWidgetRouter());
                  },
                  child: Text("自定义组件")),

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

}

class FunctionalComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("功能型组件")),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              FlatButton(
                  onPressed: () => _pushBuilder(context,NavBackIntercept()),
                  child: Text("导航返回拦截")),
              FlatButton(
                  onPressed: () => _pushBuilder(context,InheritedWidgetTestRoute()),
                  child: Text("数据共享")),
              FlatButton(
                  onPressed: () => _pushBuilder(context,CartPage()),
                  child: Text("跨组件状态共享")),
            ],
          ),
        ),
      ),
    );
  }




}



class ThemeAndColor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("颜色与主题"),
        backgroundColor:Colors.teal,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            FlatButton(onPressed: ()=>_pushBuilder(context,ThemeTestRoute()), child: Text("切换主题")),
            FlatButton(onPressed: ()=>_pushBuilder(context,NavBar(color: Colors.blue,title: "标题",)), child: Text("颜色")),
          ],
        ),
      ),
    );
  }
}

class Asynchronous extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("异步更新UI"),
        backgroundColor:Colors.teal,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            FlatButton(onPressed: ()=>_pushBuilder(context,FutureBuildertTestRouter()), child: Text("FutureBuilder")),
            FlatButton(onPressed: ()=>_pushBuilder(context,StreamBuilderRouter()), child: Text("StreamBuilder")),
          ],
        ),
      ),
    );
  }
}
class Dialog extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text("异步更新UI"),
        backgroundColor:Colors.teal,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            FlatButton(onPressed: ()=>_pushBuilder(context,AlertDialogRouter()), child: Text("弹出框")),
            FlatButton(onPressed: ()=>_pushBuilder(context,StreamBuilderRouter()), child: Text("StreamBuilder")),
          ],
        ),
      ),
    );
  }

}



void _pushBuilder(context,widget){
  Navigator.push(
      context,
      FadeRotute(
          builder: (context) => widget));
}
