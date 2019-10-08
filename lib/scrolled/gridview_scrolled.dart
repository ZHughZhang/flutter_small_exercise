import 'package:flutter/material.dart';

class GridviewScrolled extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GrideView")),
      body: Container(

          /**
         * SliverGridDelegateWithFixedCrossAxisCount
         * crossAxisCount：横轴子元素的数量。
         * 此属性值确定后子元素在横轴的长度就确定了，
         * 即ViewPort横轴长度除以crossAxisCount的商。
         *  mainAxisSpacing：主轴方向的间距。
         *  crossAxisSpacing：横轴方向子元素的间距。
         *  childAspectRatio：子元素在横轴长度和主轴长度的比例。
         *  由于crossAxisCount指定后，子元素横轴长度就确定了，
         *  然后通过此参数值就可以确定子元素在主轴的长度
         */

          child:
              /*GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,//横轴三个子widget
            childAspectRatio: 1,//宽高比为1
          ),
            children: <Widget>[
              Icon(Icons.ac_unit),
              Icon(Icons.airport_shuttle),
              Icon(Icons.all_inclusive),
              Icon(Icons.beach_access),
              Icon(Icons.cake),
              Icon(Icons.free_breakfast)
            ],


          ),*/

              //内置SliverGridDelegateWithFixedCrossAxisCount
              //纵轴固定数量
              /* GridView.count(
            crossAxisCount: 3,
            childAspectRatio: 3,
            children: <Widget>[
              Icon(Icons.ac_unit),
              Icon(Icons.airport_shuttle),
              Icon(Icons.all_inclusive),
              Icon(Icons.beach_access),
              Icon(Icons.cake),
              Icon(Icons.free_breakfast)
            ],

          )*/

              /**
           * SliverGridDelegateWithMaxCrossAxisExtent
           *maxCrossAxisExtent:为子元素在横轴上的最大长度，
           * 之所以是“最大”长度，是因为横轴方向每个子元素的长度仍然是等分的，
           * 举个例子，如果ViewPort的横轴长度是450，
           * 那么当maxCrossAxisExtent的值在区间[450/4，450/3)内的话，
           * 子元素最终实际长度都为112.5，
           * 而childAspectRatio所指的子元素横轴和主轴的长度比为最终的长度比。
           */
          //纵轴固定长度，子元素 被平均分配，在一行放不下的情况下 进行换行
             /* GridView(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 50,
                      childAspectRatio: 2),
                children: <Widget>[
                  Icon(Icons.ac_unit),
                  Icon(Icons.airport_shuttle),
                  Icon(Icons.all_inclusive),
                  Icon(Icons.beach_access),
                  Icon(Icons.cake),
                  Icon(Icons.free_breakfast)
                ],
              )),*/

    InfiniteGridView())

    );
  }
}


class InfiniteGridView extends StatefulWidget {
  @override
  _InfiniteGridViewState createState() => _InfiniteGridViewState();
}

class _InfiniteGridViewState extends State<InfiniteGridView> {
  
  List<IconData> _icons = [];
  
  @override
  void initState() {
    super.initState();
    _retrieveIcons();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
      ),
        itemCount: _icons.length,
        itemBuilder: (context,index){
          if (index == _icons.length-1 && _icons.length <200) {
            _retrieveIcons();
            
          }
          return Icon(_icons[index]);
          
        },
      
      ),
      
      
    );
    
    
  }

  void _retrieveIcons() {
    
      Future.delayed(Duration(milliseconds: 200)).then((e){
        setState(() {
          _icons.addAll([
            Icons.ac_unit,
            Icons.airport_shuttle,
            Icons.all_inclusive,
            Icons.beach_access, Icons.cake,
            Icons.free_breakfast
          ]);

        });
      });


    
  }
}

