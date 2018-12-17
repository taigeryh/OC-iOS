//
//  NSObject+AssociatedObject.m
//  runtime
//
//  Created by taiyh on 2018/12/14.
//  Copyright © 2018 taiyh. All rights reserved.
//

#import <objc/runtime.h>
#import "NSObject+AssociatedObject.h"

@implementation NSObject (AssociatedObject)

// @dynamic associatedObject;
// 注释了也能用
/*
 示例。其中也没有添加 @dynamic
 @interface UIImageView (_AFNetworking)
 
 */

- (void)setAssociatedObject:(id)associatedObject {
    objc_setAssociatedObject(self, @selector(associatedObject), associatedObject, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)associatedObject {
    return objc_getAssociatedObject(self, @selector(associatedObject));
}

@end
