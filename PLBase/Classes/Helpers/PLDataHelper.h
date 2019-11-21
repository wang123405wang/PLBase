//
//  PLDataHelper.h
//  字符串非空判断
//
//  Created by wang123405wang on 11/18/2019.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PLDataHelper : NSObject

//判断NSString值是否为空或null并转换为空字符串
+ (NSString *)nullToString:(id)string;

/**
 * 判断字符串是否为空
 */
+ (BOOL)isEmpty:(NSString *)value;

/**
 * 判断字符串是否不为空
 */
+ (BOOL)isNotEmpty:(NSString *)value;

+ (NSString *)getQueryString:(NSString *)url paramName:(NSString *)paramName;

/**
 * 编码字符串
 */
+ (NSString *)encode:(NSString *)value;

+ (NSString *)stringIsEmpty:(NSString *)value;

@end

NS_ASSUME_NONNULL_END
