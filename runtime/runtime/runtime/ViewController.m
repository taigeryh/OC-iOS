//
//  ViewController.m
//  runtime
//
//  Created by taiyh on 2018/12/14.
//  Copyright © 2018 taiyh. All rights reserved.
//

#import "ViewController.h"

#import "NSObject+AssociatedObject.h"
#import "MethodSwizzlingObject.h"
#import "TestMsgForwardingObj.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self forwardMsg];
    

}

- (void)associateObj {
    NSObject *obj = [[NSObject alloc] init];
    obj.associatedObject = @"1";
    
    NSLog(@"%@", obj.associatedObject);
}

- (void)forwardMsg {
    TestMsgForwardingObj *obj3 = [[TestMsgForwardingObj alloc ] init];
    
    // 1
    // TestMsgForwardingObj 分发表中有 log1 方法，所以不会调用 resolveInstanceMethod: 方法
    [obj3 performSelector:@selector(log1)];
    
    // 2
    // TestMsgForwardingObj 分发表中没有 log2 方法，所以会调用 resolveInstanceMethod: 方法
    // [obj3 performSelector:@selector(log2)];
    
    
    // 3
    // TestMsgForwardingObj 分发表中没有 WarriorLog 方法
    // 先调用 resolveInstanceMethod: 方法，还是没有
    // 再调用 forwardingTargetForSelector: 方法，并将消息转移发给 Warrior
    [obj3 performSelector:@selector(WarriorLog)];
    
    
    // 4
    // TestMsgForwardingObj 分发表中没有 DiplomatLog 方法
    // 先调用 resolveInstanceMethod: 方法，还是没有
    // 再调用 forwardingTargetForSelector: 方法，还是没有
    // 再调用 methodSignatureForSelector:
    // 再调用 resolveInstanceMethod: 第二遍调用。
    // 再调用 forwardInvocation: 方法，并将消息转发给 Diplomat
    [obj3 performSelector:@selector(DiplomatLog)];
    
    
    // 5
    // TestMsgForwardingObj 分发表中没有 NoExistLog 方法
    // 先调用 resolveInstanceMethod: 方法，还是没有
    // 再调用 forwardingTargetForSelector: 方法，还是没有
    // 再调用 methodSignatureForSelector:
    // 再调用 resolveInstanceMethod: 第二遍调用。
    // 再调用 doesNotRecognizeSelector:
    //  报 EXC_BAD_INSTRUCTION 错误指令。
    [obj3 performSelector:@selector(NoExistLog)];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}


@end
