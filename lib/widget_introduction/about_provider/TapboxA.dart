
import 'package:flutter/material.dart';

class TabboxA extends StatefulWidget {




  @override
  _TabboxAState createState() => _TabboxAState();

  TabboxA({Key key}):super(key:key);
}

class _TabboxAState extends State<TabboxA> {

  bool _active = false;

  void _handlTap(){
    setState(() {
      _active = !_active;

    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handlTap,
      child: Container(
        child: Center(
          child: Text(
            _active?"Active":"Inactive",
            style: TextStyle(
              fontSize: 32.0,
              color: Colors.deepOrange
            ),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration:BoxDecoration(
          color: _active?Colors.lightGreen[70]:Colors.grey[70]
        )
      ),
    );
  }



}
