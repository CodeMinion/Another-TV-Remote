#import "AnotherTvRemotePlugin.h"
#if __has_include(<another_tv_remote/another_tv_remote-Swift.h>)
#import <another_tv_remote/another_tv_remote-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "another_tv_remote-Swift.h"
#endif

@implementation AnotherTvRemotePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAnotherTvRemotePlugin registerWithRegistrar:registrar];
}
@end
