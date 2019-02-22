//
//  main.m
//  RadixSort
//
//  Created by tyh on 2019/2/15.
//  Copyright © 2019 tyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RadixSort : NSObject



@end

@implementation RadixSort

+ (void)sort:(NSMutableArray<NSNumber*>*)array {
    // c数组中最大的数字
    NSInteger max = NSIntegerMin;
    for (int i=0; i<array.count; i++) {
        if (array[i].integerValue > max) {
            max = array[i].integerValue;
        }
    }
    
    // 计算最大数字是几位数
    NSUInteger maxLength = [NSString stringWithFormat:@"%ld",(long)max].length;
    
    // 临时存储数据的数组(二维)
    NSMutableArray *temp = [NSMutableArray array];
    for (int i=0; i<10; i++) {
        NSMutableArray *p = [NSMutableArray arrayWithCapacity:array.count];
        [temp addObject:p];
    }
    
    // 用于记录temp中的存放数字的数量
    int counts[10] = {0,0,0,0,0,0,0,0,0,0};
    
    // 最大长度决定比较次数
    for (NSInteger i=0,n=1; i<maxLength; i++,n*=10) {
        // 每个数字分别计算余数
        for (NSInteger j=0; j<array.count; j++) {
            // 余数
            NSInteger ys = array[j].integerValue/n%10;
            
            //放入指定数组
            NSMutableArray * p = [temp objectAtIndex:ys];
            p[counts[ys]] = array[j];
            
            // 记录数量
            counts[ys]++;
            
        }
        
        
        // 记录取出的元素的要放的index
        int index = 0;
        // 把数据取出
        for (int k=0; k<10; k++) {
            // 记录数量数组中当前余数记录的数量不为0.
            if (counts[k]!=0) {
                // 循环取出元素
                for (int l=0; l<counts[k]; l++) {
                    // 取出元素，放回原来数组中。
                    array[index] = temp[k][l];
                    //
                    index++;
                }
                // 数量数组中 数量置空
                counts[k] = 0;
            }
        }
    }
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSMutableArray *a = [NSMutableArray arrayWithObjects:@23,@6,@189,@45,@9,@287,@56,@1,@798,@34,@65,@652,@5, nil];
        
        [RadixSort sort:a];
        
        NSLog(@"%@",a);
    }
    return 0;
}
