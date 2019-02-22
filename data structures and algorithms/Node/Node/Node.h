//
//  Node.h
//  Node
//
//  Created by tyh on 2019/2/12.
//  Copyright © 2019 tyh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Node : NSObject

@property int data;
@property (nonatomic, weak) Node *next;

- (instancetype)initWithData:(int)data;
- (void)append:(Node *)node;

// 删除下一个节点
- (void)removeNext;

- (BOOL)isLast;
// 插入一个节点，作为下一个节点
- (void)after:(Node *)node;

@end

NS_ASSUME_NONNULL_END
