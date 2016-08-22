//
//  RTClassC.h
//  RunTimeTest
//
//  Created by ZhaoYun on 16/8/5.
//  Copyright © 2016年 ZhaoYun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RTClassA.h"
@interface RTClassC : NSObject

@property(nonatomic,strong) RTClassA *objectA;

- (void)showClassName;
- (void)msgFowarding:(NSString *) str;
@end
