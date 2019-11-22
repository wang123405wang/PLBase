//
//  PLNetManager.h
//  Pods
//
//  Created by 冯利杰的MacBook Air on 2019/11/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PLNetManager : NSObject

+ (id)submitRequestType:(NSString *)requestType requestPath:(NSString *)requestPath parameters:(NSDictionary *)parameters completionHand:(void(^)(id responseObj, id error))completionHandler;

+ (id)POSTRequestPath:(NSString *)requestPath parameters:(NSDictionary *)parameters constructBodyWithBlock:(void(^)(id formData))constructBodyWithBlock completionHand:(void(^)(id responseObj, id error))completionHandler;

@end

NS_ASSUME_NONNULL_END
