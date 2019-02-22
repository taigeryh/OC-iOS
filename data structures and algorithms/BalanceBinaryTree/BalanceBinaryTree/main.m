//
//  main.m
//  BalanceBinaryTree
//
//  Created by tyh on 2019/2/17.
//  Copyright © 2019 tyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BalanceBinaryTree.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        // 测试右旋转
//        NSArray *array = @[@8,@9,@6,@7,@5,@4];
        
        // 测试左旋转
//        NSArray *array = @[@2,@1,@4,@3,@5,@6];
        
        // 测试双旋转 ，先左
        NSArray *array = @[@8,@9,@5,@4,@6,@7];

        BalanceBinaryTree *tree = [[BalanceBinaryTree alloc] init];
        
        for (int i=0; i<array.count; i++) {
            NSNumber *item = array[i];
            Node * n = [[Node alloc] initWithValue:item.intValue];
            [tree add:n];
        }
        
        [tree middleShow];
        
        NSLog(@"高度 -= -= -= -= -= -");
        NSLog(@"%d",[tree.root height])
        ;
        
        NSLog(@"%d",tree.root.value);
    }
    return 0;
}
