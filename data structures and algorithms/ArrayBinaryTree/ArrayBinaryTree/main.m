//
//  main.m
//  ArrayBinaryTree
//
//  Created by tyh on 2019/2/15.
//  Copyright © 2019 tyh. All rights reserved.
//

// 线性存储的 二叉树。

#import <Foundation/Foundation.h>


@interface ArrayBinaryTree : NSObject
@property (nonatomic,strong) NSArray *data;

- (instancetype)initWithArray:(NSArray *)array;
- (void)frontShow:(NSInteger)index;
- (void)frontShow;

@end

@implementation ArrayBinaryTree

- (instancetype)initWithArray:(NSArray *)array {
    if (self = [super init]) {
        self.data = [[NSArray alloc] initWithArray:array];
    }
    return self;
}

- (void)frontShow {
    [self frontShow:0];
}

// 前序遍历
- (void)frontShow:(NSInteger)index {
    if (self.data == nil || self.data.count == 0) {
        return;
    }
    
    // 先遍历当前节点的内容
    NSLog(@"%@",self.data[index]);
    
    // 2*index+1 左子树
    if (2*index+1 < self.data.count) {
        [self frontShow:2*index+1];
    }
    
    // 2*index+2 右子树
    if (2*index+2 < self.data.count) {
        [self frontShow:2*index+2];
    }
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSArray * array = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7", nil];
        ArrayBinaryTree *tree = [[ArrayBinaryTree  alloc] initWithArray:array];
        [tree frontShow];
    }
    return 0;
}
