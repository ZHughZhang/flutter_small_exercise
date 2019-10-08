import 'package:flutter/material.dart';

class Echo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Text(text),
    );
  }

  const Echo({Key key,@required this.text,this.backgroundColor:Colors.green}):super(key:key);
  final String text;
  final Color backgroundColor;


}
