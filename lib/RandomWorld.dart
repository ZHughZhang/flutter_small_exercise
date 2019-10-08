import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class RandomWorld extends StatefulWidget {
  @override
  _RandomWorldState createState() => _RandomWorldState();
}

class _RandomWorldState extends State<RandomWorld> {
  @override
  Widget build(BuildContext context) {
    final worldPair = WordPair.random();

    return Container(
        child: Center(
          child: Text(
            worldPair.asLowerCase,
            style: TextStyle(
              fontSize: 23.0,
              color: Colors.cyanAccent,
              fontStyle: FontStyle.italic,
              decorationStyle:TextDecorationStyle.dotted,
              decoration: TextDecoration.lineThrough
            ),
           ),
    ));
  }
}
