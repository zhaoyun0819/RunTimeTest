//
//  RTClassA.m
//  RunTimeTest
//
//  Created by ZhaoYun on 16/8/5.
//  Copyright © 2016年 ZhaoYun. All rights reserved.
//

#import "RTClassA.h"
#import <objc/objc-runtime.h>

@implementation RTClassA

//- (void)showClassName{
//    NSLog(@"This is class A");
//}

- (void)msgFowarding:(NSString *) str{
    NSLog(@"Fowarding message:%@",str);
}

//动态方法解析，将dynamicMethodIMP方法动态绑定到一个没有实现的方法。
void dynamicMethodIMP(id self, SEL _cmd) {
    NSLog(@"TEST Dynamic bind");
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {

    if (sel == @selector(showClassName)) {
        class_addMethod([self class], sel,(IMP)dynamicMethodIMP,"v@:");
        return YES;
    }
    return [super resolveClassMethod:sel];
}



@end
