//
//  ThreadedNode.h
//  ThreadedBinaryTree
//
//  Created by tyh on 2019/2/15.
//  Copyright © 2019 tyh. All rights reserved.
//

// 线索二叉树

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ThreadedNode : NSObject

@property int value;

@property (nonatomic, strong, nullable) ThreadedNode *leftNode;
@property (nonatomic, strong, nullable) ThreadedNode *rightNode;

// 标识指针类型
@property int leftType;
@property int rightType;


-(instancetype)initWithVlaue:(int)value;
// 前序遍历
- (void)frontShow ;
// 中序遍历
- (void)middleShow;
// 后续序遍历
- (void)afterShow;


- (ThreadedNode *)frontSearch:(int)i;

- (void)delete:(int)i;


@end

NS_ASSUME_NONNULL_END
