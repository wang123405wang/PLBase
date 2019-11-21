//
//  UIView+HUD.h
//  菊花提示
//
//  Created by wang123405wang on 11/18/2019.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (HUD)

//忙提示
- (void)showBusyHUD;

//隐藏提示
- (void)hideBusyHUD;

@end

NS_ASSUME_NONNULL_END
