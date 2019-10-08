import 'package:flutter/material.dart';

//一个通用的InheritedWidget，保存任需要跨组件共享的状态
class InheriredProvider<T> extends InheritedWidget {

  //以泛型的状态共享（保证数据的多样性，方便不同类型的数据传入）
  final T data;
  InheriredProvider({@required this.data, Widget child}) :super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    ///在此简单返回true，则每次更新都会调用依赖其的子孙节点的`didChangeDependencies`。
    return true;
  }




}


// 该方法用于在Dart中获取模板类型
Type _typeOf<T>() => T;


class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  final T data;

  final Widget child;


  ChangeNotifierProvider({Key key, this.data, this.child});


  static T of<T>(BuildContext context,{bool listen = true}) {
    final type = _typeOf<InheriredProvider<T>>();
    final provide =  listen ?context.inheritFromWidgetOfExactType(
        type) as InheriredProvider<T> : context.ancestorInheritedElementForWidgetOfExactType(type)?.widget as InheriredProvider<T>;
    return provide.data;
  }

  @override
  _ChangeNotifierProviderState<T> createState() =>
      _ChangeNotifierProviderState<T>();

}


class _ChangeNotifierProviderState<T extends ChangeNotifier> extends State<ChangeNotifierProvider<T>> {


  void update(){
    //如果数据发生变化时（model 类调用 notifyListener）
    // ，重新构建InheritedProvider
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return InheriredProvider<T>(
      data: widget.data,
      child: widget.child,
    );
  }

  @override
  void didUpdateWidget(ChangeNotifierProvider<T> oldWidget) {

    //当provider 更新时，如果新旧数据不一致,则解绑旧数据监听，同时添加新数据监听
    if(widget.data != oldWidget.data){
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);

    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    widget.data.removeListener(update);
    super.dispose();
  }

}