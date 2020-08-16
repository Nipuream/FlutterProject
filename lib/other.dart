///
/// 泛型
/// 库的使用
/// 异步支持
/// 元数据
/// 注释
///

import 'package:http/http.dart' as http; //为库指定一个前缀


Future<int> readFile(){

}

//异步
fileOperate() async {
  //读取文件
  var file = await readFile();
  //其他处理
}


/*
元数据

目前元数据提供三种 @修饰符
1. @deprecated 被弃用的
2. @override 重写
3. @proxy 代理
*/

//动物类
class Animal {

  //动物会吃
  void eat(){
    print('动物会吃');
  }

  //动物会跑
  void run(){
    print('动物会跑');
  }
}

class Human extends Animal {

   void say(){
     print('人类会说 ');
   }

   void study(){
     print('人类会学习 ');
   }

   @override
   void eat(){
     print('人类也会吃 ');
   }
}


void main(){

  var names = <String>['张三','李四', '王五'];
  var weeks = <String,String>{
    'Monday' : '星期一',
    'Tuesday' : '星期二',
    'Wednesday' : '星期三',
    'Thursday' : '星期四',
    'Friday' : '星期五',
    'Saturday' : '星期六',
    'Sunday' : '星期日'
  };

  print('实例化一个动物类');
  var animal = new Animal();
  animal.eat();
  animal.run();

  print('实例化一个人类');
  var human = new Human();
  human.eat();
  human.run();
  human.say();
  human.study();
}