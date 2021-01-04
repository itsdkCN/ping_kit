#import "PingKitPlugin.h"
#if __has_include(<ping_kit/ping_kit-Swift.h>)
#import <ping_kit/ping_kit-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "ping_kit-Swift.h"
#endif

@implementation PingKitPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPingKitPlugin registerWithRegistrar:registrar];
}
@end
