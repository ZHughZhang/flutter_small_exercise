import 'package:flutter/material.dart';

 class CustomButton extends StatefulWidget {
  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
            title:Text("自定义按钮")
        ),
        body:Container(
          child: Column(
            children: <Widget>[
              GradientButton(
                  height: 50,
                  onPressed: onTap,
                  colors: [Colors.orange,Colors.red],
                  child: Text("Submit")),
              GradientButton(
                  height: 50,
                  onPressed: onTap,
                  colors: [Colors.lightGreen,Colors.green[700]],
                  child: Text("Submit")),
              GradientButton(
                  height: 50,
                  onPressed: onTap,
                  colors: [Colors.lightGreen[300],Colors.blueAccent],
                  child: Text("Submit")),
            ],
          ),
        ),

    );
  }

  onTap(){
    print("button click");

  }
}






class GradientButton extends StatelessWidget {
  //渐变色数组
  final List<Color> colors;

  //按钮宽高
  final double height;

  final double width;

  //点击事件
  final GestureTapCallback onPressed;
  final BorderRadius borderRadius;

  final Widget child;

  GradientButton({
    this.colors,
    this.width,
    this.height,
    this.onPressed,
    this.borderRadius,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    //确保colors 不为空
    List<Color> _colors = colors ??
        [
          themeData.primaryColor,
          themeData.primaryColorDark ?? themeData.primaryColor
        ];

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: _colors),
        borderRadius: borderRadius,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: _colors.last,
          highlightColor: Colors.transparent,
          borderRadius: borderRadius,
          onTap: onPressed,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: height, width: width),
            child: Center(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultTextStyle(
                      style: TextStyle(fontWeight: FontWeight.bold),
                      child: child)),
            ),
          ),
        ),
      ),
    );
  }
}
