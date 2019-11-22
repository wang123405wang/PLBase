//
//  PLBaseCoreDefine.h
//  PLBase头文件
//
//  Created by wang123405wang on 11/18/2019.
//

#ifndef PLBaseCoreDefine_h
#define PLBaseCoreDefine_h

#import "UINavigationController+NavigationBar.h"
#import "CALayer+XibConfiguration.h"
#import "UIView+HUD.h"
#import "BaseXIBView.h"
#import "UIScrollView+Refresh.h"
#import "PLBaseModel.h"
#import "NSObject+Ext.h"
#import "NSObject+MJExtension.h"
#import "NSString+PL.h"
#import "NSObject+AFNetworking.h"
#import "NotificationConst.h"
#import "PLNetManager.h"

#define kPublicKey @"dev_public_key"

//NSUserDefaults
#define kUSERDEFAULTSGet(keyName) [[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"%@",keyName]]

#define kUSERDEFAULTSSet(objcName,keyName) [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%@",objcName] forKey:[NSString stringWithFormat:@"%@",keyName]]

#define kUSERDEFAULTSRemove(keyName) [[NSUserDefaults standardUserDefaults] removeObjectForKey:[NSString stringWithFormat:@"%@",keyName]]

#define kUSERDEFAULTSSync [[NSUserDefaults standardUserDefaults] synchronize]

#endif /* PLBaseCoreDefine_h */
