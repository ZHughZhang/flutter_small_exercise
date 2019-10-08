import 'package:flutter/material.dart';

class BoxDecorationContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
            title:Text("装饰容器（BoxDecoration）")
        ),
        body:
        Center(
          child:Container(
            child: DecoratedBox(

              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.red,Colors.deepOrange[400]]),//渐变色
                  borderRadius: BorderRadius.circular(3.0),//圆角
                  boxShadow: [
                    BoxShadow(//阴影
                        color: Colors.black54,
                        offset: Offset(2,2),
                        blurRadius: 4.0
                    )
                  ]
              ),
              child: Padding(padding: EdgeInsets.symmetric(horizontal: 80,vertical: 18),
                child: Text("Login",style: TextStyle(
                    color: Colors.white
                ),),
              ),
            ),
          ) ,
        )

        ,
    );
  }
}




