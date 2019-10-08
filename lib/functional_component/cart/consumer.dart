import 'package:flutter/material.dart';
import 'package:flutter_small_exercise/functional_component/inheritedprovider.dart';

class Consumer<T> extends StatelessWidget {

  final Widget child;
  final Widget Function(BuildContext context,T value) builder;



  @override
  Widget build(BuildContext context) {
    return builder(
      context,ChangeNotifierProvider.of<T>(context),
    );
  }

  Consumer({Key key,@required this.builder,this.child}):assert(builder != null),super(key:key);
}
