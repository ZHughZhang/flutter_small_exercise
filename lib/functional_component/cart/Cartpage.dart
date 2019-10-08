import 'package:flutter/material.dart';
import 'package:flutter_small_exercise/functional_component/cart/CartModel.dart';
import 'package:flutter_small_exercise/functional_component/cart/Item.dart';
import 'package:flutter_small_exercise/functional_component/cart/consumer.dart';
import 'package:flutter_small_exercise/functional_component/inheritedprovider.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
            title:Text("跨组件状态共享之 购物车")
        ),
        body:Container(
          child: Center(
            child: ChangeNotifierProvider(
              data: CartModel(),
              child: Builder(builder: (context){
                return Column(
                  children: <Widget>[
                    Builder(builder: (context){
                      return Consumer<CartModel>(
                        builder: (context,cart) => Text("总价格：${cart.totalPrice}"),
                      );

                    }),
                    Builder(builder: (context){
                      return FlatButton(onPressed: (){


                        /**
                         * 我们点击”添加商品“按钮后，
                         * 由于购物车商品总价会变化，
                         * 所以显示总价的Text更新是符合预期的，
                         * 但是”添加商品“按钮本身没有变化，
                         * 是不应该被重新build的。
                         * 但是我们运行示例，
                         * 每次点击”添加商品“按钮，
                         * 控制台都会输出"RaisedButton build"日志，
                         * 也就是说”添加商品“按钮在每次点击时其自身都会重新build！
                         * 这是为什么呢？如果你已经理解了InheritedWidget的更新机制，
                         * 那么答案一眼就能看出：
                         * 这是因为构建RaisedButton的Builder中调用了ChangeNotifierProvider.of，
                         * 也就是说依赖了Widget树上面的InheritedWidget（即InheritedProvider ）Widget，
                         * 所以当添加完商品后，CartModel发生变化，会通知ChangeNotifierProvider,
                         * 而ChangeNotifierProvider则会重新构建子树，所以InheritedProvider将会更新，
                         * 此时依赖它的子孙Widget就会被重新构建。
                         *
                         */

                        //listen 设置为false 不建立连接，只在乎数据的变化
                        ChangeNotifierProvider.of<CartModel>(context,listen: false).add(Item(20, 1));

                      }, child: Text("添加商品"));

                    })
                  ],
                );

              }),
            ),
          ),

        ),

    );
  }
}
