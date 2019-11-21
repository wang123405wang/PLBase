//
//  PLStyleHelper.h
//  自定义方法
//
//  Created by 冯利杰的MacBook Air on 2019/11/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PLStyleHelper : NSObject

/** 获取 app 当前版本号 */
+ (NSString *)getLatestVersionNumber;

/** 获取 UUID */
+ (void)getDeviceUUID:(NSString *)bundleIdentifier;

/** RSA + publicKey 加密字符串 */
+ (NSString *)encryptionString:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
