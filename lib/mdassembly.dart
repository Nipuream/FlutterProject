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
      home: CardDemo(),
//      home : TextFieldDemo(),
//        home: new AlertDialogDemo(),
//      home: new SimpleDialogDemo(),
//      home: new LayoutDemo(),
//      home: new MyBottomNagavitaionBarPage(),
//      home: new DefaultTabControllerSample(),
//        home: new DrawerDemo(),
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

enum ConferenceItem {
  AddMember,
  LockConference,
  ModifyLayout,
  TurnoffAll
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
        child: FlatButton(
          onPressed: (){
          },
          //弹出菜单组件
          child: PopupMenuButton<ConferenceItem>(
            onSelected: (ConferenceItem result) {
            },
            itemBuilder: (BuildContext context) => //菜单的构造器
            <PopupMenuEntry<ConferenceItem>>[
              const PopupMenuItem<ConferenceItem>(
                value: ConferenceItem.AddMember,
                child: Text('添加成员'),
              ),
              const PopupMenuItem<ConferenceItem>(
                value: ConferenceItem.LockConference,
                child: Text('锁定会议'),
              ),
              const PopupMenuItem<ConferenceItem>(
                value: ConferenceItem.ModifyLayout,
                child: Text('修改布局'),
              ),
              const PopupMenuItem<ConferenceItem>(
                value: ConferenceItem.TurnoffAll,
                child: Text('挂断所有'),
              ),
            ],
          ),
        ),


//悬停按钮组件
//        child: Text('主页'),
//         child: Text(
//           'FloatingActionButton 示例',
//           style: TextStyle(fontSize: 28.0),
      ),
    );
//      floatingActionButton: new Builder(builder: (BuildContext context){
//        return new FloatingActionButton(
//          child: const Icon(Icons.add),
//          //提示信息
//          tooltip: "请点击FloatingActionButton",
//          //前景色为白色
//          foregroundColor: Colors.white,
//          //背景色为蓝色
//          backgroundColor: Colors.blue,
//          //未点击阴影值
//          elevation: 7.0,
//          //点击阴影值
//          highlightElevation: 14.0,
//          onPressed: (){
//            //点击回调事件 弹出一句提示语句
//            Scaffold.of(context).showSnackBar(new SnackBar(
//                content: Text("你点击了FloatingActionButton")
//            ));
//          },
//          mini: false,
//          //圆形边
//          shape: new CircleBorder(),
//          isExtended: false,
//        );
//      }),
//      floatingActionButtonLocation:
//      FloatingActionButtonLocation.centerFloat, //居中 位置
//    );
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


///
/// 简单对话框组件 SimpleDialog
///

class SimpleDialogDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'SimpleDialog组件示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('SimpleDialog'),
        ),
        body: Center(
          child: SimpleDialog(
            title: const Text('对话框标题'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: (){},
                child: const Text('第一行信息'),
              ),
              SimpleDialogOption(
                onPressed: (){},
                child: const Text('第二行信息'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///
/// 提示对话框组件
///
class AlertDialogDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AlertDialog 组件示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('AlertDialog组件'),
        ),
        body: Center(
          child: AlertDialog(
            title: Text('提示'),
            content: SingleChildScrollView(
              //对话框内容部分
              child: ListBody(
                children: <Widget>[
                  Text('是否要删除？'),
                  Text('一旦删除数据不可恢复!'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('确定'),
                onPressed: (){},
              ),
              FlatButton(
                child: Text('取消'),
                onPressed: (){},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///
/// 文本框组件 TextField
///

class TextFieldDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //添加文本编辑控制器 监听文本输入内容变化
    final TextEditingController controller = TextEditingController();
    controller.addListener(() {
      print('你输入的内容为 : ${controller.text}');
    });

    return MaterialApp(
      title: 'TextField 组件示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('TextField 组件示例'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              //绑定 controller
              controller: controller,
              //最大长度，设置此项会让 TextField 右下角有一个输入数量的统计字符串
              maxLength: 30,
              //最大行数
              maxLines: 1,
              //是否自动更正
              autocorrect: true,
              //是否自动对焦
              autofocus: true,
              //是否是密码
              obscureText: false,
              //文本对齐方式
              textAlign: TextAlign.center,
              //输入文本的样式
              style: TextStyle(fontSize: 26.0, color: Colors.green),
              //文本内容改变时的回调
              onChanged: (text){
                print("文本内容改变时回调 $text");
              },
              //内容提交时回调
              onSubmitted: (text){
                print("内容提交时回调 $text");
              },
              enabled: true, //是否禁用
              decoration: InputDecoration( //添加装饰效果
                fillColor: Colors.grey.shade200,//添加灰色填充色
                filled: true,
                helperText: "用户名",
                //左侧图标
                prefixIcon: Icon(Icons.person),
                //右侧文本提示
                suffixText: '用户名',
              ),
            ),
          ),
        ),
      ),
    );
  }
}



///
/// 卡片组件
///
class CardDemo extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    var card = new SizedBox(

      height: 250.0,
      child: new Card(
        child: new Column(
          children: <Widget>[
            new ListTile(
              title: new Text(
                '深圳市南山区深南大道35号',
                style: new TextStyle(fontWeight: FontWeight.w200),
              ),
              subtitle: new Text('创想科技有限公司'),
              leading: new Icon(
                Icons.home,
                color: Colors.lightBlue,
              ),
            ),
            new Divider(),
            new ListTile(
              title: new Text(
                '深圳市罗湖市沿海大道32号',
                style: new TextStyle(fontWeight: FontWeight.w300),
              ),
              subtitle: new Text('一木培训机构'),
              leading: new Icon(
                Icons.school,
                color:Colors.lightBlue,
              ),
            ),
            new Divider(),
          ],
        ),
      ),
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Card布局'),
      ),
      body: new Center(
        child: card,
      ),
    );
  }
  
}