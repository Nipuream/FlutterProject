import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:url_launcher/url_launcher.dart';
import 'layout.dart';


void main() {

  runApp(LayoutDemoApp());
//  runApp(MyMaterialApp());
//  runApp(LongItemListDemo(
//    items: new List<String>.generate(500, (index) => "Item $index"),
//  ));

//  runApp(PluginApp());
//    runApp(NetTest());
//testException();
}


//test launcher.dart.
class LauncherApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "使用url_launcher.dart",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("使用url_launcher.dart"),
        ),
        body: new Center(
          child: new RaisedButton(
              onPressed: (){
                const url = "https://www.baidu.com";
                launch(url);
              },
            child: new Text("打开百度"),
          ),
        ),
      ),
    );
  }

}


class CustomApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final appName = "自定义主题";

    return new MaterialApp(
      title: appName,
      theme: new ThemeData(
        brightness: Brightness.light, //应用程序整体主题亮度
        primaryColor: Colors.lightGreen[600], //APP主要部分的背景色
        accentColor: Colors.orange[600], //前景色(文本、按钮)
      ),
//      home: new MyCustomAppPage(
//        title: appName,
//      ),
      home: new MyCustomChangePage(
        title: appName,
      ),
    );
  }
}

class MyCustomAppPage extends StatelessWidget {

  final String title;

  MyCustomAppPage({Key key, @required this.title}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text((title)),
      ),
      body: new Center(
        child: new Container(
          //获取主题的accentColor
          color: Theme.of(context).accentColor,
          child: new Text(
            '带有背景颜色的文本组件',
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
      floatingActionButton: new Theme(
        //使用copywith 方式获取 accentColor.
        data: Theme.of(context).copyWith(accentColor: Colors.blueAccent),
        child: new FloatingActionButton(
          onPressed: null,
          child: new Icon(Icons.computer),
        ),
      ),
    );
  }
}

class MyCustomChangePage extends StatefulWidget {

  MyCustomChangePage({Key key, this.title}) : super(key:key);
  //标题
  final String title;

  /**
   * 创建状态
   */
  @override
  MyCustomState createState() => new MyCustomState();

}


//创建状态类，后面要指定 page.
class MyCustomState extends State<MyCustomChangePage> {

  int _couter = 0;

  void_incrementCounter(){
    setState(() {
      _couter ++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(

      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      //居中布局
      body: new Center(
        //垂直布局
        child: new Column(
          //主轴居中对齐
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_couter', //绑定计数器的值
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: void_incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }

}





//=================================== 废除 ==================



//StatelessWidget 不可切换状态的部件
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
//    final wordPair = new WordPair.random();
    return MaterialApp(
        title: 'Flutter Demo',
        //应用主题
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
          //前景色
          accentColor: Colors.cyan,
        ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
        home: new Scaffold (
          appBar: new AppBar(
            title: new Text("Welcome to Flutter"),
          ),
          body: new Center(
//        child: new Text("Hello World!"),
//      child: new Text(wordPair.asPascalCase),
            child: new RandomWords(),
          ),
        )

    );
  }
}



//StatefulWidget 有状态的部件
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class RandomWords extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
//    throw UnimplementedError();
    return RandomWordsState();
  }

}

class RandomWordsState extends State<RandomWords> {

  //保存建议的单词对
  final _suggestions = <WordPair>[];
  //控制字体大小
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    throw UnimplementedError();
    final wordPair = new WordPair.random();
    return new Text(wordPair.asPascalCase);
  }

  Widget _buildSuggestions(){
    return new ListView.builder(padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i){

        });
  }


}

