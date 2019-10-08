import 'package:flutter/material.dart';

class StateLeifCycle extends StatefulWidget {
  @override
  _StateLeifCycleState createState() => _StateLeifCycleState();
}

class _StateLeifCycleState extends State<StateLeifCycle> {
  int _count;

  /**
   * 将界面展示出来，每次界面被重置之后都会被调用
   *
   * initState()
   * didUpdateWidget()
   * setState()
   * didchangeDependencies()
   * 之后都会被调用
   *
   *
   */
  @override
  Widget build(BuildContext context) {
    print("build:>>>>>>>>>>>>>>>>>>>");
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              FlatButton(
                child: Text('$_count'),
                onPressed: () => setState(() => ++_count),
              ),
            ],
          )
        ),
      ),
    );
  }


  /**
   * 初始化数据的操作，第一次进入是被调用
   */
  @override
  void initState() {
    super.initState();

    _count = 0;

    print("initState:>>>>>>>>>>>>>>>>>>>");
  }

  /**
   * 当state对象的依赖发生变化时被调用
   */
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies:>>>>>>>>>>>>>>>>>>");
  }

  /**
   * 在widget重新构建时，Flutter framework会调用
   */
  @override
  void didUpdateWidget(StateLeifCycle oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget:>>>>>>>>>>>>>>>>>>");
  }

  /**
   * 被永久移除事被调用 比如按下返回键
   */
  @override
  void dispose() {
    super.dispose();
    print("dispose:>>>>>>>>>>>>>>>>>>");
  }

  /**
   * 当State对象从树中被移除时，会调用此回调,按下返回键时会被先调用，然后调用dispose
   */
  @override
  void deactivate() {
    super.deactivate();
    print("deactivate:>>>>>>>>>>>>>>>>>>");
  }

  /**
   * 热重载是被调用 提供给开发者使用
   */
  @override
  void reassemble() {
    super.reassemble();
    print("reassemble:>>>>>>>>>>>>>>>>>>");
  }
}
