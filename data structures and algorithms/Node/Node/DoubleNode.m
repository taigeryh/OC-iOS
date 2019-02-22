//
//  DoubleNode.m
//  Node
//
//  Created by tyh on 2019/2/12.
//  Copyright © 2019 tyh. All rights reserved.
//

#import "DoubleNode.h"

@implementation DoubleNode

- (instancetype)initWithData:(int)data {
    if (self = [super init]) {
        self.pre = self;
        self.next = self;
        self.data = data;
    }
    return self;
}

- (void)after:(DoubleNode*) node {
    DoubleNode *nextnext = self.next;
    self.next = node;
    node.pre = self;

    node.next = nextnext;    
    nextnext.pre = node;
}

@end
