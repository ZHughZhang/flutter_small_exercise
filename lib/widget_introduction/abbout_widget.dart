import 'package:flutter/material.dart';
import 'package:flutter_small_exercise/container/HomePage.dart';
import 'package:flutter_small_exercise/container/SizedBoxContainer.dart';
import 'package:flutter_small_exercise/container/TransformContainer.dart';
import 'package:flutter_small_exercise/container/boxdecorationcontainer.dart';
import 'package:flutter_small_exercise/container/clipcontainer.dart';
import 'package:flutter_small_exercise/container/constrainedboxcontainer.dart';
import 'package:flutter_small_exercise/container/paddingcontainer.dart';
import 'package:flutter_small_exercise/container/unconstrainedboxcontainer.dart';
import 'package:flutter_small_exercise/expansiontile.dart';
import 'package:flutter_small_exercise/scrolled/customscrollview_scrolled.dart';
import 'package:flutter_small_exercise/scrolled/gridview_scrolled.dart';
import 'package:flutter_small_exercise/scrolled/listview_scrolled.dart';
import 'package:flutter_small_exercise/scrolled/scrollcontroller.dart';
import 'package:flutter_small_exercise/scrolled/singlechildescrollview.dart';
import 'package:flutter_small_exercise/widget_introduction/ProgressIndicators.dart';
import 'package:flutter_small_exercise/widget_introduction/SwitchAndCheckBoxTestRouteState.dart';
import 'package:flutter_small_exercise/widget_introduction/about_stateful/StateLeifCycle.dart';
import 'package:flutter_small_exercise/widget_introduction/about_stateless/ContextRouter.dart';
import 'package:flutter_small_exercise/widget_introduction/about_stateless/Echo.dart';
import 'package:flutter_small_exercise/widget_introduction/def_style.dart';
import 'package:flutter_small_exercise/widget_introduction/felxlayout.dart';
import 'package:flutter_small_exercise/widget_introduction/flowlayout.dart';
import 'package:flutter_small_exercise/widget_introduction/linearlayout/LinearLayout.dart';
import 'package:flutter_small_exercise/widget_introduction/picture_and_icon/ImageWidget.dart';
import 'package:flutter_small_exercise/widget_introduction/stacklayout.dart';
import 'package:flutter_small_exercise/widget_introduction/wraplayout.dart';

import 'TextFileWidget.dart';
import 'alignlayout.dart';

class AboutWidge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                FlatButton(
                  child: Text("Echo"),
                  onPressed: (){
                    _buildPush(context,Echo(text:"Hello World"));
                  },
                ),
                FlatButton(
                  child: Text("ContextRouter"),
                  onPressed: (){
                    _buildPush(context,ContextRouter());
                  },

                ),
                FlatButton(
                  child: Container(
                    color: Colors.deepOrange,
                    child: Text("StateLeifCycle"),
                  ),
                  onPressed: (){
                    _buildPush(context,StateLeifCycle());
                  },

                ),
                FlatButton(
                  child: Container(
                    color: Colors.deepOrange,
                    child: Text("Default_TextStyle"),
                  ),
                  onPressed: (){
                    _buildPush(context, Default_TextStyle());
                  },

                ),
                FlatButton(
                  child: Container(
                    color: Colors.deepOrange,
                    child: Text("ImageWidget"),
                  ),
                  onPressed: (){
                    _buildPush(context, ImageWidget());
                  },

                ),
                FlatButton(
                  child: Container(
                    color: Colors.deepOrange,
                    child: Text("SwitchAndCheckBoxTestRouteState"),
                  ),
                  onPressed: (){
                    _buildPush(context, SwitchAndCheckBoxTestRouteState());
                  },

                ),
                FlatButton(
                  child: Container(
                    color: Colors.deepOrange,
                    child: Text("TextFieldWidget"),
                  ),
                  onPressed: (){
                    _buildPush(context, TextFieldWidget());
                  },

                ),
                FlatButton(
                  child: Container(
                    color: Colors.deepOrange,
                    child: Text("ProgressIndicators"),
                  ),
                  onPressed: (){
                    _buildPush(context, ProgressIndicators());
                  },

                ),
                FlatButton(
                  child: Container(
                    color: Colors.deepOrange,
                    child: Text("Linearlayout"),
                  ),
                  onPressed: (){
                    _buildPush(context, Linearlayout());
                  },

                ),
                FlatButton(
                  child: Container(
                    color: Colors.deepOrange,
                    child: Text("FlexLayout"),
                  ),
                  onPressed: (){
                    _buildPush(context, FlexLayout());
                  },

                ),
                FlatButton(
                  child: Container(
                    child: Text("WrapLayout"),
                  ),
                  onPressed: (){
                    _buildPush(context, WrapLayout());
                  },

                ),
                FlatButton(
                  child: Container(
                    child: Text("FlowLayout"),
                  ),
                  onPressed: (){
                    _buildPush(context, FlowLayout());
                  },
                ),
                FlatButton(
                  child: Container(
                    child: Text("StackLayout"),
                  ),
                  onPressed: (){
                    _buildPush(context, StackLayout());
                  },
                ),
                FlatButton(
                  child: Container(
                    child: Text("AlignLayout"),
                  ),
                  onPressed: (){
                    _buildPush(context, AlignLayout());
                  },
                ),
                FlatButton(
                  child: Container(
                    child: Text("PaddingContainer"),
                  ),
                  onPressed: (){
                    _buildPush(context, PaddingContainer());
                  },
                ),
                FlatButton(
                  child: Container(
                    child: Text("ConstrainedBoxContainer"),
                  ),
                  onPressed: (){
                    _buildPush(context, ConstrainedBoxContainer());
                  },
                ),
                FlatButton(
                  child: Container(
                    child: Text("SizeBoxContainer"),
                  ),
                  onPressed: (){
                    _buildPush(context, SizeBoxContainer());
                  },
                ),
                FlatButton(
                  child: Container(
                    child: Text("UnconstrainedBoxContainer"),
                  ),
                  onPressed: () => _buildPush(context, UnconstrainedBoxContainer()),
                ),
                FlatButton(
                  child: Container(
                    child: Text("BoxDecorationContainer"),
                  ),
                  onPressed: () => _buildPush(context, BoxDecorationContainer()),
                ),
                FlatButton(
                  child: Container(
                    child: Text("TransformContainer"),
                  ),
                  onPressed: () => _buildPush(context, TransformContainer()),
                ),
                FlatButton(
                  child: Container(
                    child: Text("HomePage"),
                  ),
                  onPressed: () => _buildPush(context, HomePage()),
                ),
                FlatButton(
                  child: Container(
                    child: Text("ClipContainer"),
                  ),
                  onPressed: () => _buildPush(context, ClipContainer()),
                ),
                FlatButton(
                  child: Container(
                    child: Text("SingleChildeScrollViews"),
                  ),
                  onPressed: () => _buildPush(context, SingleChildeScrollViews()),
                ),
                FlatButton(
                  child: Container(
                    child: Text("ListViewScrolled"),
                  ),
                  onPressed: () => _buildPush(context, ListViewScrolled()),
                ),
                FlatButton(
                  child: Container(
                    child: Text("GridviewScrolled"),
                  ),
                  onPressed: () => _buildPush(context, GridviewScrolled()),
                ),
                FlatButton(
                  child: Container(
                    child: Text("customscrollview_scrolled"),
                  ),
                  onPressed: () => _buildPush(context, customscrollview_scrolled()),
                ),
                FlatButton(
                  child: Container(
                    child: Text("ScrollControllers"),
                  ),
                  onPressed: () => _buildPush(context, ScrollControllers()),
                ),
                FlatButton(
                  child: Container(
                    child: Text("ExpansionTileSample"),
                  ),
                  onPressed: () => _buildPush(context, ExpansionTileSample()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _buildPush(BuildContext context,Widget widget) {
    return Navigator.push(context, MaterialPageRoute(builder: (context){
                  return widget;
                }));
  }
}
