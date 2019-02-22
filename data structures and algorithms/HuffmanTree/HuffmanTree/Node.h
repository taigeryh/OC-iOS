//
//  Node.h
//  HuffmanTree
//
//  Created by tyh on 2019/2/15.
//  Copyright © 2019 tyh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Node : NSObject

@property int value;
@property (nonatomic, strong, nullable) Node *leftNode;
@property (nonatomic, strong, nullable) Node *rightNode;

- (instancetype)initWithValue:(int)value;

@end

NS_ASSUME_NONNULL_END
