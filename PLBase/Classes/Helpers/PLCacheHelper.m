//
//  PLCacheHelper.m
//  Pods
//
//  Created by wang123405wang on 11/18/2019.
//

#import "PLCacheHelper.h"

@implementation PLCacheHelper

+ (void)setCacheValue:(id)value key:(NSString *)key
{
    NSData *regionData = [NSKeyedArchiver archivedDataWithRootObject:value];
    [[NSUserDefaults standardUserDefaults] setValue:regionData forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (id)getCacheValueWithKey:(NSString *)key
{
    NSData *regonData = [[NSUserDefaults standardUserDefaults] valueForKey:key];
    return [NSKeyedUnarchiver unarchiveObjectWithData:regonData];
    
}

+ (void)removeCacheValueWithKey:(NSString *)key
{    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
