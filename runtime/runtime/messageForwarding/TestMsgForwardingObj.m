//
//  TestMsgForwardingObj.m
//  runtime
//
//  Created by taiyh on 2018/12/18.
//  Copyright © 2018 taiyh. All rights reserved.
//

#import "TestMsgForwardingObj.h"
#import <objc/runtime.h>
#import "Warrior.h"
#import "Diplomat.h"


@implementation TestMsgForwardingObj

- (void)log1 {
    NSLog(@"log1");
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    
    NSLog(@"resolveInstanceMethod:  %@", NSStringFromSelector(sel));
//    if (sel == @selector(log2)) {
//        class_addMethod([self class], sel, (IMP)log2, "V@:");
//        return YES;
//    }
    return [super resolveInstanceMethod:sel];
    
}

+ (BOOL)resolveClassMethod:(SEL)sel {
    NSLog(@"%s",__func__);
    return NO;
}


- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"forwardingTargetForSelector:  %@", NSStringFromSelector(aSelector));
    Warrior *warrior = [[Warrior alloc] init];
    if ([warrior respondsToSelector: aSelector]) {
        return warrior;
    }
    return [super forwardingTargetForSelector: aSelector];
}


- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"forwardInvocation: %@", NSStringFromSelector([anInvocation selector]));
    if ([anInvocation selector] == @selector(DiplomatLog)) {
        Diplomat *diplomat = [[Diplomat alloc] init];
        [anInvocation invokeWithTarget:diplomat];
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSLog(@"method signature for selector: %@", NSStringFromSelector(aSelector));
    if (aSelector == @selector(DiplomatLog)) {
        return [NSMethodSignature signatureWithObjCTypes:"V@:@"];
    }
    return [super methodSignatureForSelector:aSelector];
}


- (void)doesNotRecognizeSelector:(SEL)aSelector {
    NSLog(@"doesNotRecognizeSelector: %@", NSStringFromSelector(aSelector));
     [super doesNotRecognizeSelector:aSelector];
}

@end
