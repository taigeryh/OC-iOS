//
//  main.m
//  Hanoi
//
//  Created by tyh on 2019/2/12.
//  Copyright © 2019 tyh. All rights reserved.
//

#import <Foundation/Foundation.h>

/// n个盘子
/// from 开始的柱子， mid 中间的柱子， to 目标柱子

/// 无论有多少个盘子，都认为只有两个盘子，最下面的一个，和他上面的n个整体。
void hanoi(int n, char from, char mid, char to) {
    if (n == 1) {
        NSLog(@"第1个盘子从%c移到%c",from,to);
    }else {
        // 上面的整体
        hanoi(n-1, from, to, mid);
        
        // 移动最下面的一个盘子
        NSLog(@"第%d个盘子从%c移到%c",n,from,to);
        
        // 在移动上面的整体
        hanoi(n-1, mid, from, to);
        
        
        
    }
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
    }
    
    hanoi(3, 'A', 'B', 'C');

    return 0;
}



