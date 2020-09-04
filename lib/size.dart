import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
///
/// 宽高尺寸处理
///
///
///
///

void main(){
  runApp(SizeDemo());
}

class SizeDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(

      title: 'sizeDemo 实例',
//      home: new LayoutDemo(),
//      home: new ConstrainedBoxDemo(),
//    home: LimitedBoxDemo(),
//    home: AspectRatioDemo(),
//      home: FractionallySizedBoxDemo(),
//      home: ListViewDemo(),
//      home: GridViewDemo(),
      home: TableDemo(),

    );
  }
}


/**
 * SizedBox 设置具体尺寸
 * 这个组件强制它的child有特定的高度和宽度
 */
class LayoutDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(

      appBar: new AppBar(
        title: Text('SizedBox 设置具体宽高'),
      ),
      body: SizedBox(
        //固定宽高 200.0,高为300.0
        width: 200.0,
        height: 300.0,
        child: const Card(
          color: Colors.red,
          child: Text('SizedBox',
            style: TextStyle(
              fontSize: 36.0,
            ),
          ),
        ),
      ),
    );
  }
}

///
/// 限定最大最小宽高布局
///
class ConstrainedBoxDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('ConstrainedBox 限定宽高示例'),
      ),
      body: new ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 150.0,
          minHeight: 150.0,
          maxWidth: 220.0,
          maxHeight: 220.0,
        ),
        child: new Container(
          width: 350.0,
          height: 350.0,
          color: Colors.green,
        ),
      ),
    );
  }
}


///
/// LimitedBox 限定最大宽高布局
///

class LimitedBoxDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('LimitedBox 限定宽高布局示例'),
      ),
      body: Row(
        children: <Widget>[
          Container(
            color: Colors.grey,
            width: 100.0,
          ),
          LimitedBox(
            maxWidth: 150.0, //设置最大宽度，限定child在此范围
            child: Container(
              color: Colors.lightGreen,
              width: 250.0,
            ),
          ),
        ],
      ),
    );
  }
}

///
/// 可以调整宽高比
///
class AspectRatioDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: Text('AspectRatio 调整宽高比示例'),
      ),
      body: new Container(
        height: 200.0,
        child: new AspectRatio(
          aspectRatio: 1.5, //比例可以调整
          child: new Container(
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}

///
/// 百分比布局
///

class FractionallySizedBoxDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('FractionallySizeBox 百分比布局示例'),
      ),
      body: new Container(
        color: Colors.blueGrey,
        height: 200.0,
        width: 200.0,
        child: new FractionallySizedBox(
          alignment: Alignment.topLeft, //元素左上角对齐
          widthFactor: 0.5, //宽度因子
          heightFactor: 1.5, //高度因子
          child: new Container(
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}

///
/// ListView demo.
///
class ListViewDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    List<Widget> list = <Widget> [
      new ListTile(
        title: Text('广州市黄埔大道建中路店', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0)),
        subtitle: Text('广州市黄埔大道建中路3号'),
        leading: new Icon(
          Icons.fastfood,
          color: Colors.orange,
        ),
      ),
      new ListTile(
        title: new Text('广州市白云区机场路白云机场店', style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18.0),),
        subtitle: Text('广州市白云区机场路T3航站楼'),
        leading: new Icon(
          Icons.airplay,
          color: Colors.blue,
        ),
      ),
      new ListTile(
        title: Text('广州市中山大道中山大学附属医院', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0),),
        subtitle: Text('广州市中山大道45号'),
        leading: new Icon(
          Icons.local_hospital,
          color: Colors.green,
        ),
      ),
      new ListTile(
        title: Text('广州市天河区太平洋数码城', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0),),
        subtitle: Text('广州市天河区岗顶太平洋数码城'),
        leading: new Icon(
          Icons.computer,
          color: Colors.deepPurple,
        ),
      ),
    ];

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ListView 布局示例'),
      ),
      body: new Center(
        child: new ListView(
          children: list,
        ),
      ),
    );
  }
}


///
/// GridView
///
class GridViewDemo extends StatelessWidget{

  //使用generate构造图片列表
  List<Container> _buildGridTitleList(int count) {
    return new List<Container>.generate(count, (index) => new Container(
      child: new Image.asset('images/${index + 1}.jpg'),
    ));
  }

  //渲染 GridView
  Widget buildGrid(){

    return new GridView.extent(
      maxCrossAxisExtent: 150.0, //次轴的宽度
      padding: const EdgeInsets.all(4.0), //上下左右内边距
      mainAxisSpacing: 4.0, //主轴间隙
      crossAxisSpacing: 4.0, //次轴间隙
      children: _buildGridTitleList(3),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: new AppBar(
        title: Text('GridView九宫格示例'),
      ),
      body: new Center(
        child: buildGrid(),
      ),
    );
  }
}

///
/// Table
///
class TableDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Table表格布局示例'),
      ),
      body: new Center(
        child: Table(
          //设置表格有多少列，并且指定列宽
          columnWidths: const <int, TableColumnWidth>{
            0: FixedColumnWidth(100.0),
            1: FixedColumnWidth(40.0),
            2: FixedColumnWidth(80.0),
            3: FixedColumnWidth(80.0),
          },
          //设置表格边框样式
          border: TableBorder.all(color: Colors.black38, width: 2.0, style: BorderStyle.solid),
          children: const <TableRow>[
            //添加第一行数据
            TableRow(
              children: <Widget>[
                Text('姓名'),
                Text('性别'),
                Text('年龄'),
                Text('身高'),
              ],
            ),
            //添加第二行数据
            TableRow(
              children: <Widget>[
                Text('张三'),
                Text('男'),
                Text('26'),
                Text('172'),
              ],
            ),
            //添加第三行数据
            TableRow(
              children: <Widget>[
                Text('李四'),
                Text('男'),
                Text('28'),
                Text('178'),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
}

