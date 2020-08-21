package com.example.flutter_app;

import android.os.Build;
import android.util.Log;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

public class TestPluginDemo implements MethodChannel.MethodCallHandler {


    public static void registerWith(PluginRegistry.Registrar registrar) {
        final MethodChannel channel = new MethodChannel(registrar.messenger(),"flutter_plugin_demo");
        channel.setMethodCallHandler(new TestPluginDemo());
    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {

        Log.i("yanghui","onMethodCall...");

        //判断上层调用的方法
        if(methodCall.method.equals("getPlatformVersion")) {
            //调用成功后返回系统版本
            result.success("Android " + Build.VERSION.RELEASE);
        } else {
            result.notImplemented();
        }
    }


}
