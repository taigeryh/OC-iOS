//
//  HuffmanTree.m
//  HuffmanTree
//
//  Created by tyh on 2019/2/15.
//  Copyright © 2019 tyh. All rights reserved.
//

#import "HuffmanTree.h"

@implementation HuffmanTree

+ (Node*)createWithArray:(NSMutableArray<NSNumber*>*)array {
    // 使用数组中所有的元素创建若干个二叉树(只有一个节点)
    NSMutableArray *nodes = [NSMutableArray array];
    for (NSNumber *p in array) {
        [nodes addObject:[[Node alloc] initWithValue: p.intValue]];
    }
    

    while (nodes.count > 1) {
        // 排序
        [nodes sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            Node *o1 = (Node*)obj1;
            Node *o2 = (Node*)obj2;
            // 从大到小
            return (o1.value > o2.value)?NSOrderedAscending:NSOrderedDescending;
        }];
        // 取出权值最小的两个二叉树
        Node *left = nodes[nodes.count-1];
        Node *right = nodes[nodes.count-2];
        
        // 创建新的二叉树
        Node *parent = [[Node alloc] initWithValue:left.value+right.value ];
        
        // 把原来的两个二叉树移除。
        [nodes removeObject:left];
        [nodes removeObject:right];
        
        // 放入原来的二叉树集合中。
        [nodes addObject:parent];
    }
    
    return nodes[0];

}


@end
