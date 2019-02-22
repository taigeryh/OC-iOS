//
//  main.m
//  Febonacci
//
//  Created by tyh on 2019/2/12.
//  Copyright © 2019 tyh. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        // 1,1,2,3,5,8,13...
        
        NSLog(@"%d", febonacci(7));
        
    }
    return 0;
}

int febonacci(int i) {
    if (i == 1 || i == 2) {
        return 1;
    } else {
        return febonacci(i-1) + febonacci(i-2);
    }
}


