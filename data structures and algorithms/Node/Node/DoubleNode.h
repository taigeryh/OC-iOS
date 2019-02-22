//
//  DoubleNode.h
//  Node
//
//  Created by tyh on 2019/2/12.
//  Copyright © 2019 tyh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DoubleNode : NSObject


@property (nonatomic, weak) DoubleNode *pre;
@property (nonatomic, weak) DoubleNode *next;
@property int data;

- (instancetype)initWithData:(int)data;
- (void)after:(DoubleNode*) node;

@end

NS_ASSUME_NONNULL_END
