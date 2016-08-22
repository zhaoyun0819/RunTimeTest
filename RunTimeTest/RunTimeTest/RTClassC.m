//
//  RTClassC.m
//  RunTimeTest
//
//  Created by ZhaoYun on 16/8/5.
//  Copyright © 2016年 ZhaoYun. All rights reserved.
//

#import "RTClassC.h"

@implementation RTClassC

//- (void)showClassName{
//    NSLog(@"This is Class C");
//

- (instancetype)init{
    self = [super init];
    if (self) {
        _objectA = [[RTClassA alloc] init];
    }
    return self;
}
//实现重定向，将消息接受者替换为别的对象。
- (id)forwardingTargetForSelector:(SEL)aSelector{
    if(aSelector == @selector(showClassName)){
        return _objectA;
    }
    return [super forwardingTargetForSelector:aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSString *sel = NSStringFromSelector(aSelector);
    if( [sel isEqualToString:@"msgFowarding:"]){
        return [NSMethodSignature signatureWithObjCTypes:"v@:@"];
    } else {
        return [super methodSignatureForSelector:aSelector];
    }
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    SEL selector = [anInvocation selector];
    
    if ([_objectA respondsToSelector:selector]){
        [anInvocation invokeWithTarget:_objectA];
    }
}
@end
