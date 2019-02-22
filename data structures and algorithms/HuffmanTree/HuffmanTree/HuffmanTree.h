//
//  HuffmanTree.h
//  HuffmanTree
//
//  Created by tyh on 2019/2/15.
//  Copyright © 2019 tyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

NS_ASSUME_NONNULL_BEGIN

@interface HuffmanTree : NSObject

+ (Node*)createWithArray:(NSMutableArray<NSNumber*>*)array;

@end

NS_ASSUME_NONNULL_END
