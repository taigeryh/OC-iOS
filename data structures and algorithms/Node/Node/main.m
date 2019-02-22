//
//  main.m
//  Node
//
//  Created by tyh on 2019/2/12.
//  Copyright © 2019 tyh. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Node.h"
#import "LoopNode.h"
#import "DoubleNode.h"





int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        // 单链表
        
        Node *n1 = [[Node alloc] initWithData:1];
        Node *n2 = [[Node alloc] initWithData:2];

        Node *n3 = [[Node alloc] initWithData:3];
        
        Node *n4 = [[Node alloc] initWithData:4];

        
        [n1 append:n2];
        [n1 append:n3];
        
        NSLog(@"%@",n1);
        
        [n1 removeNext];
        
        NSLog(@"%@",n1);
        
        [n1 after:n4];
        
        NSLog(@"%@",n1);

        
        
        
        // 循环链表
        LoopNode *n11 = [[LoopNode alloc] initWithData:11];
        LoopNode *n12 = [[LoopNode alloc] initWithData:12];
        
        LoopNode *n13 = [[LoopNode alloc] initWithData:13];
        
        LoopNode *n14 = [[LoopNode alloc] initWithData:14];
        
        
        [n11 after:n12];
        [n12 after:n13];
        [n13 after:n14];
        
        NSLog(@"%d",n11.next.data);
        NSLog(@"%d",n12.next.data);
        NSLog(@"%d",n13.next.data);
        NSLog(@"%d",n14.next.data);
        
        
        // 双向循环链表
        DoubleNode *n21 = [[DoubleNode alloc] initWithData:21];
        DoubleNode *n22 = [[DoubleNode alloc] initWithData:22];
        
        DoubleNode *n23 = [[DoubleNode alloc] initWithData:23];

        [n21 after:n22];
        [n22 after:n23];
        
        NSLog(@"-=-=-=-=-=-=");
        NSLog(@"%d,%d",n21.pre.data,n21.next.data);
        NSLog(@"%d,%d",n22.pre.data,n22.next.data);

        NSLog(@"%d,%d",n23.pre.data,n23.next.data);


    }
    return 0;
}
