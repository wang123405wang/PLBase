//
//  PLBaseModel.m
//  Pods
//
//  Created by wang123405wang on 11/18/2019.
//

#import "PLBaseModel.h"
#import "MJExtension.h"

@implementation PLBaseModel
MJCodingImplementation

+ (NSString *)replacedKeyFromPropertyName:(NSString *)propertyName
{
    //进行一些统一的变化
    if ([propertyName isEqualToString:@"ID"]) propertyName = @"Id";
    if ([propertyName isEqualToString:@"desc"]) propertyName = @"description";
    return [propertyName mj_underlineFromCamel];
}

@end
