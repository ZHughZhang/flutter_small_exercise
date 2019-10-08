import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GestureDetectorRouter extends StatefulWidget {
  @override
  _GestureDetectorRouterState createState() => _GestureDetectorRouterState();
}

class _GestureDetectorRouterState extends State<GestureDetectorRouter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GestureDetector")),
      body: Container(
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                   Text("点击、双击、长按"),
                   TapEvent(),
              ],
            ),
                Column(
                  children: <Widget>[
                   Text("拖动.滑动"),
              ],
            ),
          ],
        ),
      )),
    );
  }
}

//点击、双击、长按
class TapEvent extends StatefulWidget {
  @override
  _TapEventState createState() => _TapEventState();
}

class _TapEventState extends State<TapEvent> {
  String _operation = "No Gesture detected"; //保存事件名
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        color: Colors.blue,
        width: 200,
        height: 100,
        child: Text(_operation),
      ),
      onTap: () => updateText("tap"),
      onDoubleTap: () => updateText("double tap"),
      onLongPress: () => updateText("long tap"),
    );
  }

  updateText(String text) {
    setState(() {
      _operation = text;
    });
  }
}


//拖动、滑动

class Drag extends StatefulWidget {
  @override
  _DragState createState() => _DragState();
}

class _DragState extends State<Drag> {
  double _top = 0.0;
  double _left = 0.0;

  /**
   * DragDownDetails.globalPosition：当用户按下时，此属性为用户按
   * 下的位置相对于屏幕（而非父组件）原点(左上角)的偏移。
      DragUpdateDetails.delta：当用户在屏幕上滑动时，
      会触发多次Update事件，delta指一次Update事件的滑动的偏移量。
      DragEndDetails.velocity：该属性代表用户抬起手指时的滑动速度(包含x、y两个轴的），
      示例中并没有处理手指抬起时的速度，常见的效果是根据用户抬起手指时的速度做一个减速动画。
   *
   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("滑动。拖动")),
        body: Container(
        child:
        Stack(
      children: <Widget>[
        Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(
                child: Text("A"),
              ),
              onPanDown: (DragDownDetails e){
                print("用户手指按下：${e.globalPosition}");
              },
              onPanUpdate: (e){
                setState(() {
                  _left +=e.delta.dx;
                  _top +=e.delta.dy;

                });
              },
              onPanEnd: (e){
                print(e.velocity);

              },
            ))
      ],
    )));
  }
}


//缩放
class Zoom extends StatefulWidget {
  @override
  _ZoomState createState() => _ZoomState();
}

class _ZoomState extends State<Zoom> {

  double _width = 200;//通过修改图片宽度来达到缩放效果

  @override
  Widget build(BuildContext context) {



    return Scaffold(
        appBar:AppBar(
            title:Text("缩放")
        ),
        body:Container(
          child: Center(
            child: GestureDetector(
              child: Image.asset('./images/01.jpg',width: _width,),
              onScaleUpdate: (ScaleUpdateDetails details){
                setState(() {
                  //缩放倍数在0.8~10之间
                  _width = 200*details.scale.clamp(.8, 10);

                });
              },
            ),
          ),
        ),

    );
  }
}

//GestureRecognizer

class GestureRecognizerTestRoute extends StatefulWidget {
  @override
  _GestureRecognizerTestRouteState createState() => _GestureRecognizerTestRouteState();
}

class _GestureRecognizerTestRouteState extends State<GestureRecognizerTestRoute> {


  TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  bool  _toogle = false;

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {



    return Scaffold(
        appBar:AppBar(
            title:Text("GestureRecognizer")
        ),
        body:Container(
          child: Center(
            child: Text.rich(TextSpan(
              children: [
                TextSpan(
                  text:"你好世界",
                ),
                TextSpan(
                  text: "点击变色",
                  style: TextStyle(
                    fontSize: 30,
                    color: _toogle? Colors.blue:Colors.red
                  ),
                  recognizer: _tapGestureRecognizer..onTap = (){
                    setState(() {
                      _toogle = !_toogle;
                    });
                  }
                ),
                TextSpan(
                  text:"你好世界",
                ),
              ]
            )),
          ),
        ),

    );
  }
}
//手势竞争与冲突
/**
 * 如果遇到手势冲突可以直接通过Listener直接识别原始指针来解决冲突
 */
class BothDirectionTestRoute extends StatefulWidget {
  @override
  _BothDirectionTestRouteState createState() => _BothDirectionTestRouteState();
}

class _BothDirectionTestRouteState extends State<BothDirectionTestRoute> {


 double _top = 0;
 double _left = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
            title:Text("手势竞争与冲突")
        ),
        body:Container(
          child: Stack(
            children:<Widget>[
              Positioned(
                  top:_top,
                  left: _left,
                  child: Listener(
                    onPointerDown: (details){
                      print("down");
                    },
                    onPointerUp: (details){
                      print("up");

                    },
                    child: GestureDetector(
                      child: CircleAvatar(
                        child: Text("A"),
                      ),
//                      onVerticalDragUpdate: (details){
//                        setState(() {
//                          _top += details.delta.dy;
//
//                        });
//                      },
                      onHorizontalDragUpdate: (details){
                        _left += details.delta.dx;
                      },

                      onHorizontalDragEnd: (details){
                        print("onHorizontalDragEnd");

                      },
                    ),
                  )

              )
            ]
          ),
        ),
    );
  }
}





