//
//  SFUMConfig.m
//  um
//
//  Created by SmartFun on 2018/6/1.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "SFUMConfig.h"
#import <UMCommonLog/UMCommonLogHeaders.h>
#import <UMAnalytics/MobClick.h>
#import <UMPush/UMessage.h>
#import <UMShare/UMShare.h>
#import <UserNotifications/UserNotifications.h>
#import "RNUMConfigure.h"

@interface SFUMConfig()<UNUserNotificationCenterDelegate>

@end

@implementation SFUMConfig

+ (SFUMConfig *)share{
  static SFUMConfig *_obj;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    _obj = [SFUMConfig new];
  });
  return _obj;
}

- (instancetype)init{
  if (self = [super init]){
    [self setLogEnabled];
  }
  return self;
}

/**** 1. 注册 ****/
- (void)initKey:(NSString *)key{
  [RNUMConfigure initWithAppkey:key channel:@"App Store"];
}
/**** 2. 打印 ****/
- (void)setUpLog{
  [UMCommonLogManager setUpUMCommonLogManager];
}
/**** 3. 统计 ****/
- (void)setScennario{
  [MobClick setScenarioType:E_UM_NORMAL];
}
/**** 4. 推送设置 ****/
- (void)setPushConfig:(NSDictionary *)launchOptions{
  // Push's basic setting
  UMessageRegisterEntity * entity = [[UMessageRegisterEntity alloc] init];
  //type是对推送的几个参数的选择，可以选择一个或者多个。默认是三个全部打开，即：声音，弹窗，角标
  entity.types = UMessageAuthorizationOptionBadge|UMessageAuthorizationOptionAlert;
  [UNUserNotificationCenter currentNotificationCenter].delegate = self;
  [UMessage registerForRemoteNotificationsWithLaunchOptions:launchOptions Entity:entity completionHandler:^(BOOL granted, NSError * _Nullable error) {
    if (granted){
    
    }
    else{
    
    }
  }];
}

- (void)configUSharePlatforms{
  /* 设置微信的appKey和appSecret */
  
  [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:@"wx852d43a16b2af151" appSecret:@"423f56cbcdd97217a44352805cb1f410" redirectURL:@"http://mobile.umeng.com/social"];
  /*
   * 移除相应平台的分享，如微信收藏
   */
  //[[UMSocialManager defaultManager] removePlatformProviderWithPlatformTypes:@[@(UMSocialPlatformType_WechatFavorite)]];
  /* 设置分享到QQ互联的appID
   * U-Share SDK为了兼容大部分平台命名，统一用appKey和appSecret进行参数设置，而QQ平台仅需将appID作为U-Share的appKey参数传进即可。
   */
  
  [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:@"1104484470"/*设置QQ平台的appID*/  appSecret:nil redirectURL:@"http://mobile.umeng.com/social"];
  
  /* 设置新浪的appKey和appSecret */
  [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:@"1601664396"  appSecret:nil redirectURL:@"https://sns.whalecloud.com/sina2/callback"];
}
- (void)confitUShareSettings
{
  /*
   * 打开图片水印
   */
  //[UMSocialGlobal shareInstance].isUsingWaterMark = YES;
  /*
   * 关闭强制验证https，可允许http图片分享，但需要在info.plist设置安全域名
   <key>NSAppTransportSecurity</key>
   <dict>
   <key>NSAllowsArbitraryLoads</key>
   <true/>
   </dict>
   */
  [UMSocialGlobal shareInstance].isUsingHttpsWhenShareContent = NO;
}

- (BOOL)handleUrl:(NSURL *)url
          options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options{
  //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响。
  BOOL result = [[UMSocialManager defaultManager]  handleOpenURL:url options:options];
  if (!result) {
    // 其他如支付等SDK的回调
  }
  return result;
}

- (BOOL)handleUrl:(NSURL *)url
sourceApplication:(NSString *)sourceApplication
       annotation:(id)annotation{
  BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
  if (!result) {
    // 其他如支付等SDK的回调
  }
  return result;
}

- (BOOL)handleUrl:(NSURL *)url{
  BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
  if (!result) {
    // 其他如支付等SDK的回调
  }
  return result;
}


- (void)setIsLogEnable:(BOOL)isLogEnable{
  [UMConfigure setLogEnabled:isLogEnable];
}

- (void)setLogEnabled{
    [UMConfigure setLogEnabled:YES];
}


@end
