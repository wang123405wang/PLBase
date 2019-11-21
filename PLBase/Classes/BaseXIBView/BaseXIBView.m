//
//  BaseXIBView.m
//  Pods
//
//  Created by wang123405wang on 11/18/2019.
//

#import "BaseXIBView.h"

@implementation BaseXIBView

- (void)setCornerRadius:(CGFloat)cornerRadius
{
    _cornerRadius = cornerRadius;
    self.layer.cornerRadius = _cornerRadius;
}

- (void)setBorderColor:(UIColor *)borderColor
{
    _borderColor = borderColor;
    self.layer.borderColor = _borderColor.CGColor;
}

- (void)setBorderWidth:(CGFloat)borderWidth
{
    _borderWidth = borderWidth;
    self.layer.borderWidth = _borderWidth;
}

- (void)setMasksToBounds:(BOOL)masksToBounds
{
    _masksToBounds = masksToBounds;
    self.layer.masksToBounds = _masksToBounds;
}

@end
