//
//  Node.h
//  BinarySortTree
//
//  Created by tyh on 2019/2/16.
//  Copyright © 2019 tyh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Node : NSObject

@property int value;
@property (nonatomic, strong, nullable) Node *leftNode;
@property (nonatomic, strong, nullable) Node *rightNode;

- (instancetype)initWithValue:(int)value;
- (void)add:(Node*)node;
- (void)middleShow:(Node*)node;
- (Node*)search:(int)value;

// 查找父节点
- (Node *)searchParent:(int)value ;


// 高度
- (int)height ;

@end

NS_ASSUME_NONNULL_END
