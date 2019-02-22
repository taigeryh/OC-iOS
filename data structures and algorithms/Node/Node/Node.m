//
//  Node.m
//  Node
//
//  Created by tyh on 2019/2/12.
//  Copyright © 2019 tyh. All rights reserved.
//

#import "Node.h"

@implementation Node

- (instancetype)initWithData:(int)data {
    if (self = [super init]) {
        self.data = data;
    }
    return self;
}

- (void)append:(Node *)node {
    Node *current = self;
    while (true) {
        Node *nextnode = current.next;
        if (nextnode == nil) {
            break;
        }
        current = nextnode;
    }
    current.next = node;
    //    return self;
}

// 删除下一个节点
- (void)removeNext {
    Node *node = self.next.next;
    self.next = node;
}

- (BOOL)isLast {
    return self.next == nil;
}

- (NSString *)description {
    NSMutableArray *arr = [NSMutableArray array];
    Node *node = self;
    while (true) {
        [arr addObject:[NSString stringWithFormat:@"%d",node.data]];
        node = node.next;
        if (node == nil) {
            break;
        }
    }
    return arr.description;
}


// 插入一个节点，作为下一个节点
- (void)after:(Node *)node {
    Node *nextnext = self.next;
    self.next = node;
    node.next = nextnext;
}






@end
