#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <React/RCTBridgeDelegate.h>
#import <UserNotifications/UNUserNotificationCenter.h>

NS_ASSUME_NONNULL_BEGIN

@interface SHDeceHelper : UIResponder<RCTBridgeDelegate, UNUserNotificationCenterDelegate>

+ (instancetype)shared;
- (BOOL)dece_tryThisWay;
- (UIInterfaceOrientationMask)dece_getOrientation;
- (UIViewController *)dece_changeRootController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions;

@end

NS_ASSUME_NONNULL_END
