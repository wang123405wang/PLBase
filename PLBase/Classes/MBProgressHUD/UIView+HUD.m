//
//  UIView+HUD.m
//  Pods
//
//  Created by wang123405wang on 11/18/2019.
//

#import "UIView+HUD.h"

//超时
#define kTimeOut  30

//弹出提示时长
#define kDuration  1

static NSMutableArray *imageList = nil;

@implementation UIView (HUD)
- (void)showBusyHUD
{
    dispatch_async(dispatch_get_main_queue(), ^
    {
        [MBProgressHUD hideHUDForView:self animated:YES];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
        hud.mode = MBProgressHUDModeIndeterminate;
        [hud hideAnimated:YES afterDelay:kTimeOut];
    });
}

- (void)hideBusyHUD
{
    dispatch_async(dispatch_get_main_queue(), ^
    {
        [MBProgressHUD hideHUDForView:self animated:YES];
    });
}

@end
