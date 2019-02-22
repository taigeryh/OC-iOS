//
//  ThreadedNode.m
//  ThreadedBinaryTree
//
//  Created by tyh on 2019/2/15.
//  Copyright © 2019 tyh. All rights reserved.
//

#import "ThreadedNode.h"

@implementation ThreadedNode


-(instancetype)initWithVlaue:(int)value {
    if (self = [super init]) {
        self.value = value;
    }
    return self;
}

// 前序遍历
- (void)frontShow {
    // 当前节点
    NSLog(@"%d",self.value);
    
    // 左节点
    if (_leftNode) {
        [_leftNode frontShow];
    }
    
    // 右节点
    if (_rightNode) {
        [_rightNode frontShow];
    }
    
}

// 中序遍历
- (void)middleShow {
    
    
    // 左节点
    if (_leftNode) {
        [_leftNode middleShow];
    }
    
    // 当前节点
    NSLog(@"%d",self.value);
    
    // 右节点
    if (_rightNode) {
        [_rightNode middleShow];
    }
    
}


// 后续序遍历
- (void)afterShow {
    
    
    // 左节点
    if (_leftNode) {
        [_leftNode afterShow];
    }
    
    // 右节点
    if (_rightNode) {
        [_rightNode afterShow];
    }
    
    // 当前节点
    NSLog(@"%d",self.value);
    
}

- (ThreadedNode *)frontSearch:(int)i {
    ThreadedNode *target = nil;
    
    if (self.value == i) {
        return self;
    } else {
        if (self.leftNode) {
            target = [self.leftNode frontSearch:i];
        }
        if (target) {
            return target;
        }
        
        if (self.rightNode) {
            target = [self.rightNode frontSearch:i];
        }
    }
    
    return target;
}


// 删除子树
- (void)delete:(int)i {
    ThreadedNode *parent = self;
    
    // 判断左节点
    if (parent.leftNode && parent.leftNode.value == i) {
        parent.leftNode = nil;
        return;
    }
    // 判断右节点
    if (parent.rightNode && parent.rightNode.value == i) {
        parent.rightNode = nil;
        return;
    }
    
    // 向下递归
    parent = self.leftNode;
    if (parent) {
        [parent delete:i];
    }
    
    parent = self.rightNode;
    if (parent) {
        [parent delete:i];
    }
}

@end
