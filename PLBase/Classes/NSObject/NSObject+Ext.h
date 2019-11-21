//
//  NSObject+Ext.h
//  防止重复提交
//
//  Created by wang123405wang on 11/18/2019.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Ext)

/**
 *  防止重复提交
 */
@property (nonatomic, assign, getter=isBlocking) BOOL blocking;

/**
 *  是否已加载完
 */
@property (nonatomic, assign, getter=isLoaded) BOOL loaded;

/**
 *  附加值(用于传递参数)
 */
@property (nonatomic, copy) NSString *attachValue;

@end

NS_ASSUME_NONNULL_END
