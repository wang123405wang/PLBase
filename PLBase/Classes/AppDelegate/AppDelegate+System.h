//
//  AppDelegate+System.h
//  shop
//
//  Created by pg on 2017/8/16.
//  Copyright © 2017年 fxwc. All rights reserved.
//

#import "AppDelegate.h"
#import <AFNetworkActivityIndicatorManager.h>
#import <AFNetworkReachabilityManager.h>
#import <MLTransition.h>

@interface AppDelegate (System)<UIApplicationDelegate, GeTuiSdkDelegate, UNUserNotificationCenterDelegate>

/** 当前网络是否在线: 在线:WIFI + 手机网络 */
@property (nonatomic, getter=isOnLine, readonly) BOOL onLine;

/** 当前网络状态:无网络, 未知, WIFI, 手机网络 */
@property (nonatomic, readonly) AFNetworkReachabilityStatus netReachStatus;

/** 进行一些全局配置, 如 开启网络监测, 网络活动提示, 初始化DDLog 等... */
- (void) setupGlobalConfig:(UIApplication *)application;

@end
