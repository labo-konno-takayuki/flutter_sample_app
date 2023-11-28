//
//  iOSViewPlugin.m
//  Runner
//
//

#import "iOSViewPlugin.h"
#import "SampleEmptyViewController.h"

@implementation iOSViewPlugin

- (void)openView {
    UIViewController* viewController = [UIApplication sharedApplication].delegate.window.rootViewController;
  
    SampleEmptyViewController *newViewController = [[SampleEmptyViewController alloc] init];
    newViewController.modalPresentationStyle = UIModalPresentationFullScreen;
  
    [viewController presentViewController:newViewController animated:YES completion:nil];
}

- (void)handleFlutterMethodCall:(FlutterMethodCall *)call
                         result:(FlutterResult)result {
    if ([@"openPlatformWindow" isEqualToString:call.method]) {
        [self openView];
        result(nil);
    } else {
        result(FlutterMethodNotImplemented);
    }
}

@end
