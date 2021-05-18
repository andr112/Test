import 'package:flutter/material.dart';
import 'package:flutter_demo/all_samples/paint/custom_paint.dart';
import 'package:flutter_demo/all_samples/router/router_easy_sample/router_demo.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'animation/animated_widgets.dart';
import 'animation/animated_switcher.dart';
import 'animation/animation_scale.dart';
import 'animation/animation_turnbox.dart';
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
      '/AnimatedWidgets': (BuildContext context) => AnimatedWidgetsTest(),
      '/animation_widget': (BuildContext context) => ScaleAnimationRoute1(),
    },
    title: 'Flutter控件用法示例大全',
    theme: ThemeData(
      primarySwatch: Colors.teal,
    ),
    home: MainActivity(),
  ));
}

class MainActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = <Widget>[
      buildClicks(context, buildContents('默认页面'), '/my_normal_page'),
      buildClicks(context, buildContents('路由用法Demo'), '/routers'),
      buildClicks(
          context, buildContents('ListView用法Demo'), '/listview_samples'),
      buildClicks(context, buildContents('缩放动画用法Demo'), '/animation_scale'),
      buildClicks(context, buildContents('动画组件用法Demo'), '/animation_widget'),
      buildClicks2(context, '通用“动画切换”组件页面', AnimatedSwitcherCounterRoute()),
      buildClicks2(context, '自定义组件_旋转', TurnBoxRoute()),
      buildClicks2(context, '自绘棋盘', CustomPaintRoute()),
    ];

    return page('Flutter控件用法示例大全',  SingleChildScrollView(child: new Column(children: widgets)),);
  }

  Widget page(String title, Widget body) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: body,
    );
  }

  Widget buildClicks(BuildContext context, Widget child, String routeStr) {
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

  Widget buildClicks2(BuildContext context, String text, Widget body) {
    Widget child = buildContents(text);
    return new InkWell(
      child: child,
      onTapDown: (details) {
        showToastBottom('onTapDown');
        // 发送路由消息
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (BuildContext context) => page(text, body)));
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
