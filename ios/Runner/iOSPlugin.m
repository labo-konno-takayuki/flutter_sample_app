//
//  iOSPlugin.m
//  Runner
//
//

#import "iOSPlugin.h"

@implementation iOSPlugin

- (NSString *)methodA {
    return @"call iOS Method A";
}

- (void)handleFlutterMethodCall:(FlutterMethodCall *)call
                         result:(FlutterResult)result {
    if ([@"methodA" isEqualToString:call.method]) {
        result([self methodA]);
    } else {
        result(FlutterMethodNotImplemented);
    }
}

@end
