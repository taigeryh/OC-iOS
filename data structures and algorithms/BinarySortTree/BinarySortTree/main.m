//
//  main.m
//  BinarySortTree
//
//  Created by tyh on 2019/2/16.
//  Copyright © 2019 tyh. All rights reserved.
//


// 二叉排序树
/*
 添加
 遍历
 查找
 删除： 删除叶子节点，删除只有一个子节点的节点，删除有两个子节点的节点。
 */

#import <Foundation/Foundation.h>
#import "BinarySortTree.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSArray *array = @[@7,@3,@10,@12,@5,@1,@9];
        BinarySortTree *tree = [[BinarySortTree alloc] init];
        
        for (int i=0; i<array.count; i++) {
            NSNumber *item = array[i];
            Node * n = [[Node alloc] initWithValue:item.intValue];
            [tree add:n];
        }
        
        [tree middleShow];
        
        NSLog(@"查找 -=-=-=-=-=-=");
        Node *n = [tree search:11];
        NSLog(@"%@，%d",n,n.value);
        
        
        // 测试查找父节点
        n = [tree searchParent:9];
        NSLog(@"%@，%d",n,n.value);
        
        
//        NSLog(@"删除 -=-=-=-=-=-=");
//
//        // 测试删除叶子节点
//        [tree deleteValue:12];
//        [tree middleShow];
//        
//        // 测试删除只有一个子节点的节点
//        NSLog(@"删除 -=-=-=-=-=-=");
//        [tree deleteValue:10];
//        [tree middleShow];
//        
//        // 测试删除有两个子节点的节点
//        NSLog(@"删除 -=-=-=-=-=-=");
//        [tree deleteValue:3];
//        [tree middleShow];
        
        // 测试删除有两个子节点的节点
        NSLog(@"删除 -=-=-=-=-=-=");
        [tree deleteValue:7];
        [tree middleShow];
        
    }
    return 0;
}
