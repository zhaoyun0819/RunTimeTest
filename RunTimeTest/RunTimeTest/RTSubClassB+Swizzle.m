//
//  RTSubClassB+Swizzle.m
//  RunTimeTest
//
//  Created by ZhaoYun on 16/8/5.
//  Copyright © 2016年 ZhaoYun. All rights reserved.
//

#import "RTSubClassB+Swizzle.h"

@import ObjectiveC.runtime;

@implementation RTSubClassB (Swizzle)

- (instancetype)init {
    self = [super init];
    if (self) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            Class class = [self class];
            SEL originalSelector = @selector(showClassName);
            SEL swizzledSelector = @selector(swizzleShowMyName);
            Method originalMethod = class_getInstanceMethod(class, originalSelector);
            Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
            BOOL didAddMethod =
            class_addMethod(class,
                            originalSelector,
                            method_getImplementation(swizzledMethod),
                            method_getTypeEncoding(swizzledMethod));
            if (didAddMethod) {
                class_replaceMethod(class,
                                    swizzledSelector,
                                    method_getImplementation(originalMethod),
                                    method_getTypeEncoding(originalMethod));
            } else {
                method_exchangeImplementations(originalMethod, swizzledMethod);
            }
 
        });
    }
    return self;
}

#pragma mark - Method Swizzling
- (void)swizzleShowMyName {
    NSLog(@"This is SubClassB");
}

@end
