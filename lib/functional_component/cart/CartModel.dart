import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_small_exercise/functional_component/cart/Item.dart';

class CartModel extends ChangeNotifier {
  //保存购物车商品列表状态
  final List<Item> _items = [];

  //禁止改变购物车的商品信息
  UnmodifiableListView<Item> get item => UnmodifiableListView(_items);

  //购物车商品的总价格
  double get totalPrice => _items.fold(0, (value,item) => value +item.cout*item.price);

  //将 [item] 添加到购物车，这是唯一一种能从外部修改购物车的方法。
  void add(Item item){
    _items.add(item);
    //通知监听者（订阅者），重新构建InheritedProvider更新状态
    notifyListeners();
  }

}