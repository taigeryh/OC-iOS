//
//  BinarySortTree.h
//  BinarySortTree
//
//  Created by tyh on 2019/2/16.
//  Copyright © 2019 tyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

NS_ASSUME_NONNULL_BEGIN

@interface BinarySortTree : NSObject

@property (nonatomic, strong) Node *root;
- (void)add:(Node*)node;
- (void)middleShow ;

- (Node*)search:(int)value;
- (Node*)searchParent:(int)value;
- (void)deleteValue:(int)value;
@end

NS_ASSUME_NONNULL_END
