package com.example.flutter.android.plugin;

import android.content.Intent;

import androidx.annotation.NonNull;

import com.example.android.app.EmptyActivity;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class AndroidViewPlugin implements MethodChannel.MethodCallHandler {
    private static final String CHANNEL_NAME = "com.example.flutter.view/plugin";
    private final MethodChannel methodChannel;
    private FlutterActivity activity;
    public AndroidViewPlugin(FlutterActivity activity, FlutterEngine flutterEngine) {
        this.activity = activity;
        // 指定したチャンネル名でメソッドチャンネルを作成する
        // このチャンネル名がdart側と一致していないと呼び出すことはできない
        methodChannel = new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL_NAME);
        // メソッドチャンネルの呼び出しハンドラをこのクラスに設定する
        methodChannel.setMethodCallHandler(this);
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        // MethodCallのmethodにメソッド名が入っている
        if (call.method.equals("openPlatformWindow")) {
            openPlatformWindow();
            result.success(null);
        } else {
            result.notImplemented();
        }
    }

    private void openPlatformWindow() {
        Intent intent = new Intent(activity, EmptyActivity.class);
        activity.startActivity(intent);
    }
}
