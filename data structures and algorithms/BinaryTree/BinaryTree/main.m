//
//  main.m
//  BinaryTree
//
//  Created by tyh on 2019/2/15.
//  Copyright © 2019 tyh. All rights reserved.
//

// 二叉树，链式存储结构。

#import <Foundation/Foundation.h>

@interface TreeNode : NSObject

// 节点的权
@property (assign) int value;

// 左子节点
@property (nonatomic,strong) TreeNode *leftNode;
// 右子节点
@property (nonatomic, strong) TreeNode *rightNode;

// 前序遍历
- (void)frontShow ;
// 中序遍历
- (void)middleShow;
// 后续序遍历
- (void)afterShow;


- (TreeNode *)frontSearch:(int)i;

- (void)delete:(int)i;

@end

@implementation TreeNode

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

- (TreeNode *)frontSearch:(int)i {
    TreeNode *target = nil;
    
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
    TreeNode *parent = self;
    
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


@interface BinaryTree : NSObject

@property (nonatomic,strong) TreeNode *root;

- (void)frontShow ;
- (void)middleShow;
- (void)afterShow;

- (TreeNode *)frontSearch:(int)i;

- (void)delete:(int)i;

@end

@implementation BinaryTree

- (void)frontShow {
    [self.root frontShow];
}

- (void)middleShow {
    [self.root middleShow];
}

- (void)afterShow {
    [self.root afterShow];
}


- (TreeNode *)frontSearch:(int)i {

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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        
        // 创建空树
        BinaryTree *tree = [[BinaryTree alloc] init];
        
        // 创建根节点
        TreeNode *root = [[TreeNode alloc] initWithVlaue:1];
        
        tree.root = root;
        
        // 创建跟节点的子节点
        TreeNode *rootL = [[TreeNode alloc] initWithVlaue:2];
        TreeNode *rootR = [[TreeNode alloc] initWithVlaue:3];
        //
        root.leftNode = rootL;
        root.rightNode = rootR;
        
        // 继续创建下一层
        rootL.leftNode = [[TreeNode alloc] initWithVlaue:4];
        rootL.rightNode = [[TreeNode alloc] initWithVlaue:5];
        rootR.leftNode = [[TreeNode alloc] initWithVlaue:6];
        rootR.rightNode = [[TreeNode alloc] initWithVlaue:7];
        
        [tree frontShow];
        NSLog(@"------------------");
        [tree middleShow];
        NSLog(@"------------------");
        [tree afterShow];
        NSLog(@"------------------");
        
        
        // 前序查找
        TreeNode *result = [tree frontSearch:11];
        NSLog(@"%@",result);
        
        NSLog(@"------------------");

        
        // 删除子树
        [tree delete:2];
        [tree frontShow];
    }
    return 0;
}
