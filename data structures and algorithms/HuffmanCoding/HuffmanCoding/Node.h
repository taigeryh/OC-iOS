//
//  Node.h
//  HuffmanCoding
//
//  Created by tyh on 2019/2/15.
//  Copyright © 2019 tyh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Node : NSObject

@property Byte data;
@property NSInteger weight;
@property (nonatomic, strong, nullable) Node *left;
@property (nonatomic, strong, nullable) Node *right;

- (instancetype)initWithData:(Byte)data weight:(NSInteger)weight;

@end

NS_ASSUME_NONNULL_END
