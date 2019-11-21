//
//  NSObject+MJExtension.m
//  Pods
//
//  Created by wang123405wang on 11/18/2019.
//

#import "NSObject+MJExtension.h"

@implementation NSObject (MJExtension)


+ (id)parse:(id)responseObj
{
    if ([responseObj isKindOfClass:[NSArray class]]){
        return [self mj_objectArrayWithKeyValuesArray:responseObj];
    }
    
    if ([responseObj isKindOfClass:[NSDictionary class]]){
        return [self mj_objectWithKeyValues:responseObj];
    }
    return responseObj;
}

+ (NSDictionary *)mj_objectClassInArray{
    return [self objClassInArray];
}

+ (NSDictionary *)objClassInArray{
    return nil;
}

+ (NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [self replacedKeyFromPropertyName:propertyName];
}

+ (NSString *)replacedKeyFromPropertyName:(NSString *)propertyName{
    return propertyName;
}

@end
