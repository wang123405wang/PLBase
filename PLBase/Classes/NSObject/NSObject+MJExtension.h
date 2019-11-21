//
//  NSObject+MJExtension.h
//  模型解析
//
//  Created by wang123405wang on 11/18/2019.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@interface NSObject (MJExtension)

+ (id)parse:(id)responseObj;
+ (NSDictionary *)objClassInArray;

//mj_replacedKeyFromPropertyName121:和replaceKeyFromPropertyName方法有冲突, 使用了前者,则后者失效. 选择只使用前者来做key和属性名对应操作.
+ (NSString *)replacedKeyFromPropertyName:(NSString *)propertyName;

@end

