import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_small_exercise/RandomWordList.dart';
import 'package:flutter_small_exercise/RandomWorld.dart';
import 'package:flutter_small_exercise/RandomWorld.dart';
import 'package:flutter_small_exercise/RouterManager.dart';
import 'package:flutter_small_exercise/TipRouter.dart';
import 'package:flutter_small_exercise/my_homepage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final worldPair = WordPair.random();
    return MaterialApp( //在首层 必须写
      theme: ThemeData(
        primaryColor: Colors.cyanAccent
      ),
      initialRoute: "/",
      routes: {
        "new_page":(context) => NewRouter(),
        "/":(context) => MyHomePage(title:"my_homepage"),
        "tiprouter": (context)=>TipRouter(title: ModalRoute.of(context).settings.arguments,)
      },
      debugShowCheckedModeBanner: false,
      title: 'flutter exercise',

    );
  }
}
