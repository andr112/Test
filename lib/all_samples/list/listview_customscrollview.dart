import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
      title: 'CustomScrollView创建一个列表',
      theme: new ThemeData(
        primarySwatch: Colors.blue, //设置全局主题
      ),
      home: new ListViewCustomScrollViewDemo(),
    ),
  );
}

class ListViewCustomScrollViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              // 返回上一个页面
              Navigator.of(context).pop();
            }),
        title: new Text(
          'CustomScrollView创建一个列表',
          style: new TextStyle(fontSize: 17.0),
        ),
      ),
      body: new GestureDetector(
          onTap: () {
            print('点击了item！');
          },
          child: buildListItem()),
    );
  }

  // 使用CustomScrollView创建一个列表
  Widget buildListItem() {
    return new CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        new SliverPadding(
          padding: const EdgeInsets.all(20.0),
          sliver:  new SliverGrid(
            //Grid
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, //Grid按两列显示
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: new SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                //创建子widget
                return new Container(
                  alignment: Alignment.center,
                  color: Colors.cyan[100 * (index % 9)],
                  child: new Text('grid item $index'),
                );
              },
              childCount: 40,
            ),
          ),
        ),
        new SliverFixedExtentList(
          itemExtent: 50.0,
          delegate: new SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                //创建列表项
                return new Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: new Text('list item $index'),
                );
              }, childCount: 50 //50个列表项
          ),
        ),],
    );
  }
}

Widget buildContents(var text) {
  return new Container(
    alignment: Alignment.centerLeft,
    constraints: new BoxConstraints.expand(height: 56.0),
    child: new Text(text),
  );
}
