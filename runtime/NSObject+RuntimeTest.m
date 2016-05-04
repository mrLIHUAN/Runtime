//
//  NSObject+RuntimeTest.m
//  runtime
//
//  Created by apple on 16/5/4.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "NSObject+RuntimeTest.h"

#import <objc/runtime.h>
#import "CustomClass.h"

@implementation NSObject (RuntimeTest)

-(id)testRunTime:(NSString *)classname age:(NSString *)age{
    
    unsigned int propertyCount = 0;
    
    objc_property_t *propertys = class_copyPropertyList([self class], &propertyCount);
    for (unsigned int i = 0; i < propertyCount; i++) {
        
        objc_property_t property = propertys[i];
        //获取成员的名称
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        
        NSLog(@"propertyName = %@ -- 成员名称",propertyName);
        //获取成员内容的Ivar
        Ivar ivar = class_getInstanceVariable([self class], [propertyName UTF8String]);
        
        if (ivar == nil) {
            ivar = class_getInstanceVariable([self class], [[NSString stringWithFormat:@"_%@",propertyName] UTF8String]);
        }
        
        id propertyVal = object_getIvar(self, ivar);
        NSLog(@"propertyVal = %@ --值",propertyVal);
        
        
        Class varClass = NSClassFromString(classname);
        id varobj = [[varClass alloc]init];
        
        [varobj test];
        
        Ivar ivarObj = class_getInstanceVariable(varClass, [@"_age" UTF8String]);
        object_setIvar(varobj, ivarObj, age);
        
        
        
        return varobj;
        
        
        
    }
    
    return nil;
    

}

@end
