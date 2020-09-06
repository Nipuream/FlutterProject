import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// 手势检测与处理
///

void main(){
  runApp(new MaterialApp(
    title: '按下处理demo',
//    home: GestureDetectApp(),
    home: new DismissibleApp(),
  ));
}


class GestureDetectApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('按下处理Demo'),
      ),
      body: new Center(child: GestureDetectDemo()),
    );
  }
}

class GestureDetectDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //一定要把被触摸的组件放在GestureDetector 里面

    return new GestureDetector(
        onTap: (){
          //底部消息显示
          final snackBar = new SnackBar(content: Text('你已按下'));
          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: new Container(
          padding: new EdgeInsets.all(12.0),
          decoration: new BoxDecoration(
            color: Theme.of(context).buttonColor,
            borderRadius: new BorderRadius.circular(10.0),
          ),
          child: new Text('测试按钮'),
        ),
      );
  }
}

///
/// Dismissible 实现滑动删除
///

class DismissibleApp extends StatelessWidget {

  //构建30条列表数据
  List<String> items = new List<String>.generate(30, (index) => "列表项 ${ index + 1}");

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('滑动删除示例'),
      ),
      //构建列表
      body: new ListView.builder(
          itemCount: items.length, //指定列表长度
          itemBuilder: (context, index){ //构建列表

            //提取被删除的项
            final item = items[index];

            //返回一个可以被删除的列表项
            return new Dismissible(
                key: new Key(item),
              //被删除回调
              onDismissed: (direction){
                  //移除指定索引项
                items.removeAt(index);
                //底部弹出消息提示当前项被删除了
                Scaffold.of(context).showSnackBar(
                  new SnackBar(content: new Text('$item 被删除了'))
                );
              },
              child: new ListTile(title: new Text('$item'),),
            );
          },
      ),
    );
  }

}


