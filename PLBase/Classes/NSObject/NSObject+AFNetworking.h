//
//  NSObject+AFNetworking.h
//  AFNetworking二次d封装
//
//  Created by wang123405wang on 11/18/2019.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//定义一个block类型
typedef void(^CompletionHandlerBlock)(id model, NSError *error);

@interface NSObject (AFNetworking)

+ (id)submitRequestType:(NSString *)requestType requestPath:(NSString *)requestPath parameters:(id)parameters downloadProgress:(void(^)(NSProgress *downloadProgress))downloadProgress completionHandler:(void(^)(id responseObj, NSError *error))completionHandler;

+ (id)POST:(NSString *)path parameters:(id)parameters constructBodyWithBlock:(void(^)(id formData))constructBodyWithBlock completionHandler:(void(^)(id responseObj, NSError *error))completionHandler;

@end

NS_ASSUME_NONNULL_END
