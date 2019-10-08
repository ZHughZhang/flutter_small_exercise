import 'package:flutter/material.dart';

class customscrollview_scrolled extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          //AppBar,包含一个导航栏
          SliverAppBar(
            pinned: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("Demo"),
              background: Image.network(
                "http://b-ssl.duitang.com/uploads/item/201808/27/20180827043223_twunu.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(padding: const EdgeInsets.all(8),
            sliver: SliverGrid(

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 4
                )
                , delegate: SliverChildBuilderDelegate(
                    (context, index) {
                    return Container(
                      alignment: Alignment.center,
                      color: Colors.cyan[100*(index%9)],
                      child: Text("grid item $index"),
                    );

            },
              childCount: 20
            )
            ),
          ),
          SliverFixedExtentList(

              itemExtent: 50,
              delegate: SliverChildBuilderDelegate((context,index){
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100*(index%9)],
                  child: Text("list item $index"),
                );

              },
                childCount: 50
              ))
        ],
      ),
    );



  }
}




