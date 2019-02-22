//
//  main.m
//  ThreadedBinaryTree
//
//  Created by tyh on 2019/2/15.
//  Copyright © 2019 tyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ThreadedBinaryTree.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        // 创建空树
        ThreadedBinaryTree *tree = [[ThreadedBinaryTree alloc] init];
        
        // 创建根节点
        ThreadedNode *root = [[ThreadedNode alloc] initWithVlaue:1];
        
        tree.root = root;
        
        // 创建跟节点的子节点
        ThreadedNode *rootL = [[ThreadedNode alloc] initWithVlaue:2];
        ThreadedNode *rootR = [[ThreadedNode alloc] initWithVlaue:3];
        //
        root.leftNode = rootL;
        root.rightNode = rootR;
        
        // 继续创建下一层
        rootL.leftNode = [[ThreadedNode alloc] initWithVlaue:4];
        rootL.rightNode = [[ThreadedNode alloc] initWithVlaue:5];
        rootR.leftNode = [[ThreadedNode alloc] initWithVlaue:6];
        rootR.rightNode = [[ThreadedNode alloc] initWithVlaue:7];
        
        
        //
        [tree middleShow];
        NSLog(@"-------");
        [tree threadNodes ];
        [tree threadIterate];
        
    }
    return 0;
}
