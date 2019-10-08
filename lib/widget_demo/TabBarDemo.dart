import 'package:flutter/material.dart';

class TabBarDemo extends StatefulWidget {
  static const int BOTTOM_TAB = 1;
  static const int TOP_TAB = 2;

  final int type;

  final List<Widget> tabItems;

  final List<Widget> tabViews;

  final Color backgroundColor;

  final Color indicatorColor;

  final Widget title;

  final Widget drawer;

  final Widget floatingActionButton;

  final TarWidgetControl tarWidgetControl;

  final PageController topPageControl;

  TabBarDemo(
      {this.type,
      this.tabItems,
      this.tabViews,
      this.backgroundColor,
      this.indicatorColor,
      this.title,
      this.drawer,
      this.floatingActionButton,
      this.tarWidgetControl,
      this.topPageControl,
      Key key})
      : super(key: key);

  @override
  _TabBarDemoState createState() => _TabBarDemoState(type,
      tabItems,
      tabViews,
     backgroundColor,
      indicatorColor,
      title,
      drawer,
      floatingActionButton,
      topPageControl);
}

class _TabBarDemoState extends State<TabBarDemo>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  final int type;

  final List<Widget> tabItems;

  final List<Widget> tabViews;

  final Color backgroundColor;

  final Color indicatorColor;

  final Widget title;

  final Widget drawer;

  final Widget floatingActionButton;


  final PageController topPageControl;


  _TabBarDemoState(this.type, this.tabItems, this.tabViews,
      this.backgroundColor, this.indicatorColor, this.title, this.drawer,
      this.floatingActionButton, this.topPageControl);

  @override
  void initState() {
    super.initState();
    //初始花时创建控制器
    //通过with SingleTickerProviderStateMixin实现动画效果
    _controller = TabController(length:tabItems.length, vsync: this);
  }

  @override
  void dispose() {
    //页面销毁时，销毁控制器
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (type == TabBarDemo.TOP_TAB) {
      return Scaffold(
        //设置侧边滑drawer，
        drawer: drawer,
        //设置悬浮按钮
        floatingActionButton: floatingActionButton,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          title: Text('首页demo'),
          bottom: TabBar(
            tabs: tabItems,
            //必须设置成true 不然字体不会显示
            isScrollable: true,
            controller: _controller,
            indicatorColor: Colors.purple,
          ),
        ),
        body: PageView(
          controller: topPageControl,
          children:tabViews,
          onPageChanged: (index) {
            _controller.animateTo(index);
          },
        ),
      );
    }
    return Scaffold(
      drawer: widget.drawer,
      floatingActionButton: widget.floatingActionButton,
      appBar: AppBar(
        backgroundColor: widget.backgroundColor,
        title: Text("首页demo"),
        bottom: TabBar(
          tabs: widget.tabItems,
          isScrollable: true,
          controller: _controller,
          indicatorColor: Colors.purple,
        ),
      ),
      bottomNavigationBar: Material(
        color: widget.backgroundColor,
        child: TabBar(
          isScrollable: true,
          tabs: widget.tabItems,
            controller: _controller,
          indicatorColor: widget.indicatorColor,
        ),
      ),
      body: PageView(
        controller: widget.topPageControl,
        children: widget.tabViews,
        onPageChanged: (index)=>_controller.animateTo(index),
      ),
    );

  }
}

class TarWidgetControl {
  List<Widget> footerButton = [];
}
