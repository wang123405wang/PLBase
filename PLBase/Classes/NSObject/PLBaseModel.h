//
//  PLBaseModel.h
//  基础模型
//
//  Created by wang123405wang on 11/18/2019.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/*
 作为所有Model的父类, 所有继承与此类的子类, 都会自动实现归档功能.
 并且自动替换属性名, 形式loveMe -> love_me形式
 默认转化键id和description关键词到ID和desc属性名
 详见.m文件
 */
@interface PLBaseModel : NSObject

@end

NS_ASSUME_NONNULL_END
