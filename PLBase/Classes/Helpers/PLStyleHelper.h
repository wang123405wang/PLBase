//
//  PLStyleHelper.h
//  自定义方法
//
//  Created by 冯利杰的MacBook Air on 2019/11/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PLStyleHelper : NSObject

/** 获取 app 当前版本号 */
+ (NSString *)getLatestVersionNumber;

/** 获取 UUID */
+ (void)getDeviceUUID:(NSString *)bundleIdentifier;

/** RSA + publicKey 加密字符串 */
+ (NSString *)encryptionString:(NSString *)string;

/** 相机获取到的图片自动旋转90度解决办法 */
+ (UIImage *)fixOrientation:(UIImage *)aImage;

/** 图片压缩 */
+ (UIImage *)compressImage:(UIImage *)image toByte:(NSUInteger)maxLength;

/**
 *  浏览大图
 *
 *  @param currentImageview 图片所在的imageView
 */
+ (void)scanBigImageWithImageView:(UIImageView *)currentImageview;

/** 计算富文本宽度 */
+ (CGFloat) widthForText:(NSString *)text withFontSize:(CGFloat)fontSize;

/** 计算富文本高度 */
+ (CGFloat) heightForText:(NSString *)text withFontSize:(CGFloat)fontSize;

/** 设置 label 行间距 */
+ (NSMutableAttributedString *)setLabelRowSpacing:(NSString *)str lineSpacing:(CGFloat)lineSpacing;

/** 改变指定字符串颜色字体 */
+ (NSMutableAttributedString *)changeSpecifiedString:(NSString *)string color:(UIColor *)color font:(UIFont *)font range:(NSRange)range;

@end

NS_ASSUME_NONNULL_END
