//
//  iOSPlugin.h
//  Runner
//
//

#ifndef iOSPlugin_h
#define iOSPlugin_h

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

@interface iOSPlugin: NSObject

- (NSString *)methodA;
- (void)handleFlutterMethodCall:(FlutterMethodCall *)call
                         result:(FlutterResult)result;

@end
#endif /* iOSPlugin_h */
