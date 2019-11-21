//
//  PLStyleHelper.m
//  Pods
//
//  Created by 冯利杰的MacBook Air on 2019/11/19.
//

#import "PLStyleHelper.h"
#import "RSA.h"
#import "SSKeychain.h"

@implementation PLStyleHelper

+ (NSString *)getLatestVersionNumber
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return app_Version;
}

+ (void)getDeviceUUID:(NSString *)bundleIdentifier
{
    NSString *uuid1 = [SSKeychain passwordForService:bundleIdentifier account:@"uuid"];
    if (!uuid1.length) {
        uuid1 = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        [SSKeychain setPassword:uuid1 forService:bundleIdentifier account:@"uuid"];
    }
    kUSERDEFAULTSSet(UUID, @"UUID");
}

+ (NSString *)encryptionString:(NSString *)string
{
    return [RSA encryptString:string publicKey:[RSA getPublikKey]];
}

@end
