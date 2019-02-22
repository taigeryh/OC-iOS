
//
//  Node.m
//  BinarySortTree
//
//  Created by tyh on 2019/2/16.
//  Copyright © 2019 tyh. All rights reserved.
//

#import "Node.h"

@implementation Node

- (instancetype)initWithValue:(int)value {
    if (self = [super init]) {
        self.value = value;
    }
    return self;
}

- (int)height {
    // 递归
    return MAX((self.leftNode == nil)?0:[self.leftNode height], (self.rightNode == nil)?0:[self.rightNode height]) + 1;
}

// 左子树的高度
- (int)leftHeight {
    if (self.leftNode) {
        return [self.leftNode height];
    }
    return 0;
}

// 右子树的高度
- (int)rightHeight {
    if (self.rightNode) {
        return [self.rightNode height];
    }
    return 0;
}

- (void)add:(Node*)node {
    if (node == nil) {
        return;
    }
    // 比当前值小
    if (node.value < self.value) {
        // 如果左节点为空
        if (self.leftNode == nil) {
            self.leftNode = node;
        } else {
            [self.leftNode add:node];
        }
        
    } else {
        
        // 如果右节点为空
        if (self.rightNode == nil) {
            self.rightNode = node;
        } else {
            [self.rightNode add:node];
        }
    }
    
    
    // 平衡二叉树，查询是否平衡。
    // 左子树高度大于右子树高度+2.向右旋转。
    if ([self leftHeight] - [self rightHeight] >= 2) {
        
        // 双旋转
        if (self.leftNode && [self.leftNode leftHeight]<[self.leftNode rightHeight]) {
            [self.leftNode leftRotate];
            [self rightRotate];
        } else {
            // 单右旋转。
            [self rightRotate];

        }
    }
    
    // 左旋转
    if ([self leftHeight] - [self rightHeight] <= -2) {
        if (self.rightNode && [self.rightNode rightHeight]<[self.rightNode leftHeight]) {
            [self.rightNode rightRotate];
            [self leftRotate];

        } else {
            [self leftRotate];

        }
    }
}


// 右旋转
- (void)rightRotate {
    // 1，创建一个新节点，值等于当前节点的值。
    Node *node = [[Node alloc] initWithValue:self.value];
    // 2. 新节点的右子树 设置为当前节点的右子树。
    node.rightNode = self.rightNode;
    // 3. 把新节点的左子树，设置为（当前节点的左子树的右子树）。
    node.leftNode = self.leftNode.rightNode;
    // 4. 把当前节点的值，设置成左子节点的值.
    self.value = self.leftNode.value;
    // 5. 当前节点的左子树，设置成左子树的左子树。
    self.leftNode = self.leftNode.leftNode;
    // 6. 当前节点的右子树，设置成新节点。
    self.rightNode = node;
    
}

// 左旋转
- (void)leftRotate {
    // 1，创建一个新节点，值等于当前节点的值。
    Node *node = [[Node alloc] initWithValue:self.value];
    // 2. 新节点的右子树 设置为当前节点的右子树。
    node.leftNode = self.leftNode;
    // 3. 把新节点的左子树，设置为（当前节点的左子树的右子树）。
    node.rightNode = self.rightNode.leftNode;
    // 4. 把当前节点的值，设置成左子节点的值.
    self.value = self.rightNode.value;
    // 5. 当前节点的左子树，设置成左子树的左子树。
    self.rightNode = self.rightNode.rightNode;
    // 6. 当前节点的右子树，设置成新节点。
    self.leftNode = node;
    
}


- (void)middleShow:(Node*)node {
    if (node == nil) {
        return;
    }
    
    [self middleShow:node.leftNode];
    NSLog(@"%d",node.value);
    [self middleShow:node.rightNode];
}


- (Node*)search:(int)value {
    Node *target = nil;

    if (self.value == value) {
        return self;
    }
    
    if (self.value < value) {
        target = [self.rightNode search:value];
    }
    if (self.value > value) {
        target = [self.leftNode search:value];
    }
    
    return target;
}

- (Node *)searchParent:(int)value {
    
    if ((self.leftNode && self.leftNode.value == value) || (self.rightNode && self.rightNode.value == value)) {
        return self;
    } else {
        if (self.value < value && self.rightNode) {
            return [self.rightNode searchParent:value];
        } else if (self.value > value && self.leftNode) {
            return [self.leftNode searchParent:value];
        }
    }
    
    return nil;
}

@end
