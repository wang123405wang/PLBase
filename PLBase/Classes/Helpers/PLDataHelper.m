//
//  PLDataHelper.m
//  Pods
//
//  Created by wang123405wang on 11/18/2019.
//

#import "PLDataHelper.h"
#import "CommonCrypto/CommonDigest.h"

@implementation PLDataHelper

+ (NSString *)nullToString:(id)string {
    if ([string isEqual:@"NULL"] || [string isKindOfClass:[NSNull class]] || [string isEqual:[NSNull null]] || [string isEqual:NULL] || [[string class] isSubclassOfClass:[NSNull class]] || string == nil || string == NULL || [string isKindOfClass:[NSNull class]] || [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0 || [string isEqualToString:@"<null>"] || [string isEqualToString:@"(null)"]) {
        return @"";
    } else {
        return (NSString *)string;
    }
}

+ (NSString *)stringIsEmpty:(NSString *)value{
    
    if ([PLDataHelper isEmpty:value]) {
        return @"";
    }
    return value;
}

+ (BOOL)isEmpty:(NSString *)value
{
    if (value == nil) {
        return YES;
    }
    if ([value isKindOfClass:[NSString class]]) {
        return [self trim:value].length == 0;
    }
    return NO;
}

+ (BOOL)isNotEmpty:(NSString *)value
{
    return ![self isEmpty:value];
}

+ (NSString *)trim:(NSString *)value
{
    if (value == nil) {
        return nil;
    }
    value = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return [value stringByReplacingOccurrencesOfString:@"\u2006" withString:@""];
}

+ (NSString *)getQueryString:(NSString *)url paramName:(NSString *)paramName
{
    if (url == nil) {
        return nil;
    }
    NSError *error;
    NSString *pattern = [[NSString alloc] initWithFormat:@"(^|&|\\?)+%@=+([^&]*)(&|$)", paramName];
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray *matches = [regex matchesInString:url options:NSMatchingReportCompletion range:NSMakeRange(0, url.length)];
    for (NSTextCheckingResult *match in matches) {
        return [url substringWithRange:[match rangeAtIndex:2]];
    }
    return nil;
}

+ (NSString *)encode:(NSString *)value
{
    if (value == nil) {
        return @"";
    }
    
    return [value stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}



@end
