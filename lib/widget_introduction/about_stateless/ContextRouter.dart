import 'package:flutter/material.dart';

/**
 * 子树获取父级widget的实例
 */
class ContextRouter extends StatelessWidget {

  static GlobalKey<ScaffoldState> _globalkey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('子树获取State对象'),
      ),
      body: Container(
        child: Builder(builder: (context){
          //context 是BuildContext 类的一个实例，表示当前widget在widget树中的上下文
          //每个我IDget都会对应一个context对象
//          Scaffold scaffold = context.ancestorWidgetOfExactType(Scaffold);
//          return (scaffold.appBar as AppBar).title;
          return RaisedButton(onPressed: (){
            /**
             * 查找父级最近的Scaffold对应ScaffoldStated对象
             *
             */

            ScaffoldState _state = context.ancestorStateOfType(TypeMatcher<ScaffoldState>());
            /**
             * 调用Scaffold State的showSnackbar来弹出Snackbar
             */
            _state.showSnackBar(SnackBar(content: Text("我是Snackbar")));

          },
          child: Text("显示Snackbar"),
          );

        },),
      )
    );
  }

}


