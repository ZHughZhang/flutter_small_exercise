import 'package:flutter/material.dart';
import 'package:flutter_small_exercise/widget_demo/TabBarDemo.dart';

import 'TabBarPageFirst.dart';

class TabBarPageWidget extends StatefulWidget {
  @override
  _TabBarPageWidgetState createState() => _TabBarPageWidgetState();
}

class _TabBarPageWidgetState extends State<TabBarPageWidget> {



 final PageController controller = PageController();
 final List<String> tab = ["111", "222", "333", "444", "555", "666", "777", "888", "999", "1010", "1111", "1212", "1313", "1414", "!515", "1616"];

 _renderPage() {
   return  [
     new TabBarPageFirst(),
     new TabBarPageFirst(),
     new TabBarPageFirst(),
     new TabBarPageFirst(),
     new TabBarPageFirst(),
     new TabBarPageFirst(),
     new TabBarPageFirst(),
     new TabBarPageFirst(),
     new TabBarPageFirst(),
     new TabBarPageFirst(),
     new TabBarPageFirst(),
     new TabBarPageFirst(),
     new TabBarPageFirst(),
     new TabBarPageFirst(),
     new TabBarPageFirst(),
     new TabBarPageFirst(),
   ];
 }

 _rendderTab(){
   List<Widget> list = [];
   for (int i = 0 ; i<tab.length;i++) {
     list.add(FlatButton(
       onPressed: (){
         controller.jumpTo(MediaQuery.of(context).size.width*i);
       },
       child: Text(tab[i],maxLines: 1,style: TextStyle(color: Colors.black),),
     ));
   }

   return list;
 }


 @override
  Widget build(BuildContext context) {
    return  TabBarDemo(
      type: TabBarDemo.TOP_TAB,
      tabItems:_rendderTab(),
      tabViews:_renderPage(),
      topPageControl: controller,
      backgroundColor: Colors.blueAccent,
      indicatorColor: Colors.purple,
      title: new Text("垃圾"),

    );
  }
}
