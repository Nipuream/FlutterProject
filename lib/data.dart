

/**
 * final 运行时不可变，
 * const 编译时常量
 *
 * [] 创建一个空列表
 * const[] 可创建一个空的不可变列表[EIA].
 * var foo = const[]; //foo 目前是一个 EIA
 * final bar = const[]; //bar 永远是个 EIA
 * const baz = const[]; //baz是一个编译时常量 EIA
 *
 */
void testFinalConst(){

  final username = '张三'; //定义一个常量
  const pi = 3.1415926;

  final stars = const [1,2,3];
  const buttons = const [1,2,3];

  print("stars : $stars");
  print("buttons : $buttons");
}

void testNormalContainer(){

  var list = [1,2,3,4,5,6];
  print(list.length);

  var week = new Map();
  week['Monday'] = '星期一';
  week['Tuesday'] = '星期二';
  week['Wednesday'] = '星期三';
  week['Thurday'] = '星期四';
  week['Friday'] = '星期五';
  week['Saturday'] = '星期六';
  week['Sunday'] = '星期日';

  assert(week['Monday'] == null);
}


/**
 * 1.第三个参数是可选参数，调用时可填，可不填
 * 2.[String from = '中国'] 参数默认值
 */
String getUserInfo(String name,String sex,[String from]){
  var info = '$name 的性别是 $sex';
  if(from != null){
    info = '$info 来自 $from';
  }
  return info;
}

class User {
   String name;
}

/**
 * 测试一下运算符
 */
void testOperator(){

  assert(3+6==9);
  assert(3-6==-3);
  assert(3*6==18);
  assert(7/2 == 3.5);
  assert( 5 ~/ 2 == 2);  //返回一个整数值的触发
  assert(5 % 2 == 1); //取余，除法剩下的余数

  //类型转化
  //as ： 类型转换
  //is ： 当对象是相应类型时返回true
  //is!:  当对象不是相应类型时返回true

  var user;
  if(user is User){
    user.name = 'Flutter';
  }

  (user as User).name = 'Flutter'; //强转

  var a = 'test null';
  a ??= 'test 1'; //如果b为空，则将值分配给b；否则，b保持不变

  // expr1 ?? expr2  如果expr1为非空，则返回其值；否则，计算并返回 expr2的值

  //级联操作
  /*
  querySelector('#btnOk')
  ..text = '确定'
  ..classes.add('ButtonOkStyle')
  .onClick.listen((e)==>window.alert('确定'));
   */
}

void testException(){

  var test = null;
  try{
    //不捕获异常，程序中断，不往下执行。
    assert(test != null);  //断言 test 不为null.
  } on Exception catch(e){
    print("exception is :  $e" );
  } catch(e,s){
    print("detail exception $e");
    print("stack trace : $s");
  } finally {
    print("do last things.");
  }

  throw FormatException('抛出 Format exception.');
}



















