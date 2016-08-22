//
//  RTClassA.h
//  RunTimeTest
//
//  Created by ZhaoYun on 16/8/5.
//  Copyright © 2016年 ZhaoYun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RTClassA : NSObject

@property(nonatomic,strong) NSString *str;

- (void)showClassName;
- (void)msgFowarding:(NSString *) str;
@end
