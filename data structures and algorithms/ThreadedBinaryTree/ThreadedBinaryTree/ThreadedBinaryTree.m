//
//  ThreadedBinaryTree.m
//  ThreadedBinaryTree
//
//  Created by tyh on 2019/2/15.
//  Copyright © 2019 tyh. All rights reserved.
//

#import "ThreadedBinaryTree.h"


@interface ThreadedBinaryTree ()

// 临时存储前驱节点
@property (nonatomic,strong) ThreadedNode *pre;

@end

@implementation ThreadedBinaryTree


// 遍历线索二叉树
- (void)threadIterate {
    // 当前遍历节点
    ThreadedNode *node = self.root;
    while (node != nil) {
        //循环找到最开始的节点
        
        while (node.leftType == 0) {
            node=node.leftNode;
        }
        // 打印当前节点的值
        NSLog(@"%d",node.value);
        
        //如果当前节点的右指针指向的是后继结点，可能后继结点还有后继结点。
        while (node.rightType == 1) {
            node=node.rightNode;
            NSLog(@"%d",node.value);
        }
        // 替换遍历节点
        
        node = node.rightNode;
    }
}



// 中序线索化二叉树
- (void)threadNodes {
    [self threadNodes:self.root];
    
}

- (void)threadNodes:(ThreadedNode *)node {
    
    // 为空不处理
    if (node == nil) {
        return;
    }
    
    // 处理左子树
    [self threadNodes:node.leftNode];
    
    // 处理前驱节点。
    if (node.leftNode == nil) {
        // 当前节点的左指针指向前驱节点。
        node.leftNode = self.pre;
        node.leftType = 1;
    }
    
    // 处理前驱节点的右指针，如果前驱节点的右指针是null （没有右子树）
    if (self.pre != nil && self.pre.rightNode == nil) {
        // 前驱节点的右指针指向当前节点
        self.pre.rightNode = node;
        // 改变前驱节点的右指针类型。
        self.pre.rightType = 1;
    }
    
    // 没处理一个节点，当前节点是下一个节点的前驱节点。
    self.pre = node;
    
    // 处理右子树
    [self threadNodes:node.rightNode];
    
}



- (void)frontShow {
    [self.root frontShow];
}

- (void)middleShow {
    [self.root middleShow];
}

- (void)afterShow {
    [self.root afterShow];
}


- (ThreadedNode *)frontSearch:(int)i {
    
    return [self.root frontSearch:i];
}

- (void)delete:(int)i {
    if (self.root.value == i) {
        self.root = nil;
    } else {
        [self.root delete:i];
    }
}


@end
