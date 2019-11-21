//
//  NSString+PL.m
//  Pods
//
//  Created by wang123405wang on 11/18/2019.
//

#import "NSString+PL.h"

@implementation NSString (PL)

- (NSURL *)pl_URL
{
    return [NSURL URLWithString:self];
}

- (NSURL *)pl_fileURL
{
    return [NSURL fileURLWithPath:self];
}

- (UIImage *)pl_image
{
    return [UIImage imageNamed:self];
}

- (UIImageView *)pl_imageView
{
    return [[UIImageView alloc] initWithImage:self.pl_image];
}

- (UIColor *)pl_HexString
{
    return [self hexColor:self];
}

//颜色值转换
- (UIColor*)hexColor:(NSString *)hexColor
{
    
    unsigned int red, green, blue, alpha;
    NSRange range;
    range.length = 2;
    @try {
        if ([hexColor hasPrefix:@"#"]) {
            hexColor = [hexColor stringByReplacingOccurrencesOfString:@"#" withString:@""];
        }
        range.location = 0;
        [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
        range.location = 2;
        [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
        range.location = 4;
        [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
        
        if ([hexColor length] > 6) {
            range.location = 6;
            [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&alpha];
        }
    }
    @catch (NSException * e) {

    }
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green/255.0f) blue:(float)(blue/255.0f) alpha:(float)(1.0f)];
}

@end
