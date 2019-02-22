//
//  BalanceBinaryTree.m
//  BalanceBinaryTree
//
//  Created by tyh on 2019/2/17.
//  Copyright © 2019 tyh. All rights reserved.
//

#import "BalanceBinaryTree.h"

@implementation BalanceBinaryTree

- (void)add:(Node*)node {
    if (self.root == nil) {
        self.root = node;
    } else {
        [self.root add:node];
    }
}

- (void)middleShow {
    if (self.root) {
        [self.root middleShow:self.root];
    }
}

- (Node*)search:(int)value {
    Node *node = nil;
    if (self.root) {
        node = [self.root search:value];
    }
    return node;
}

- (Node*)searchParent:(int)value {
    if (self.root) {
        return [self.root searchParent:value];
    }
    return nil;
}

- (int)deleteMin:(Node*)node {
    Node* target = node;
    
    // 递归向左找
    while (target.leftNode != nil) {
        target = node.leftNode;
    }
    // 删除这个节点
    [self deleteValue:target.value];
    
    return target.value;
}

- (void)deleteValue:(int)value {
    if (self.root == nil) {
        return;
    } else {
        // 找到这个点
        Node *targe = [self search:value];
        // 如果没有这个点
        if (targe == nil) {
            return;
        }
        
        // 找到父节点
        Node *parent = [self searchParent:value];
        
        // 1, 要删除的节点是叶子节点
        if (targe.leftNode == nil && targe.rightNode == nil) {
            // 要删除的节点是父节点的左子节点
            if (parent.leftNode == targe) {
                parent.leftNode = nil;
            } else {
                // 要删除的节点是父节点的右子节点
                parent.rightNode = nil;
            }
        }
        // 3. 要删除的节点有两个子节点
        else if(targe.leftNode != nil && targe.rightNode != nil) {
            // 3.1 删除右子树中，值最小的节点，删除最小的节点。
            int min = [self deleteMin:targe.rightNode];
            // 3.2 替换目标节点的值
            targe.value = min;
        }
        // 2. 要删除的节点只有一个子节点
        else {
            // 有左子节点
            if (targe.leftNode != nil) {
                // 要删除的节点是父节点的左子节点
                if (parent.leftNode.value == value) {
                    parent.leftNode = targe.leftNode;
                } else {
                    // 要删除的节点是父节点的右子节点
                    parent.rightNode = targe.leftNode;
                }
            }
            // 有右子节点
            else {
                
                // 要删除的节点是父节点的左子节点
                if (parent.leftNode.value == value) {
                    parent.leftNode = targe.rightNode;
                } else {
                    // 要删除的节点是父节点的右子节点
                    parent.rightNode = targe.rightNode;
                }
                
            }
        }
        
        
    }
    
}

@end
