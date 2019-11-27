//
//  AppDelegate+System.m
//  shop
//
//  Created by pg on 2017/8/16.
//  Copyright © 2017年 fxwc. All rights reserved.
//

#import "AppDelegate+System.h"
#import "PLAppDelegate.h"
#import <objc/runtime.h>

@implementation AppDelegate (System)
#pragma mark - method
- (void)setupGlobalConfig:(UIApplication *)application{
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    /** ================ 电池条显示菊花, 监测网络活动 =================*/
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    /** ===================== 网络状态监测 =========================*/
    
    
    /** =========== 自定义导航栏左上角返回按钮, 导致右滑返回失败 =========*/
    [MLTransition validatePanBackWithMLTransitionGestureRecognizerType:MLTransitionGestureRecognizerTypeScreenEdgePan];
}

#pragma mark - LazyLoad
- (AFNetworkReachabilityStatus)netReachStatus{
    return [AFNetworkReachabilityManager sharedManager].networkReachabilityStatus;
}

- (BOOL)isOnLine{
    return self.netReachStatus == AFNetworkReachabilityStatusReachableViaWWAN || self.netReachStatus == AFNetworkReachabilityStatusReachableViaWiFi;
}

#pragma mark - LifeCycle
//申请将退出活动
- (void)applicationWillResignActive:(UIApplication *)application {}

//应用程序变得活跃
- (void)applicationDidBecomeActive:(UIApplication *)application {
}

//应用程序将终止
- (void)applicationWillTerminate:(UIApplication *)application {
}

///应用程序即将进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application {}

//应用程序即将进入前台
- (void)applicationWillEnterForeground:(UIApplication *)application {
}

//禁止旋转
- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(nullable UIWindow *)window {
    return UIInterfaceOrientationMaskPortrait;
}

@end
