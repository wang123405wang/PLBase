//
//  NSString+PL.h
//  字符串后缀
//
//  Created by wang123405wang on 11/18/2019.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (PL)

@property (readonly, nonatomic) NSURL *pl_URL;

@property (readonly, nonatomic) NSURL *pl_fileURL;

@property (readonly, nonatomic) UIImage *pl_image;

@property (readonly, nonatomic) UIImageView *pl_imageView;

@property (readonly, nonatomic) UIColor *pl_HexString;

@end

NS_ASSUME_NONNULL_END
