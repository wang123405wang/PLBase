//
//  PLNetManager.m
//  Pods
//
//  Created by 冯利杰的MacBook Air on 2019/11/22.
//

#import "PLNetManager.h"
#import "RSA.h"

@implementation PLNetManager

+ (id)submitRequestType:(NSString *)requestType requestPath:(NSString *)requestPath parameters:(NSDictionary *)parameters completionHand:(void(^)(id responseObj, id error))completionHandler
{
    //加密模式
//    NSString *resultPath = [path componentsSeparatedByString:@".com"].lastObject;
//    NSString *urlPath = [NSString stringWithFormat:@"%@.3.%@", resultPath.uppercaseString, kUSERDEFAULTSGet(@"UUID")];
//    NSString *keyStr = [StyleHelper encryptionString:urlPath];
//
//    NSMutableDictionary *tempDic = [NSMutableDictionary dictionaryWithDictionary:parameters];
//    [tempDic setObject:@"3" forKey:@"source"];
//    [tempDic setObject:keyStr forKey:@"sign"];
//    [tempDic setObject:[StyleHelper getLatestVersionNumber] forKey:@"version"];
    
    return 0;
}
@end
