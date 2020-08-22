import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// 常量组件的学习
///


/**
 *  Container 包含一个子Widget，自身具备如 alignment, padding等基础属性
 */
class ContainerDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: '容器组示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('容器组件示例'),
        ),
        body: Center(
          //添加容器
          child: Container(
            width: 200.0,
            height: 200.0,
            //添加边框装饰效果
            decoration: BoxDecoration(
              color: Colors.white,
              //设置上下左右四个边框样式
              border: new Border.all(
                color: Colors.grey, //边框颜色
                width: 8.0, //边框粗细
              ),
              borderRadius: const BorderRadius.all(const Radius.circular(8.0)), //边框弧度

            ),
            child: Text(
              'Flutter',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28.0),
            ),
          ),
        ),
      ),
    );
  }
}

class ImageDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Image.network("https://flutter.io/images/flutter-mark-square-100.png",
          fit: BoxFit.fitWidth),
    );
  }

}

class TextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  new MaterialApp(
      title: 'Text demo',
      home:       new Scaffold(
        appBar: new AppBar(
          title: new Text('文本组件'),
        ),
        body: new Column(
          children: <Widget>[
            Text('红色 + 黑色删除线 + 25号',
              style: TextStyle(
                  color: const Color(0xffff000),
                  decoration: TextDecoration.lineThrough,
                  decorationColor: const Color(0xff0000),
                  fontSize: 25.0
              ),
            ),
            Text(
              '橙色 + 下划线 + 24号',
              style: new TextStyle(
                color: const Color(0xffff9900),
                decoration: TextDecoration.underline,
                fontSize: 24.0,
              ),
            ),
            Text(
              '虚线上划线 + 23号 + 倾斜',
              style: new TextStyle(
                decoration: TextDecoration.overline,
                decorationStyle: TextDecorationStyle.dashed,
                fontSize: 23.0,
                fontStyle: FontStyle.italic,
              ),
            ),
            Text(
              '24号 + 加粗',
              style: new TextStyle(
                fontSize: 23.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                letterSpacing: 6.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/**
 * 这种icon 是没有触摸事件的
 */
class IconDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '图标组件示例',
      home: new Scaffold(
        appBar: new AppBar(
          title: Text('icon demo'),
        ),
        body: new Icon(Icons.phone,color: Colors.green[500],size: 80.0,),
      ),
    );
  }
}

/**
 * 可触发 pressed 事件的 image icon.
 */
class IconButtonApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'ImageButton demo',
      home: new Scaffold(

        appBar: new AppBar(
          title: Text('ImageButton demo'),
        ),
        body: new Center(
          child: new IconButton(
            icon: Icon(Icons.volume_up,size: 48.0,),
            tooltip: '按下操作',
            onPressed: (){
              print('按下操作');
            },
          ),
        ),
      ),
    );
  }
}


class RaisedButtonDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'RaisedButton 示例',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('RaisedButton demo'),
        ),
        body: new Center(
          child: new RaisedButton(
            onPressed: (){
              print("Raised button pressed.");
            },
            child: new Text('RaisedButton组件'),
          ),
        ),
      ),
    );
  }
}


/**
 * 基础列表组件
 */
class ListViewDemo extends StatelessWidget {

  final String title = "基础列表示例子";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: new ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.alarm),
              title: Text('Alarm'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
            ),
            ListTile(
              leading: Icon(Icons.airplay),
              title: Text('Airplay'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
            )
          ],
        ),
      ),
    );
  }
}

class HorienListView extends StatelessWidget {

  final String title = "水平列表示例";

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: AppBar(
          title: new Text(title),
        ),
        body: new Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: 200.0,
          child: ListView(
            //设置水平方向排列
            scrollDirection: Axis.horizontal,
            //添加子元素
            children: <Widget>[

              Container(
                width: 160.0,
                color: Colors.lightBlue,
              ),
              Container(
                width: 160.0,
                color: Colors.amber,
              ),
              Container(
                width: 160.0,
                color: Colors.green,
                child: Column(
                  children: <Widget>[
                    Text(
                      '水平',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 36.0
                      ),
                    ),
                    Text(
                      '列表',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 36.0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 160.0,
                color: Colors.deepOrangeAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


/**
 * 大量数据 列表
 */
class LongItemListDemo extends StatelessWidget {

  final String title = "长列表示例";
  final List<String> items;

  LongItemListDemo({Key key, @required this.items}) : super(key : key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        //使用ListView.builder来构造列表项
        body: new ListView.builder(
          //列表长度
          itemCount: items.length,
          itemBuilder: (context, index){
            return new ListTile(
              leading: new Icon(Icons.phone),
              title: new Text('${items[index]}'),
            );
          },
        ),
      ),
    );
  }
}


class GridViewDemo extends StatelessWidget {

  final String title = "网格列表示例";

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: Text(title),
        ),
        //使用GridView.count 构建网格
        body: new GridView.count(
          primary: false,
          //四周加一定的空隙
          padding: const EdgeInsets.all(20.0),
          crossAxisSpacing: 30.0,
          //数据项，无行三列
          crossAxisCount: 3,
          children: <Widget> [
            const Text(' 第一行 第一列 '),
            const Text('第一行 第二列 '),
            const Text('第一行 第三列 '),
            const Text('第二行 第一列'),
            const Text('第二行 第二列'),
            const Text('第二行 第二列')
          ],
        ),
      ),
    );
  }
}


class LoginPageDemo extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new LoginPageState();
  }
}

class LoginPageState extends State<LoginPageDemo> {

  GlobalKey<FormState> loginKey = new GlobalKey<FormState>();

  String userName;
  String password;

  void login(){
    //获取当前 form 状态
    var loginForm = loginKey.currentState;

    //验证form表单
    if(loginForm.validate()){
      loginForm.save();
      print('userName : '+ userName + ', password : '+ password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Form 表单示例',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Form 表单示例'),
        ),
        body: new Column(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.all(16.0),
              child: new Form(
                  key: loginKey,
                  child: new Column(
                    children: <Widget>[
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: '请输入用户名',
                        ),
                        onSaved: (value) {
                          userName = value;
                        },
                        onFieldSubmitted: (value){
                        },
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: '请输入密码',
                        ),
                        obscureText: true,
                        validator: (value){
                          return value.length < 6 ? '密码长度不够6位' : null;
                        },
                        onSaved: (value){
                          password = value;
                        },
                      ),
                    ],
                  ),
              ),
            ),
            new SizedBox(
              width: 340.0,
              height: 42.0,
              child: new RaisedButton(
                  onPressed: login,
                child: new Text(
                  '登录',
                  style: TextStyle(
                    fontSize: 18.0
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}



