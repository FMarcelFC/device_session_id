#import "DeviceSessionIdPlugin.h"
#if __has_include(<device_session_id/device_session_id-Swift.h>)
#import <device_session_id/device_session_id-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "device_session_id-Swift.h"
#endif

@implementation DeviceSessionIdPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDeviceSessionIdPlugin registerWithRegistrar:registrar];
}
@end
