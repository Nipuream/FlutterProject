import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/**
 * 调用原生方法
 */
class FlutterPluginDemo {

  //定义通道方法 MethodChannel 通道标识这个和原生代码是对应的要保持一致
  static const MethodChannel _channel =
      const MethodChannel('flutter_plugin_demo');

  //提供外部调用的方法 注意此方法要加异步处理
  static Future<String> get platformVersion async {

    //调用原生程序获取系统版本
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

}

class PluginApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MyAppState();
  }
}

class _MyAppState extends State<PluginApp> {

  String _platformVersion = "Unknow";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;

    try{
      print("get platform version before ~");
      platformVersion = await FlutterPluginDemo.platformVersion;
      print("get platform version after ~");
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: new Text('Running on : $_platformVersion \n'),
        ),
      ),
    );
  }

}
