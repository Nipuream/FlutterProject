///
///面向对象test
///

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class User {
  String name;
  int age;

  User(this.name,this.age);

  //命名的构造函数，从另一类或现有的数据中快速实现构造函数
  User.fromJson(Map json){
    name = json['name'];
    age = json['age'];
  }

//  User(name, age)
//     : name = name,
//       age = age;

}

//读取和写入对象,相当于改写了 get/set 方法
class Rectangle {
  num left;
  num top;
  num width;
  num height;

  Rectangle(this.left,this.top,this.width,this.height);

  //获取right值
  num get right => left + width;

  //设置right值， 同时left也发生变化
  set right(num value) => left = value - width;

  //获取bottom值
  num get bottom => top + height;

  //设置bottom值 同时top也发生变化
  set bottom(num value) => top = value - height;
}

//重载操作
class Vector {

  final int x;
  final int y;

  const Vector(this.x, this.y);

  //重载加号 + (a + b).
  Vector operator +(Vector v) {
    return new Vector(x + v.x, y +v.y);
  }

  //重载减号 - (a-b).
  Vector operator -(Vector v){
    return new Vector(x -v.x, y - v.y);
  }

}


// 类的继承
class Animal {

  void eat(){
    print('动物会吃 ');
  }


  void run(){
    print('动物会跑 ');
  }

}

//人类
class Human extends Animal {

  void say(){
    print('人类会说');
  }

  void study(){
    print('人类会学习');
  }
}

//抽象类
abstract class DataBaseOperate{
  void insert(); //定义插入的方法
  void delete(); //定义删除的方法
  void update(); //定义更新的方法
  void query(); //定义一个查询的方法
}

class DataBaseOperateImpl extends DataBaseOperate {

  @override
  void delete() {
    // TODO: implement delete
    print('实现了删除的方法');
  }

  @override
  void insert() {
    // TODO: implement insert
    print('实现了插入的方法');
  }

  @override
  void query() {
    // TODO: implement query
    print('实现了查询的方法');
  }

  @override
  void update() {
    // TODO: implement update
    print('实现了更新的方法');
  }

}


//枚举类型
enum Color {
  red,
  green,
  blue
}


//Mixins 多继承
class S {
  a(){print("S.a");}
}

class A {
  a(){print("A.a");}
  b(){print("B.b");}
}

//class T = A with S;
//如果用super复写，with 哪个类在后面，哪个方法最终执行到
class T extends A with S {

  a(){
    super.a();
    print('T.a');
  }

}



void main(){

//  var user = new User();
//  user.name = '张三';
//  user.age = 14;

  var rect = new Rectangle(1, 1, 1, 1);
  rect.left = 10;
  print("rect.left :" + rect.right.toString());


  final v = new Vector(2,3);
  final w = new Vector(2,2);

  final r1 = v + w;
  print('r1.x = ' + r1.x.toString() + ' r1.y = ' + r1.y.toString());

  final r2 = v - w;
  print('r2.x = '+ r2.x.toString() + ' r2.y ' + r2.y.toString());

  //类的继承
  print('实例化一个动物类 ');
  var animal = new Animal();
  animal.eat();
  animal.run();

  print('实例化一个人类');
  var human = new Human();
  human.eat();
  human.run();
  human.say();
  human.study();

  var db = new DataBaseOperateImpl();
  db.insert();
  db.delete();
  db.update();
  db.query();

  //获取枚举类所有的值
  List<Color> colors = Color.values;
  //使用switch
  Color acolor = Color.blue;
  switch(acolor){
    case Color.red:
      print('红色');
      break;
    case Color.green:
      print('绿色');
      break;
    default:
      print(acolor);
      break;
  }

  //多继承
  var t = new T();
  t.a();
  t.b();


}

