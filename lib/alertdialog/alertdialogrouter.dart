import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertDialogRouter extends StatefulWidget {
  @override
  _AlertDialogRouterState createState() => _AlertDialogRouterState();
}

class _AlertDialogRouterState extends State<AlertDialogRouter> {
  bool withTree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("对话框")),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              FlatButton(
                  onPressed: () async {
                    bool isDel = await showDeleteConfirmDialog1();
                    print(isDel != null ? "已删除" : "删除失败");
                  },
                  child: Text("Dialog1")),
              FlatButton(
                  onPressed: () {
                    changeLanguage();
                  },
                  child: Text("Dialog2")),
              FlatButton(
                  onPressed: () {
                    showListDialog();
                  },
                  child: Text("Dialog3")),
              FlatButton(
                  onPressed: () {
                    showCustomDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("提示"),
                            content: Text("您确定要删除当前文件吗？"),
                            actions: <Widget>[
                              FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("取消")),
                              FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                  },
                                  child: Text("确认")),
                            ],
                          );
                        });
                  },
                  child: Text("CustomDialog1")),
              FlatButton(
                  onPressed: () async {
                    bool delete = await showDeleteConfirmDialog2();
                  },
                  child: Text("对话框2")),
              FlatButton(
                  onPressed: () async {
                    bool delete = await showDeleteConfirmDialog3();
                  },
                  child: Text("对话框3")),
              FlatButton(
                  onPressed: () async {
                    int index = await _showModalBottomSheet();
                    print("点击了：$index");
                  },
                  child: Text("显示底部对话框")),
              FlatButton(
                  onPressed: () async {
                    _showBottomSheet().closed;
                  },
                  child: Text("显示底部全屏对话框")),
              FlatButton(
                  onPressed: () {
                    showLoadingDialog();
                  },
                  child: Text("显示加载框")),
              FlatButton(
                  onPressed: () {
                    _showDatePicker1();
                  },
                  child: Text("日期选择器（Android风格）")),
              FlatButton(
                  onPressed: () {
                    _showDatePicker2();
                  },
                  child: Text("日期选择器（iOS风格）")),
            ],
          ),
        ),
      ),
    );
  }

  //对话框1
  Future<bool> showDeleteConfirmDialog1() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示"),
            content: Text("你确认要删除当前文件吗？"),
            actions: <Widget>[
              FlatButton(
                child: Text("确认"),
                onPressed: () => Navigator.of(context).pop(true),
              ),
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("取消"))
            ],
          );
        });
  }

  //简单列表形式
  Future<int> changeLanguage() async {
    int i = await showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text('选择语言'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop(1);
                },
                child: Text('中文'),
              ),
              SimpleDialogOption(
                child: Text('英文'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });

    print(i == null ? "选择了英文" : "选择了英文");
  }

  //自定义dialog
  Future<void> showListDialog() async {
    int index = await showDialog(
      context: context,
      builder: (context) {
        var child = Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: 30,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("$index"),
                    onTap: () {
                      Navigator.of(context).pop(index);
                    },
                  );
                },
              ),
            ),
          ],
        );
        // return Dialog(child: child,);

        return UnconstrainedBox(
          constrainedAxis: Axis.vertical,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 280,
              maxHeight: 100,
            ),
            child: Material(
              child: child,
              type: MaterialType.card,
            ),
          ),
        );
      },
    );

    if (index != null) {
      print("点击了：$index");
    }
  }

  //遮罩以及动画
  Future<T> showCustomDialog<T>({@required BuildContext context,
    bool barrierDismissible = true,
    WidgetBuilder builder}) {
    final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
    return showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) {
        final Widget pageChild = Builder(builder: builder);
        return SafeArea(
          child: Builder(builder: (contex) {
            return theme != null
                ? Theme(
              data: theme,
              child: pageChild,
            )
                : pageChild;
          }),
        );
      },
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations
          .of(context)
          .modalBarrierDismissLabel,
      barrierColor: Colors.black87,
      //自定义遮罩的颜色
      transitionDuration: Duration(milliseconds: 150),
      transitionBuilder: _buildMaerinalDialogTransitions,
    );
  }

  //设置动画
  Widget _buildMaerinalDialogTransitions(BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    //缩放动画
    return ScaleTransition(
      scale: CurvedAnimation(parent: animation, curve: Curves.easeInOut),
      child: child,
    );
  }

  //设置复选框，未处理状态，不能选中
  Future<bool> showDeleteConfirmDialog2() {
    withTree = false;
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示"),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("确定要删除当前文件吗？"),
                Row(
                  children: <Widget>[
                    Text("同时删除子目录？"),
                    Checkbox(
                        value: withTree,
                        onChanged: (value) {
                          setState(() {
                            withTree = !withTree;
                          });
                        }),
                  ],
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("取消")),
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text("删除"))
            ],
          );
        });
  }

  //Dialog 设置复选框，可以选中
  Future<bool> showDeleteConfirmDialog3() {
    bool _withTree = false; //记录复选框是否选中
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示"),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("您确定要删除当前文件。"),
                Row(
                  children: <Widget>[
                    Text("同时删除子目录？"),
                    /**
                     *  方式1：封装CheckBox组件，可以达到改变状态的目的
                     *  缺点是每个组件都需要封装
                     */
//                  DialogCheckBox(onChange: (value){
//                    _withTree = !withTree;
//                  },
//                  value: _withTree,
//                  )
                    /**
                     * 方式2：仿照Builder 封装一个StatefulBuilder,也可以达到改变状态的目的
                     *
                     */
                    //使用StatefulBuilder来构建StatefulWidget上下文
//                  StateFulBuilder(builder: (context,_setState){
//                    return Checkbox(
//                      value: _withTree,//默认不选中
//                      onChanged: (value){
//                        //_setState方法的实质就是StatefulWidget的setStatef方法
//                        _setState((){//更新选中状态
//                          _withTree = !_withTree;
//                        });
//                      },
//                    );
//
//                  })

                    /**
                     * 方法3：拿到Element的markNeedBuilder 方法来更新
                     * 缺点是每次调用都会刷新整个布局
                     */
//                  Checkbox(value: _withTree, onChanged: (value){
//                    // 此时context为对话框UI的根Element，我们
//                    // 直接将对话框UI对应的Element标记为dirty
//                    (context as Element).markNeedsBuild();
//                    _withTree = !_withTree;
//
//                  })

                    /**
                     * 方法4：使用Builder 包裹 实现局部刷新
                     */
                    // 通过Builder来获得构建Checkbox的`context`，
                    // 这是一种常用的缩小`context`范围的方式
                    Builder(builder: (context) {
                      return Checkbox(
                          value: _withTree,
                          onChanged: (value) {
                            (context as Element).markNeedsBuild();
                            _withTree = !_withTree;
                          });
                    })
                  ],
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("取消")),
              FlatButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: Text("删除")),
            ],
          );
        });
  }

  Future<int> _showModalBottomSheet() {
    return showModalBottomSheet<int>(
        context: context,
        builder: (context) {
          return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("$index"),
                  onTap: () => Navigator.of(context).pop(index),
                );
              });
        });
  }

  //从底部弹出一个全屏的dialog
  PersistentBottomSheetController<int> _showBottomSheet() {
    return showBottomSheet<int>(
        context: context,
        builder: (context) {
          return ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("$index"),
                  onTap: () {
                    print(index);
                    Navigator.pop(context);
                  },
                );
              });
        });
  }

  //加载框`
  showLoadingDialog() {
    showDialog(
        context: context,
        barrierDismissible: false, //点击遮罩不关闭对话框
        builder: (cx) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.only(top: 26.0),
                  child: Text("正在加载中,请稍后......"),
                )
              ],
            ),
          );
        });
  }

  //显示日历对话框 android
  Future<DateTime> _showDatePicker1() {
    var date = DateTime.now();
    return showDatePicker(context: context,
        initialDate: date,
        firstDate: date,
        lastDate: date.add(Duration(days: 30)));
  }

  //显示日历对话框 Ios
  Future<DateTime> _showDatePicker2() {
    var date = DateTime.now();
    return showCupertinoModalPopup(context: context, builder: (cx) {
      return SizedBox(
        height: 200,
        child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.dateAndTime,
            minimumDate: date,
            maximumYear: date.year + 1,
            maximumDate: date.add(Duration(days: 30)),
            onDateTimeChanged: (DateTime value) {
              print(value);
            }),
      );
    });
  }
}

class StateFulBuilder extends StatefulWidget {
  const StateFulBuilder({
    Key key,
    @required this.builder,
  })
      : assert(builder != null),
        super(key: key);

  final StatefulWidgetBuilder builder;

  @override
  _StateFulBuilderState createState() => _StateFulBuilderState();
}

class _StateFulBuilderState extends State<StateFulBuilder> {
  @override
  Widget build(BuildContext context) => widget.builder(context, setState);
}

class DialogCheckBox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChange;

  @override
  _DialogCheckBoxState createState() => _DialogCheckBoxState();

  DialogCheckBox({
    Key key,
    this.value,
    @required this.onChange,
  });
}

class _DialogCheckBoxState extends State<DialogCheckBox> {
  bool value;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: (v) {
        widget.onChange(v);
        setState(() {
          value = v;
        });
      },
    );
  }
}
