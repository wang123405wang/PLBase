//
//  BaseXIBView.h
//  xib控件属性添加
//
//  Created by wang123405wang on 11/18/2019.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseXIBView : UIView

@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;

@property (nonatomic, assign) IBInspectable CGFloat borderWidth;

@property (nonatomic, assign) IBInspectable UIColor *borderColor;

@property (nonatomic, assign) IBInspectable BOOL masksToBounds;

@end

NS_ASSUME_NONNULL_END
