import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  TextEditingController _controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusScopeNode focusScopeNode;

  FocusNode focusNode3 = FocusNode();

  bool _isFocus = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.text = "你好！世界！"; //设置默认值
    _controller.selection = TextSelection(
      //设置选中条件
        baseOffset: 2,
        extentOffset: _controller.text.length);
    _controller.addListener(() {
      print(_controller.text);
    });
    focusNode.addListener(() {
      print(focusNode.hasFocus);
    });
    focusNode3.addListener((){
      setState(() {
        _isFocus = focusNode3.hasFocus;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("输入框与表单"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:  Center(
          child: Column(
            children: <Widget>[
              TextField(
                autofocus: true,
                controller: _controller,
                onChanged: (v) {
                  print("onChange:$v");
                },
                decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "用户名或邮箱",
                    prefixIcon: Icon(Icons.person)),
                focusNode: focusNode,
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "您的登录密码",
                    prefixIcon: Icon(Icons.lock)),
                obscureText: true,
                focusNode: focusNode2,
              ),
              Builder(builder: (context) {
                return Column(
                  children: <Widget>[
                    RaisedButton(
                        child: Text("移动焦点"),
                        onPressed: () {
                          if (null == focusScopeNode) {
                            focusScopeNode = FocusScope.of(context);
                          }
                          focusScopeNode.requestFocus(focusNode2);
                        }),
                    RaisedButton(
                        child: Text("隐藏键盘"),
                        onPressed: () {
                          focusNode.unfocus();
                          focusNode2.unfocus();
                        })
                  ],
                );
              }),
              Theme(
                  data: Theme.of(context).copyWith(
                      hintColor: Colors.grey,
                      inputDecorationTheme: InputDecorationTheme(
                          labelStyle: TextStyle(
                            color: Colors.orange, //定义label 字体样式
                          ),
                          hintStyle: TextStyle( //定义hint 字体样式
                            color: Colors.red,
                            fontSize: 14.0,
                          ))),
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        labelText: "密码",
                        hintText: "您的登录密码",
                        hintStyle: TextStyle(
                            color: Colors.grey, fontSize: 13.0
                        )
                    ),
                    obscureText: true,
                  )),
              Container(
                child: TextField(
                  focusNode: focusNode3,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "电子邮箱地址",
                      prefixIcon: Icon(Icons.email),
                      border: InputBorder.none
                  ),

                ),

                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color:Colors.grey[200], width:1.0
                        )
                    )
                ),
              ),
              FromFieldWidget(),

            ],
          ),
        ),
      ),
    );
  }
}



class FromFieldWidget extends StatefulWidget {
  @override
  _FromFieldWidgetState createState() => _FromFieldWidgetState();
}

class _FromFieldWidgetState extends State<FromFieldWidget> {
  TextEditingController _unController = TextEditingController();
  TextEditingController _pwController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(child: Column(
        children: <Widget>[
          TextFormField(
            autofocus: true,
            controller: _unController,
            decoration: InputDecoration(
              labelText: "用户名",
              hintText: "用户或邮箱",
              icon: Icon(Icons.person)
            ),
            validator: (v){
              return v.trim().length>0 ? null:"用户名不能为空";
            },

          ),
          TextFormField(
            controller: _pwController,
            decoration: InputDecoration(
              labelText: "密码",
              hintText: 'n您的登录密码',
              icon: Icon(Icons.lock)
            ),
            obscureText: true,
            validator: (v){
             return  v.trim().length>5?null:"密码不能少于6位";

            },
          ),
          Padding(
              padding: EdgeInsets.all(15.0),
            child: Row(
              children: <Widget>[
                //通过Builder来获取RaisedButton所在widget树的真正context(Element) 
                Builder(builder: (context){
                    return
                      RaisedButton (
                        padding: EdgeInsets.all(15.0),
                        child: Text("登录"),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        onPressed: (){
                          //在这里不能通过此方式获取FormState，context不对
                          //print(Form.of(context));

                          // 通过_formKey.currentState 获取FormState后，
                          // 调用validate()方法校验用户名密码是否合法，校验
                          // 通过后再提交数据
                          //方式1
                          if ((_formKey.currentState as FormState).validate()){
                            //提交数据
                            print("提交成功");
                          }
                          //方式2必须有context 传入  也就是 必须写builder
                          if(Form.of(context).validate()){
                            print("提交成功");

                          }
                        },
                      );
                })

              ],
            ),
          )
        ],
      ),
      key: _formKey,
        autovalidate: true,
      ),

    );
  }
}

