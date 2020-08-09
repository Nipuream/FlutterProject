import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class NetTest extends StatelessWidget {

  void getWeatherData() async {

    try{
      //实例化http对象
      HttpClient httpClient = new HttpClient();
      //发送请求
      HttpClientRequest request = await httpClient.getUrl(
          Uri.parse("http://t.weather.sojson.com/api/weather/city/101030100"));
      //等待服务器返回数据
      HttpClientResponse response = await request.close();

      //使用utf8.decoder 从 response 里解析数据
      var result = await response.transform(utf8.decoder).join();
      print(result);

      httpClient.close();
    } catch(e) {
      print("请求失败 : $e");
    } finally{
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "http请求示例",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("http请求示例"),
        ),
        body: new Center(
          child: new RaisedButton(
            onPressed: getWeatherData,
//              onPressed: (){
//                var url = "http://httpbin.org/";
//                http.get(url).then((value) => {
//                  print("状态: ${value.statusCode}"),
//                  print("正文: ${value.body}")
//                });
//              },
            child: new Text("发起http请求"),
          ),
        ),
      ),
    );
  }

  

}
