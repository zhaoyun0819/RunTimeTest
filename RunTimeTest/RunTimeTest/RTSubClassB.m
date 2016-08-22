//
//  RTSubClassB.m
//  RunTimeTest
//
//  Created by ZhaoYun on 16/8/5.
//  Copyright © 2016年 ZhaoYun. All rights reserved.
//

#import "RTSubClassB.h"

@implementation RTSubClassB

- (void)showClassName{
    NSLog(@"This is Class B");
    NSLog(@"%@",NSStringFromSelector(_cmd));
    NSLog(@"self:%@",[self class]);
    NSLog(@"fakesuper:%@",[super class]);
    NSLog(@"realsuper:%@",[self superclass]);
}

@end
