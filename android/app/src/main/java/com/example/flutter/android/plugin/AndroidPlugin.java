package com.example.flutter.android.plugin;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class AndroidPlugin implements MethodChannel.MethodCallHandler {

    private static final String CHANNEL_NAME = "com.example.flutter/plugin";
    private final MethodChannel methodChannel;

    public AndroidPlugin(FlutterEngine flutterEngine) {
        // 指定したチャンネル名でメソッドチャンネルを作成する
        // このチャンネル名がdart側と一致していないと呼び出すことはできない
        methodChannel = new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL_NAME);
        // メソッドチャンネルの呼び出しハンドラをこのクラスに設定する
        methodChannel.setMethodCallHandler(this);
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        // MethodCallのmethodにメソッド名が入っている
        if (call.method.equals("methodA")) {
            result.success(methodA());
        } else {
            result.notImplemented();
        }
    }

    private String methodA() {
        return "call Android Method A";
    }
}
