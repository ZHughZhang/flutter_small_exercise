import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final String title;
  final Color color;

  NavBar({
    Key key,
    this.color,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("颜色主题"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        constraints: BoxConstraints(
          minWidth: double.infinity,
          minHeight: 52,
          maxHeight: 52
        ),
        decoration: BoxDecoration(
          color: color,
          boxShadow:[
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0,3),
              blurRadius: 3
            )
          ]
        ),
        child: Text(
          title,
          style: TextStyle(
            color:color.computeLuminance()<0.5?Colors.white:Colors.black
          ),
        ),
        alignment: Alignment.center,
      ),
    );
  }
}

class ThemeTestRoute extends StatefulWidget {
  @override
  _ThemeTestRouteState createState() => _ThemeTestRouteState();
}

class _ThemeTestRouteState extends State<ThemeTestRoute> {
  Color _themColor = Colors.teal;


  @override
  Widget build(BuildContext context) {
    ThemeData themeData=  Theme.of(context);

    return Theme(
      data: ThemeData(
        primaryColor: _themColor,
        iconTheme: IconThemeData(color: _themColor),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("主题测试"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.forward),
                Icon(Icons.airport_shuttle),
                Text("颜色跟随主题"),
              ],
            ),
            Theme(
              data: themeData.copyWith(
                iconTheme: themeData.iconTheme.copyWith(
                  color:Colors.black
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.favorite),
                  Icon(Icons.airport_shuttle),
                  Text("颜色固定黑色")
                ],
              ),
            )
          ],

        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          setState(() {
            _themColor = _themColor == Colors.teal ? Colors.blue:Colors.teal;
          });
        },
          child: Icon(Icons.palette),

        ),

      ),
    );
  }
}



