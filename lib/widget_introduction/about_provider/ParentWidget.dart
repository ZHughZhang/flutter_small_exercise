import 'package:flutter/material.dart';

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxchanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrange,
      child: TabboxC(
        onChanged: _handleTapboxchanged,
        active: _active,
      ),
    );
  }
}

class TabboxB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
        child: Container(
        child: Center(
         child: Text(
          active ? "Active" : "Inactive",
          style: TextStyle(
              fontSize: 32.0,
              color: Colors.grey,
              fontStyle: FontStyle.normal,
              decoration:TextDecoration.none,
          ),
        ),
      ),
    ));
  }

  TabboxB({Key key, this.active: false, @required this.changed})
      : super(key: key);
  final bool active;
  final ValueChanged<bool> changed;

  void _handleTap() {
    changed(!active);
  }
}


class TabboxC extends StatefulWidget {


  @override
  _TabboxCState createState() => _TabboxCState();

  TabboxC({Key key, this.active,@required this.onChanged}):super(key:key);

  final bool active;
  final ValueChanged<bool>onChanged;

}




class _TabboxCState extends State<TabboxC> {

  bool _heightlight = false;

  void _handleTapDown(TapDownDetails details){
      setState(() {
        _heightlight = true;
      });
  }

  void _handleUp(TapUpDetails details){
    setState(() {
      _heightlight = false;

    });
  }

  void _handleCancel(){
    setState(() {
      _heightlight = false;

    });

  }

  void _handleTap(){
    setState(() {
      widget.onChanged (!widget.active);

    });
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTap: _handleTap,
      onTapUp: _handleUp,
      onTapCancel: _handleCancel,
      child: Container(
        child: Center(
          child: Text(widget.active? "Active":"InActive",
          style: TextStyle(fontSize: 32.0,color: Colors.deepOrange),),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: widget.active?Colors.lightGreen:Colors.grey,
          border: _heightlight? Border.all(
            color: Colors.teal,
            width: 10.0
          ): null
        ),
      ),
    );
  }


}

