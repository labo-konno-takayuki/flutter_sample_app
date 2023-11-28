package com.example.flutter_sample_app;

import androidx.annotation.NonNull;

import com.example.flutter.android.plugin.AndroidPlugin;
import com.example.flutter.android.plugin.AndroidViewPlugin;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;

public class MainActivity extends FlutterActivity {
    private AndroidPlugin androidPlugin = null;
    private AndroidViewPlugin androidViewPlugin = null;

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);

        androidPlugin = new AndroidPlugin(flutterEngine);
        androidViewPlugin = new AndroidViewPlugin(this, flutterEngine);
    }
}
