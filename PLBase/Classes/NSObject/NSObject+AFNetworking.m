//
//  NSObject+AFNetworking.m
//  Pods
//
//  Created by wang123405wang on 11/18/2019.
//

#import "NSObject+AFNetworking.h"

@implementation NSObject (AFNetworking)

+ (id)submitRequestType:(NSString *)requestType requestPath:(NSString *)requestPath parameters:(id)parameters downloadProgress:(void (^)(NSProgress *))downloadProgress completionHandler:(void (^)(id responseObj, NSError *))completionHandler
{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    
    //请求头统一添加用户参数
    //    if (1) {
    //        [manager.requestSerializer setValue:@"" forHTTPHeaderField:@""];
    //    }
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"text/html", @"text/plain", @"text/json", @"text/javascript", @"application/json"]];
    
    manager.requestSerializer.timeoutInterval = 60;
    
    if ([requestType isEqualToString:@"GET"]){
        return [manager GET:requestPath parameters:parameters progress:downloadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject){
            completionHandler(responseObject, nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error){
            if ([error.domain isEqualToString:AFURLResponseSerializationErrorDomain]){
                completionHandler(nil, [self failedToGetData:error]);
            }else {
                completionHandler(nil, error);
            }
        }];
    }else{
        return [manager POST:requestPath parameters:parameters progress:downloadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject){
            completionHandler(responseObject, nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error){
            if ([error.domain isEqualToString:AFURLResponseSerializationErrorDomain]){
                completionHandler(nil, [self failedToGetData:error]);
            }else {
                completionHandler(nil, error);
            }
        }];
    }
}

+ (id)POST:(NSString *)path parameters:(id)parameters constructBodyWithBlock:(void (^)(id))constructBodyWithBlock completionHandler:(void (^)(id responseObj, NSError * _Nonnull))completionHandler
{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/plain", @"application/javascript",@"application/json", @"application/x-www-form-urlencoded", nil]];
    
    manager.requestSerializer.timeoutInterval = 60;
    
    return [manager POST:path parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        constructBodyWithBlock(formData);
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        completionHandler(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if ([error.domain isEqualToString:AFURLResponseSerializationErrorDomain]) {
            completionHandler(nil, [self failedToGetData:error]);
        }else{
            completionHandler(nil, error);
        }
    }];
}

- (id)failedToGetData:(NSError *)error
{
    NSData *errData = [error.userInfo objectForKey:AFNetworkingOperationFailingURLResponseDataErrorKey];
    NSString *errorStr = [[NSString alloc]initWithData:errData encoding:NSUTF8StringEncoding];
    NSData *data = [errorStr dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *tempDictQueryDiamond = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    return tempDictQueryDiamond;
}

@end
