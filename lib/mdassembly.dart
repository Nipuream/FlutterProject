import 'package:flutter/material.dart';

class MyMaterialApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      //自定义主题
      theme: new ThemeData(
        //主题色
        primaryColor: Colors.deepOrange,
      ),
//      home: new MyHomePage(),
//      home: new LayoutDemo(),
//      home: new MyBottomNagavitaionBarPage(),
//      home: new DefaultTabControllerSample(),
        home: new DrawerDemo(),
      title: 'MaterialApp示例',
      routes: {
        '/first' : (BuildContext context) => FirstPage(),
        '/second': (BuildContext context) => SecondPage(),
      },
      initialRoute: '/first', //初始化路由页面为 first 页面
    );
  }
}

//这是一个可改变的Widget
class MyHomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: Text('MaterialApp 示例'),
      ),
      body: Center(
        child: Text('主页'),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //手脚架组件
    return new Scaffold(
      appBar: new AppBar(
        title: Text('这是第一页'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: (){
            //路由跳转到第二个页面
            Navigator.pushNamed(context, '/second');
          },
          child: Text(
            '这是第一页',
            style: TextStyle(fontSize: 28.0),
          ),
        ),
      ),
      //底部导航栏
      bottomNavigationBar: BottomAppBar(
        child: Container(height: 50.0),
      ),
      //添加FAB按钮
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: '增加',
        child: Icon(Icons.add),
      ),
      //FAB按钮居中展示
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('这是第二页'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: (){
            //路由跳转到第一页面
            Navigator.pushNamed(context, "/first");
          },
          child: Text(
            '这是第二页',
            style: TextStyle(fontSize: 28.0),
          ),
        ),
      ),
    );
  }
}


//AppBar 可以显示顶部leading, title actions等内容
class LayoutDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: Text('AppBar 应用按钮示例'),
        actions: <Widget>[
          IconButton(

            icon: Icon(Icons.search),
            tooltip: '搜索',
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.add),
            tooltip: '添加',
            onPressed: (){},
          ),
        ],
      ),
    );
  }
}


class MyBottomNagavitaionBarPage extends StatefulWidget {

  MyBottomNagavitaionBarPage({Key key}) : super(key : key);

  @override
  State<StatefulWidget> createState() {
    return new MyBottomNagavitionBarState();
  }

}

class MyBottomNagavitionBarState extends State<MyBottomNagavitaionBarPage> {

  int _selectedIndex = 1; //当前选中项的索引

  final _widgetOptions = [
    Text('Index 0: 信息'),
    Text('Index 1: 通讯录'),
    Text('Index 2: 发现'),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('BottomNavigationBar 示例'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex), //居中显示一个文本
      ),
      //底部导航按钮 包含图标及文本
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text('信息')),
          BottomNavigationBarItem(icon: Icon(Icons.contacts),title: Text('通讯录')),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text('发现'))
        ],
        currentIndex: _selectedIndex, //当前选中项的索引
        fixedColor: Colors.deepPurple, //选项中项的颜色
        onTap: _onItemTapped, //选择按下处理
      ),
    );
  }

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
}


class DefaultTabControllerSample extends StatelessWidget {

  final List<Tab> myTabs = <Tab>[
    Tab(text: '选项卡一',),
    Tab(text: '选项卡二',),
  ];

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      //用来组装TabBar及TabBarView
      home: DefaultTabController(
        length: myTabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text('ToolBar'),
            //添加导航栏
            bottom: TabBar(
              tabs: myTabs,
            ),
          ),
          //添加导航视图
          body: TabBarView(
            children: myTabs.map((Tab tab){
              return Center(child: Text(tab.text));
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class DrawerDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Drawer抽屉组件示例'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            //设置用户信息、头像、用户名、email等
            UserAccountsDrawerHeader(
              accountName: Text(
                "杨辉"
              ),
              accountEmail: Text(
                "nipuream@163.com"
              ),
              //设置当前用户头像
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new AssetImage("images/1.jpeg"),
              ),
              onDetailsPressed: (){},
              //属性本来就是用来设置当前用户的其他账号的头像，这里用来当QQ二维码图片展示
              otherAccountsPictures: <Widget>[
                new Container(
                  
                  child: Image.asset("images/code.jpeg"),
                ),
              ],
            ),
            ListTile(
              leading: new CircleAvatar(child: Icon(Icons.color_lens)),//导航栏菜单
              title: Text('个性装扮'),
            ),
            ListTile(
              leading: new CircleAvatar(child: Icon(Icons.photo)),
              title: Text('我的相册'),
            ),
            ListTile(
              leading: new CircleAvatar(child: Icon(Icons.wifi)),
              title: Text('免流量特权'),
            ),
          ],
        ),
      ),
    );
  }
}






