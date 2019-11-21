//
//  NSObject+Ext.m
//  Pods
//
//  Created by wang123405wang on 11/18/2019.
//

#import "NSObject+Ext.h"
#import <objc/runtime.h>

static char blockingKey = 'b';
static char loadedKey = 'l';
static char attachValueKey = 'a';

@implementation NSObject (Ext)

- (BOOL)isBlocking{
    NSNumber *value = objc_getAssociatedObject(self, &blockingKey);
    if (value == nil) {
        return NO;
    }
    return value.boolValue;
}

- (void)setBlocking:(BOOL)blocking{
    objc_setAssociatedObject(self, &blockingKey, @(blocking), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BOOL)isLoaded{
    NSNumber *value = objc_getAssociatedObject(self, &loadedKey);
    if (value == nil) {
        return NO;
    }
    return value.boolValue;
}

- (void)setLoaded:(BOOL)loaded{
    objc_setAssociatedObject(self, &loadedKey, @(loaded), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)attachValue{
    return objc_getAssociatedObject(self, &attachValueKey);
}

- (void)setAttachValue:(NSString *)attachValue{
    objc_setAssociatedObject(self, &attachValueKey, attachValue, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
