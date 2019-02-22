//
//  LoopNode.m
//  Node
//
//  Created by tyh on 2019/2/12.
//  Copyright © 2019 tyh. All rights reserved.
//

#import "LoopNode.h"

@implementation LoopNode

- (instancetype)initWithData:(int)data {
    if (self = [super initWithData:data]) {
        self.next = self;
    }
    return self;
}

@end
