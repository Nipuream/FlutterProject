package com.example.flutter_app

import android.os.Build
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        Log.i("flutter activity", "register flutter plugin.")
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "flutter_plugin_demo")
                .setMethodCallHandler{ call, result ->
                    kotlin.run {
                        if(call.method.contentEquals("getPlatformVersion")){
                            result.success("Android "+ Build.VERSION.RELEASE)
                        } else {
                            result.notImplemented()
                        }
                    }
                }
    }


}
