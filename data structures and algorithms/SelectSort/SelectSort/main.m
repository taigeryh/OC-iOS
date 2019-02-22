//
//  main.m
//  SelectSort
//
//  Created by tyh on 2019/2/14.
//  Copyright © 2019 tyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SelectSort : NSObject

@end

@implementation SelectSort

+ (void)sort:(NSMutableArray<NSNumber*>*)array {
    // 遍历所有的数
    for (int i=0; i<array.count; i++) {
        int minIndex = i;
        // 当前数和后面所有的数依次进行比较，并记录最小数的下标。
        for (int j=i+1; j<array.count; j++) {
            if (array[minIndex].integerValue > array[j].integerValue) {
                minIndex=j;
            }
        }
        
        if (i != minIndex) {
            NSNumber *t = array[i];
            array[i] = array[minIndex];
            array[minIndex] = t;
        }
    }
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSMutableArray *arr = [NSMutableArray arrayWithObjects:@3,@4,@5,@7,@1,@2,@0,@3,@6,@8, nil];
        [SelectSort sort:arr];
        
        NSLog(@"%@",arr);
    }
    return 0;
}
