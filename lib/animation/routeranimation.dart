import 'package:flutter/material.dart';

class FadeRotute extends PageRoute{
  final WidgetBuilder builder;


  @override
  final Color barrierColor ;

  @override
  final String barrierLabel;
  @override
  final bool maintainState ;

  @override
  final Duration transitionDuration ;
  @override
  final bool opaque;
  @override
  final bool barrierDismissible;



  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    if (isActive){
      return FadeTransition(opacity: animation,child: builder(context),);
    }else{
      return Padding(padding: EdgeInsets.zero,);
    }


  }


  FadeRotute({@required this.builder,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true
  });

}