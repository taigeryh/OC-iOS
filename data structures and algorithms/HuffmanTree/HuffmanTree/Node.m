//
//  Node.m
//  HuffmanTree
//
//  Created by tyh on 2019/2/15.
//  Copyright © 2019 tyh. All rights reserved.
//

#import "Node.h"

@implementation Node

- (instancetype)initWithValue:(int)value {
    if (self = [super init]) {
        self.value = value;
    }
    return self;
}


- (NSString *)description {
    return [NSString stringWithFormat:@"%d", self.value];
}

@end
