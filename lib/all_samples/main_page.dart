import 'package:flutter/material.dart';
import 'package:flutter_demo/all_samples/router/router_easy_sample/router_demo.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'animation/animated_widgets.dart';
import 'animation/animated_switcher.dart';
import 'animation/animation_scale.dart';
import 'animation/animation_widget.dart';
import 'list/list_demo.dart';
import 'normal_page.dart';

void main() {
  runApp(new MaterialApp(
    // 路由管理，指定发送到哪个页面
    routes: <String, WidgetBuilder>{
      '/my_normal_page': (BuildContext context) => MyHomePage(),
      '/routers': (BuildContext context) => RouterDemo(),
      '/listview_samples': (BuildContext context) => ListViewDemos(),
      '/animation_scale': (BuildContext context) => ScaleAnimationRoute(),
      '/animation_widget': (BuildContext context) => AnimatedWidgetsTest(),
      //new ScaleAnimationRoute1(),
    },
    title: 'Flutter控件用法示例大全',
    theme: new ThemeData(
      primarySwatch: Colors.teal,
    ),
    home: new MainActivity(),
  ));
}

class MainActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = <Widget>[
      buildClicks(buildContents('默认页面'), context, '/my_normal_page'),
      buildClicks(buildContents('路由用法Demo'), context, '/routers'),
      buildClicks(
          buildContents('ListView用法Demo'), context, '/listview_samples'),
      buildClicks(buildContents('缩放动画用法Demo'), context, '/animation_scale'),
      buildClicks(buildContents('动画组件用法Demo'), context, '/animation_widget'),
      buildClicks2(
          buildContents('通用“动画切换”组件页面'),
          context,
          Scaffold(
            appBar: new AppBar(
              title: new Text('Animated Switcher'),
            ),
            body: AnimatedSwitcherCounterRoute(),
          )),
//      buildClicks2(buildContents('默认页面'), context, new NormalPage()),
//      buildClicks2(buildContents('路由用法Demo'), context, new RouterDemo()),
    ];

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter控件用法示例大全'),
      ),
      body: new Column(children: widgets),
    );
  }

  Widget buildClicks(Widget child, BuildContext context, String routeStr) {
    return new InkWell(
      child: child,
      onTapDown: (details) {
        showToastBottom('onTapDown');
        // 发送路由消息
        Navigator.pushNamed(context, '$routeStr');
      },
      onTap: () {
        showToastBottom('onTap');
      },
      onLongPress: () {
        showToastBottom('onLongPress');
      },
      onDoubleTap: () {
        showToastBottom('onDoubleTap');
      },
    );
  }

  void showToastBottom(String text) {
    print(text);
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM);
  }

  Widget buildClicks2(Widget child, BuildContext context, Widget page) {
    return new InkWell(
      child: child,
      onTapDown: (details) {
        showToastBottom('onTapDown');
        // 发送路由消息
        Navigator.push(context,
            new MaterialPageRoute(builder: (BuildContext context) => page));
      },
      onTap: () {
        showToastBottom('onTap');
      },
      onLongPress: () {
        showToastBottom('onLongPress');
      },
      onDoubleTap: () {
        showToastBottom('onDoubleTap');
      },
    );
  }

  Widget buildContents(var text) {
    return new Container(
      margin: new EdgeInsets.all(10.0),
      padding: new EdgeInsets.all(10.0),
      alignment: Alignment.center,
      constraints: new BoxConstraints.expand(height: 56.0),
      decoration: new BoxDecoration(
        color: Colors.teal[300],
        borderRadius: new BorderRadius.all(
          //让矩形四个角都变成圆角
          const Radius.circular(8.0),
        ),
        // 阴影
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.teal[100],
            offset: new Offset(0.0, 5.0),
            blurRadius: 8.0,
          ),
          new BoxShadow(
            color: Colors.grey,
            offset: new Offset(0.0, 6.0),
            blurRadius: 8.0,
          ),
        ],
      ),
      child: buildButton(text),
    );
  }

  Widget buildButton(var text) {
    return new Text(
      text,
      style: new TextStyle(
        color: Colors.white,
        fontSize: 16.0,
      ),
    );
  }
}
