import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// 本demo 来源于： https://blog.csdn.net/column/details/13593.html?&page=4
/// 事件的操作，另外这里引入了toast库
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: MyGestureDetector(),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

/// 手势操作
class MyGestureDetector extends StatefulWidget {
  @override
  _MyGestureDetectorState createState() {
    return _MyGestureDetectorState();
  }
}

class _MyGestureDetectorState extends State<MyGestureDetector> {
  double top = 10;
  double left = 10;
  double width = 200;

  @override
  Widget build(BuildContext context) {
    print('left:$left, top:$top');
    MediaQuery.of(context);
    return Stack(children: <Widget>[
      Container(
        width: double.infinity,
        height: double.infinity,
      ),
      Positioned(
        left: left,
        top: top,
        child: GestureDetector(
          onPanDown: (DragDownDetails e) {
            //打印手指按下的位置
            print("手指按下：${e.globalPosition}");
          },
          //手指滑动
          onPanUpdate: (DragUpdateDetails e) {
            setState(() {
              left += e.delta.dx;
              top += e.delta.dy;
              if (left < 0) left = 0;
              if (top < 0) top = 0;
            });
          },
          onPanEnd: (DragEndDetails e) {
            //打印滑动结束时在x、y轴上的速度
            print(e.velocity);
          },

          child: Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(36)),
          ),
        ),
      ),
      Center(
        child: GestureDetector(
          child: Container(
            //使用OverflowBox可以让子组件宽高超过父组件
            child: OverflowBox(
              maxWidth: 2000.0,
              child: Image.asset('images/img.jpg', width: width),
            ),
          ),
          onScaleUpdate: (ScaleUpdateDetails e) {
            setState(() {
              //缩放倍数在0.8到10倍之间
              width = 200 * e.scale.clamp(0.8, 10);
            });
          },
        ),
      )
    ]);
  }
}
