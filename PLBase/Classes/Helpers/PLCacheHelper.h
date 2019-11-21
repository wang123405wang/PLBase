//
//  PLCacheHelper.h
//  本地缓存
//
//  Created by wang123405wang on 11/18/2019.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PLCacheHelper : NSObject

/** 缓存到本地 */
+ (void)setCacheValue:(id)value key:(NSString *)key;

/** 根据key获取缓存 */
+ (id)getCacheValueWithKey:(NSString *)key;

/** 根据key删除缓存 */
+ (void)removeCacheValueWithKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
