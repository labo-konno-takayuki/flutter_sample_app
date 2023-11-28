//
//  iOSViewPlugin.h
//  Runner
//
//

#ifndef iOSViewPlugin_h
#define iOSViewPlugin_h

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

@interface iOSViewPlugin : NSObject

- (void)openView;
- (void)handleFlutterMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result;

@end

#endif /* iOSViewPlugin_h */
