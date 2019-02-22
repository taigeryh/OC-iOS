//
//  Node.m
//  HuffmanCoding
//
//  Created by tyh on 2019/2/15.
//  Copyright © 2019 tyh. All rights reserved.
//

#import "Node.h"

@implementation Node

- (instancetype)initWithData:(Byte)data weight:(NSInteger)weight {
    if (self = [super init]) {
        self.data = data;
        self.weight = weight;
    }
    return self;
}

@end
