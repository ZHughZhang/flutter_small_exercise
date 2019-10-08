import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class RandomWorldList extends StatefulWidget {
  @override
  _RandomWorldListState createState() => _RandomWorldListState();
}

class _RandomWorldListState extends State<RandomWorldList> {
  final _suggestions = <WordPair>[];

  final _saved = Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Startup Name Generator'
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildListView(),
    );
  }

  Widget _buildListView() {
    return ListView.builder(

      //设置内间距 16
        padding: EdgeInsets.all(16.0),
        //对每一行建议的单词对都会调用一次itemBuilder,然后将单词添加到ListTitle行中
        //在偶数行，该函数会为单词对添加一个ListTile row
        //在奇数行，该函数会添加一个分割线Widget，来分割相邻的次对。
        //注意，在小屏幕上，分割线看起来能比较吃力
        itemBuilder: (context, i) {
          //在每一列钱，添加一个一像素高的Widget
          if (i.isOdd) return Divider();

          //语法 'i~/2'表示除以2，但返回值是整数（向下取整，）比如i为1，2，3，4，5
          //时，结果为0，1，1，2，2这可以计算吃ListView中减去分割线后实际单词数量
          final index = i ~/ 2;
          //如果是建议列表最后一个单词对
          if (index >= _suggestions.length) {
            //......接着生成10个单词对，然后添加到建议表
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair suggestion) {
    final alreadSaved = _saved.contains(suggestion);
    return ListTile(
      title: Text(
        suggestion.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadSaved ? Icons.favorite : Icons.favorite_border,
        color: alreadSaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if(alreadSaved){
            _saved.remove(suggestion);

          }else{
            _saved.add(suggestion);

          }
        });
      },
    );
  }


  void _pushSaved(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context){
        final tiles = _saved.map(
            (pair){
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            }
        );
        final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles).toList();

        return Scaffold(
          appBar: AppBar(
            title: Text("Saved Suggestions"),
          ),
          body: ListView(children: divided,),
        );
        
        
      })

    );
  }
}
