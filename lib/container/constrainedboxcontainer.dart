import 'package:flutter/material.dart';

class ConstrainedBoxContainer extends StatelessWidget {

  Widget rebox = DecoratedBox(decoration: BoxDecoration(color: Colors.red));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
            title:Text("尺寸限制类容器（ConstrainedBox）"),
          leading: InkWell(
            child: Icon(Icons.arrow_back,color: Colors.white,),
          ),
        ),
        body:Container(
          child: ConstrainedBox(

          /**  const BoxConstraints({
              this.minWidth = 0.0, //最小宽度
              this.maxWidth = double.infinity, //最大宽度
              this.minHeight = 0.0, //最小高度
              this.maxHeight = double.infinity //最大高度
            })*/
            constraints: BoxConstraints(
            minHeight: 50,
            minWidth: double.infinity,//尽可能的大
          ),
            child: Container(
              height: 5,
              child: rebox,
            ),
          ),

        ),
    );
  }
}




