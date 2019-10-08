import 'package:flutter/material.dart';

class TabBarPageFirst extends StatefulWidget {
  @override
  _TabBarPageFirstState createState() => _TabBarPageFirstState();
}

class _TabBarPageFirstState extends State<TabBarPageFirst>  with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _buildSuggesttions();
  }

  final _suggestions = <String>[];

  final _biggerFont = const TextStyle(fontSize: 18.0);


  Widget _buildRow(String pair) {
    return new ListTile(
      title: new Text(
        pair,
        style: _biggerFont,
      ),
    );
  }
  generateWordPairs() {
    return [
      "11111",
      "222222",
      "3333333",
      "4444444",
      "11111",
      "222222",
      "3333333",
      "4444444",
      "11111",
      "222222",
      "3333333",
      "4444444",
      "11111",
      "222222",
      "3333333",
      "4444444"
    ];
  }
  Widget _buildSuggesttions(){
    return ListView.builder(
        padding: EdgeInsets.all(16),
        itemBuilder:(context,index){
        if (index.isOdd)return new Divider();
        final i = index ~/2;
        if(i>= _suggestions.length){
          _suggestions.addAll(generateWordPairs());

        }
        return _buildRow(_suggestions[i]);

    });
  }

  @override
  bool get wantKeepAlive => true;
}
