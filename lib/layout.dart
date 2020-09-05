

import 'package:flutter/material.dart';


void main(){
  runApp(LayoutDemoApp());
}


class LayoutDemoApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Container 布局容器示例',
//      home: new LayoutDemo(),
//      home: new CenterLayoutDemo(),
//        home: new PaddingLayoutDemo(),
//        home: new AlignLayoutDemo(),
//        home: new RowLayoutDemo(),
//        home: new ColumnLayoutDemo(),
//       home: new FittedBoxLayoutDemo(),
//         home: new StackPosition(),
//          home: new IndexStackLayoutDemo(),
//        home: OverflowBoxLayoutDemo(),
//         home: TransformLayoutDemo(),
//          home: BaselineDemoLayout(),
//         home: OffStageLayoutDemo(title: '控制隐藏还是显示',),
          home: WrapDemo(),
    );
  }
}

///
/// Container 布局容器
///
class LayoutDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //返回一个container对象
    Widget container = new Container(
      //添加装饰效果
      decoration: new BoxDecoration(
        color: Colors.grey,
      ),
      //子元素指定为一个垂直水平嵌套布局的组件
      child: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              //使用Expanded防止内容溢出
              new Expanded(
                child: new Container(
                  width: 150.0,
                  height: 150.0,
                  //添加边框样式
                  decoration: new BoxDecoration(
                    //上下左右边框设置为宽度10.0，颜色为灰蓝色
                    border: new Border.all(width: 10.0, color: Colors.blueGrey),
                    //上下左右边框弧度设置为8.0
                    borderRadius: 
                      const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  //上下左右增加边距
                  margin: const EdgeInsets.all(4.0),
                  //添加图片
                  child: new Image.asset('images/1.jpg'),
                ),
              ),
              new Expanded(
                child: new Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: new BoxDecoration(
                    border: new Border.all(width: 10.0, color: Colors.blueGrey),
                    borderRadius:
                      const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: new Image.asset('images/2.jpg'),
                ),
              ),
            ],
          ),
          new Row(
            children: <Widget>[
              new Expanded(
                child: new Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: new BoxDecoration(
                    border: new Border.all(width: 10.0, color: Colors.blueGrey),
                    borderRadius: 
                      const BorderRadius.all(const Radius.circular(8.0))
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: new Image.asset('images/3.jpg'),
                ),
              ),
              new Expanded(
                child: new Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: new BoxDecoration(
                    border: new Border.all(width: 10.0, color: Colors.blueGrey),
                    borderRadius: 
                      const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: new Image.asset('images/2.jpg'),
                ),
              ),
            ],
          ),
        ],
      ),
    );


    return new Scaffold(
      appBar: new AppBar(
        title: Text('Container布局容器示例'),
      ),
      body: container,
    );
  }
}

///
/// 居中布局， 子元素处于水平和垂直方向的中间位置
///
class CenterLayoutDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: Text('Center 居中布局实例'),
      ),
      body: new Center(
        child: new Text(
          'Hello Flutter',
          style: TextStyle(
            fontSize: 36.0,
          ),
        ),
      ),
    );
  }
}

///
/// Padding 填充布局
///
class PaddingLayoutDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Padding 填充布局示例'),
      ),
      body: new Center(
        child: new Container(
          width: 300.0,
          height: 300.0,
          padding: EdgeInsets.all(60.0), //容器上下左右填充设置为 60.0
          decoration: new BoxDecoration(
            color: Colors.white,
            border: new Border.all(
              color: Colors.green,
              width: 8.0,
            ),
          ),
          child: new Container(
            width: 200.0,
            height: 200.0,
            decoration: new BoxDecoration(
              color: Colors.white,
              border: new Border.all(
                color: Colors.blue,
                width: 8.0,
              ),
            ),
            child: new FlutterLogo(),
          ),
        ),
      ),
    );
  }
}

///
/// 对齐布局
///
class AlignLayoutDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Align 对齐布局示例'),
      ),
      body: new Stack(
        children: <Widget>[
          //左上角
          new Align(
            //alignment不定位组件
            alignment: new FractionalOffset(0.0, 0.0),
            child: new Image.asset('images/1.jpg',width: 128.0,height: 128.0,),
          ),
          //右上角
          new Align(
            alignment: FractionalOffset(1.0, 0.0),
            child: new Image.asset('images/2.jpg', width: 128.0, height: 128.0,),
          ),
          //水平垂直方向居中
          new Align(
            alignment: FractionalOffset.center,
            child: new Image.asset('images/3.jpg', width: 128.0, height: 128.0,),
          ),
          //左下角
          new Align(
            alignment: FractionalOffset.bottomLeft,
            child: new Image.asset('images/1.jpg', width: 128.0, height: 128.0,),
          ),
          //右下角
          new Align(
             alignment: FractionalOffset.bottomRight,
             child: new Image.asset('images/2.jpg', width: 128.0, height: 128.0,),
          ),
        ],
      ),
    );
  }
}

///
/// 水平布局
///
class RowLayoutDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: Text('水平布局示例'),
      ),
      body: new Row(
        children: <Widget>[
          new Expanded(
              child: new Text('左侧文本', textAlign: TextAlign.center,)
          ),
          new Expanded(
            child: new Text('中间文本', textAlign: TextAlign.center,),
          ),
          new Expanded(
              child: new FittedBox(
                fit: BoxFit.contain,
                child: const FlutterLogo(),
              ),
          ),
        ],
      ),
    );
  }
}

///
/// 垂直布局
///
class ColumnLayoutDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('垂直布局示例一'),
      ),
      body: new Column(
        //水平方向靠左对齐
        crossAxisAlignment: CrossAxisAlignment.start,
        //主轴方向最小化处理
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Text('Flutter'),
          new Text('垂直布局'),
          new Expanded(
            child: new FittedBox(
              fit: BoxFit.contain,
              child: const FlutterLogo(),
            ),
          ),
        ],
      ),
    );
  }
}

///
/// 缩放布局
///
class FittedBoxLayoutDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     return new Scaffold(
       appBar: new AppBar(
         title: Text('FittedBox 缩放布局示例'),
       ),
       body: new Container(
         color: Colors.grey,
         width: 250.0,
         height: 250.0,
         child: new FittedBox(
           fit: BoxFit.contain, //改变填充属性会得到不同的效果
           alignment: Alignment.topLeft,
           child: new Container(
             color: Colors.deepOrange,
             child: Text('缩放布局'),
           ),
         ),
       ),
     );
  }
}

///
/// stack position组件
///
class StackPosition extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('层叠定位布局示例'),
      ),
      body: new Center(
        child: new Stack(
          children: <Widget>[
            new Align(
                alignment: FractionalOffset.center,
                child: new Image.asset('images/1.jpg'),
              ),
            //设置定位布局
            new Positioned(
              bottom: 50.0,
              right: 50.0,
              child: new Text(
                'hi flutter',
                style: new TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'serif',
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///
/// 继承自 stack，作用是显示第 index 个child.
///
class IndexStackLayoutDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //container 提供布局，并对布局背景和边角提供了处理
    //stack 中 children 可以存放很多child.
    var stack = new IndexedStack(
      index: 1,
      alignment: const FractionalOffset(0.2, 0.2),
      children: <Widget>[
        new CircleAvatar(
          backgroundImage: new AssetImage('images/1.jpg'),
          radius: 100.0,
        ),
        new Container(
          decoration: new BoxDecoration(
            color: Colors.black38,
          ),
          child: new Text(
            '我是超级飞侠',
            style: new TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );

    return new Scaffold(
      appBar: new AppBar(
        title: Text('Stack 层叠布局示例'),
      ),
      body: new Center(
        child: stack,
      ),
    );
  }
}

///
/// 可以超出父布局显示范围之外
///
class OverflowBoxLayoutDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('OverflowBox 溢出父容器显示示例'),
      ),
      body: Container(
        color: Colors.green,
        width: 200.0,
        height: 200.0,
        padding: const EdgeInsets.all(5.0),
        child: OverflowBox(
          alignment: Alignment.topLeft,
          maxWidth: 300.0,
          maxHeight: 500.0,
          child: Container(
            color: Colors.blueGrey,
            width: 400.0,
            height: 400.0,
          ),
        ),
      ),
    );
  }
}


///
/// 矩阵变化
///
class TransformLayoutDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: Text("Transform 矩阵转换示例"),
      ),
      body: new Center(
        child: Container(
          color: Colors.grey,
          child: Transform(
            alignment: Alignment.topRight,  //对齐方式
            transform: Matrix4.rotationZ(0.3), //四维变化
            child: Container(
              padding: const EdgeInsets.all(8.0),
              color: const Color(0xFFE8581C),
              child: const Text('Transform 矩阵转换'),
            ),
          ),
        ),
      ),
    );
  }
}

///
///  Baseline (基准线布局)
///
class BaselineDemoLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: Text('Baseline 基准线布局示例'),
      ),
      body: new Row(
        //水平等间距排列子组件
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //设置基准线
          new Baseline(
              baseline: 80.0,
              //对齐字符底部水平线
              baselineType: TextBaseline.alphabetic,
              child: new Text(
                'AaBbCc',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
          ),
          new Baseline(
            baseline: 80.0,
            baselineType: TextBaseline.alphabetic,
            child: new Container(
              width: 40.0,
              height: 40.0,
              color: Colors.green,
            ),
          ),
          new Baseline(
            baseline: 80.0,
            baselineType: TextBaseline.alphabetic,
            child: Text(
              'DdEeFf',
              style: TextStyle(
                fontSize: 26.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


///
/// Offstage 控制是否显示组件
///
class OffStageLayoutDemo extends StatefulWidget {

  final String title;

  OffStageLayoutDemo({Key key,this.title}):super(key:key);

  @override
  State<StatefulWidget> createState() {
    return _MyOffState();
  }
}

class _MyOffState extends State<OffStageLayoutDemo> {

  //状态控制是否显示文本组件
  bool offstate = true;

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Center(
        child: new Offstage(
          offstage: offstate, //控制是否显示
          child: new Text(
            '我出来了',
            style: TextStyle(
              fontSize: 36.0,
            ),
          ),
        ),
      ),

      floatingActionButton: new FloatingActionButton(
          onPressed: (){
            setState(() {
              offstate = !offstate;
            });
          },
        tooltip: '显示隐藏',
        child: new Icon(Icons.flip),
      ),
    );
  }
}

///
/// Wrap 按宽高自动换布局
///

class WrapDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: Text('Wrap按宽高自动换行布局'),
      ),
      body: Wrap(
        spacing: 8.0, //Chip 之间的间隙大小
        runSpacing: 4.0, //行之间的间隙大小
        children: <Widget>[
          Chip(
            //添加圆形头像
            avatar: CircleAvatar(
              backgroundColor: Colors.lightGreen.shade800,
              child: Text('西门', style: TextStyle(fontSize: 10.0)),
            ),
            label: Text('西门吹雪'),
          ),
          Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.lightBlue.shade700,
              child: Text('司空', style: TextStyle(fontSize: 10.0),),
            ),
            label: Text('司空摘星'),
          ),
          Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.orange.shade800,
              child: Text('婉清', style: TextStyle(fontSize: 10.0),),
            ),
            label: Text('木婉清'),
          ),
          Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900,
              child: Text('一郎',style: TextStyle(fontSize: 10.0),),
            ),
            label: Text('萧十一郎'),
          ),
        ],
      ),
    );
  }

}



