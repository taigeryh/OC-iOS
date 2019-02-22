//
//  main.m
//  HuffmanTree
//
//  Created by tyh on 2019/2/15.
//  Copyright © 2019 tyh. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HuffmanTree.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        //         {3,7,8,29,5,11,23,14}

        NSLog(@"Hello, World!");
        
        NSMutableArray *array = [NSMutableArray arrayWithObjects:
                                 @3,@7,@8,@29,@5,@11,@23,@14, nil];
        
        Node *n = [HuffmanTree createWithArray:array];
        
        NSLog(@"%d",n.value);
    }
    return 0;
}
