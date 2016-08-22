//
//  main.m
//  RunTimeTest
//
//  Created by ZhaoYun on 16/8/5.
//  Copyright © 2016年 ZhaoYun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RTClassA.h"
#import "RTSubClassB.h"
#import "RTClassC.h"

@import ObjectiveC.runtime;

int main(int argc, const char * argv[]) {
    
    RTClassA *objectA = [[RTClassA alloc] init];
    [objectA showClassName];
    RTSubClassB *objectB = [[RTSubClassB alloc] init];
    [objectB showClassName];
    RTClassC *objectC = [[RTClassC alloc] init];
    [objectC showClassName];
    //获得一个对象的超类,超类的元类
    Class bClass = object_getClass(objectB);
    Class superBClass = class_getSuperclass(bClass);
    Class MetaBClass = objc_getMetaClass("RTSubClassB");
    NSLog(@"SuperClass of objectB: %@",superBClass);
    NSLog(@"MetaClass of objectB: %@",MetaBClass);
    
    //通过类名获得一个类
    id aClass = objc_getClass("RTClassA");
    //获得一个类拥有的property，以及类型
    unsigned int propertyCount;
    objc_property_t *properties = class_copyPropertyList(aClass, &propertyCount);
    for (int i = 0; i<propertyCount; i++) {
        NSLog(@"Name:%s,Attributes:%s",
              property_getName(properties[i]), property_getAttributes(properties[i]));
    }
    //获得一个类的某个已知的属性
    objc_property_t property = class_getProperty(aClass, "str");
    NSLog(@"Name:%s,Attributes:%s", property_getName(property), property_getAttributes(property));
    
    //获取一个方法的IMP,并且直接调用执行
    void (*show)(id , SEL);
    show =(void (*)(id, SEL))[objectB methodForSelector:@selector(showClassName)];
    show(objectB,@selector(showClassName));
    
    //消息转发
    [objectC msgFowarding:@"From ObjectC"];
    
    return 0;

}
