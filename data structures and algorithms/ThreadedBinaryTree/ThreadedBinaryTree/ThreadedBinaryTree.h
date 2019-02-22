//
//  ThreadedBinaryTree.h
//  ThreadedBinaryTree
//
//  Created by tyh on 2019/2/15.
//  Copyright © 2019 tyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ThreadedNode.h"


NS_ASSUME_NONNULL_BEGIN

@interface ThreadedBinaryTree : NSObject

@property (nonatomic, strong, nullable) ThreadedNode *root;

- (void)frontShow ;
- (void)middleShow;
- (void)afterShow;

- (ThreadedNode *)frontSearch:(int)i;

- (void)delete:(int)i;


// 遍历线索二叉树
- (void)threadIterate;


// 中序线索化二叉树
- (void)threadNodes;

@end

NS_ASSUME_NONNULL_END
