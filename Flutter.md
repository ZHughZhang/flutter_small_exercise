Navigator

    Navigator 是一个路由管理的组件，它提供了打开和退出路由页方法。
通过栈来管理活动路由集合，通常当前屏幕的显示的页面就是栈顶的路由。

    Future push （BuildContext context,Router router）

        将给定的路由入栈（即打开新的页面），
        返回值是一个Future 对象，用已接收新的路由出栈时返回数据

    bool pop(BuildContext context,[result])

        将栈顶的路由出栈，result为页面关闭返回给上一个页面的数据



路由的两种启动方式：

    1.显示启动

    Navigator.of(context).push(MaterPagerRouter(MaterialPageRoute(build: routerName,param)));

    2.隐式启动


    在MaterialApp 注册 router 列表
        如果设置跟路由 需要设置initialRoute: "/",根路由设置是不需要再MaterialApp中设置body
        第二步设置router属性  将命名好的路由将在字典中{routerName: (context)=>需要跳转页面的类}
            如果需要携带参数需要设置 ModalRoute.of(context).settings.arguments,
            Navigation.of(context).pushName("RouterName",arguments:参数);
            在跳转页面之后用ModalRoute.of(context).settings.arguments, 接受参数
onGenerateRoute

   对路由做预处理 例如登录判断，只对命名的路由起作用
    在MaterialApp 使用
    
~~~
	onGenerateRoute：(RouteSettings settings){
   			return MaterialPageRoute(builder: (context){
   				String routeName = settings.name;
  				 // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
    			// 引导用户登录；其它情况则正常打开路由。
   			 }
    );
~~~

两种组件
	Mayerial和Cupertino