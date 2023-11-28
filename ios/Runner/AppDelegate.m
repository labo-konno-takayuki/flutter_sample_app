#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
#import "iOSPlugin.h"
#import "iOSViewPlugin.h"

@interface AppDelegate()

@property (nonatomic) iOSViewPlugin *viewPlugin;
@property (nonatomic) iOSPlugin *plugin;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.plugin = [[iOSPlugin alloc] init];
    // FlutterViewControllerはwindow.rootViewControllerで取得できる
    FlutterViewController *controller = (FlutterViewController *)self.window.rootViewController;
    // メソッドチャンネルの生成、binaryMessengerはFlutterViewController.binaryMessengerで取得できる
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"com.example.flutter/plugin" binaryMessenger:controller.binaryMessenger];
    // コールバック関数の追加、ここに直接ハンドリング処理を書いても良いがメソッドチャンネルごとにクラスを分けてハンドリングしたほうが見通しがよくなりそう
    [channel setMethodCallHandler:^(FlutterMethodCall *call, FlutterResult result){
        [self.plugin handleFlutterMethodCall:call result:result];
    }];
    
    self.viewPlugin = [[iOSViewPlugin alloc] init];
    // メソッドチャンネルの生成、binaryMessengerはFlutterViewController.binaryMessengerで取得できる
    FlutterMethodChannel *viewChannel = [FlutterMethodChannel
                                         methodChannelWithName:@"com.example.flutter.view/plugin"
                                         binaryMessenger:controller.binaryMessenger];
    // コールバック関数の追加、ここに直接ハンドリング処理を書いても良いがメソッドチャンネルごとにクラスを分けてハンドリングしたほうが見通しがよくなりそう
    [viewChannel setMethodCallHandler:^(FlutterMethodCall *method, FlutterResult result) {
        [self.viewPlugin handleFlutterMethodCall:method result:result];
    }];
    
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
