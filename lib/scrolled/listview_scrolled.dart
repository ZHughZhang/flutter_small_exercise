import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class ListViewScrolled extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListView")),
      body: Container(

          /**
         * /可滚动widget公共参数
         *   Axis scrollDirection = Axis.vertical,
         *  bool reverse = false,
         *  ScrollController controller,
         *   bool primary,
         *  ScrollPhysics physics,
         *  EdgeInsetsGeometry padding,
         *
         *  //ListView各个构造函数的共同参数
         *  该参数如果不为null，则会强制children的“长度”为itemExtent的值；
         *  这里的“长度”是指滚动方向上子组件的长度，
         *  也就是说如果滚动方向是垂直方向，
         *  则itemExtent代表子组件的高度；
         *  如果滚动方向为水平方向，
         *  则itemExtent就代表子组件的宽度。
         *  在ListView中，指定itemExtent比让子组件自己决定自身长度会更高效，
         *  这是因为指定itemExtent后，滚动系统可以提前知道列表的长度，
         *  而无需每次构建子组件时都去再计算一下，尤其是在滚动位置频繁变化时
         *  （滚动系统需要频繁去计算列表高度）。
         *  double itemExtent,
         *  该属性表示是否根据子组件的总长度来设置ListView的长度，
         *  默认值为false 。默认情况下，
         *  ListView的会在滚动方向尽可能多的占用空间。
         *  当ListView在一个无边界(滚动方向上)的容器中时，
         *  shrinkWrap必须为true。
         *  bool shrinkWrap = false,
         *  该属性表示是否将列表项（子组件）包裹在AutomaticKeepAlive 组件中；
         *  典型地，在一个懒加载列表中，
         *  如果将列表项包裹在AutomaticKeepAlive中，
         *  在该列表项滑出视口时它也不会被GC（垃圾回收），
         *  它会使用KeepAliveNotification来保存其状态。
         *  如果列表项自己维护其KeepAlive状态，那么此参数必须置为false。
         *  bool addAutomaticKeepAlives = true,
         *  该属性表示是否将列表项（子组件）包裹在RepaintBoundary组件中。
         *  当可滚动组件滚动时，将列表项包裹在RepaintBoundary中可以避免列表项重绘，
         *  但是当列表项重绘的开销非常小（如一个颜色块，或者一个较短的文本）时，
         *  不添加RepaintBoundary反而会更高效。和addAutomaticKeepAlive一样，
         *  如果列表项自己维护其KeepAlive状态，那么此参数必须置为false。
         *  bool addRepaintBoundaries = true,
         *  double cacheExtent,
         *
         *
         *  ListView.Builder
         *
         * 它是列表项的构建器，类型为IndexedWidgetBuilder，
         * 返回值为一个widget。当列表滚动到具体的index位置时，
         * 会调用该构建器构建列表项。
         *  itemBuilder
         *  itemCount：列表项的数量，如果为null，则为无限列表。
         *  itenCount
         *
         *  //子widget列表
         *  List<Widget> children = const <Widget>[],
         *
         */
          child:
              /*ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20),
            children: <Widget>[
              const Text('I\'m dedicating every day to you'),
              const Text('Domestic life was never quite my style'),
              const Text('When you smile, you knock me out, I fall apart'),
              const Text('And I thought I was so smart'),
            ],*/

              //动态创建
              /* ListView.builder(

              itemCount: 50,
              itemExtent: 50,
              itemBuilder: (context,index){

                return ListTile(title: Text('$index'),);
          }
          ),*/
          //动态创建 添加 下滑线
            /*  ListView.separated(
                  itemBuilder: (context, index) => ListTile(
                        title: Text('$index'),
                      ),
                  separatorBuilder: (context, index) => Divider(
                        color: Colors.red,
                      ),
                  itemCount: 50)*/

          InfiniteListView(),

      ),
    );
  }
}


class InfiniteListView extends StatefulWidget {
  @override
  _InfiniteListViewState createState() => _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = '##loading##';
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    //模拟网络添加数据
    _retriveData();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(itemBuilder: (context,index){
        if(_words[index] == loadingTag){
          if (_words.length -1 <100) {
            _retriveData();
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2,),
              ),
            );
          }else{
            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16),
              child: Text("没有更多了",style: TextStyle(color: Colors.grey),),
            );
          }
        }
        return ListTile(title: Text(_words[index]),);

      }, separatorBuilder: (context,index) => Divider(color: Colors.purple,), itemCount: _words.length),
    );
  }


  void _retriveData(){
    Future.delayed(Duration(seconds: 2)).then((e){
      _words.insertAll(_words.length-1,generateWordPairs().take(20).map((f)=>f.asPascalCase).toList());

    });

    setState(() {
        
    });

  }
}

