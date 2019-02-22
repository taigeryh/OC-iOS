//
//  main.m
//  InsertSort
//
//  Created by tyh on 2019/2/14.
//  Copyright © 2019 tyh. All rights reserved.
//

#import <Foundation/Foundation.h>


/*
 插入排序
 eg.扑克牌有序，新摸来一张牌，插入到这个有序序列中。
 
 缺点。
 6,5,4,3,2,1
 如果将上面的数组从小到大排列，插入排序效率低下。
 升级版插入排序：希尔排序。
 
 希尔排序。通过步长进行分组分别进行直接插入排序(略有差别)。
 第一次，步长 = 总长度/2
 第二次，步长 = 总长度/2/2
 ...
 直到 步长 = 1. 此时即为插入排序。
 */


/// 直接插入排序
@interface InsertSort : NSObject

+ (void)sort:(NSMutableArray<NSNumber*>*)array;

@end

@implementation InsertSort

+ (void)sort:(NSMutableArray<NSNumber*>*)array {
    for (int i=1; i<array.count; i++) {
        // 从第二个开始。前面的序列，只有一个数字，所以是有序的。
        // 从第二个开始，如果小于前面的数字，说明需要往前插。否则不做任何事。
        if (array[i].integerValue < array[i-1].integerValue) {
            // 记录 当前值, 下标为i
            NSNumber *temp = array[i];
            int j=0;
            
            // 从前一个数字开始到第一个数字的序列是有序序列。
            // 从前一个数字（i-1）开始，往前遍历。如果比temp大，往后移动一个，覆盖后面这个。
            for (j=i-1; j>=0 && temp.integerValue<array[j].integerValue; j--) {
                array[j+1] = array[j];
            }
            // 直到，小于等于temp的值出现。他后面的位置，就是temp需要插入的位置。
            array[j+1] = temp;
            
        }
        
    }
}
@end


/// 希尔排序

@interface ShellSort : NSObject

@end

@implementation ShellSort

+ (void)sort:(NSMutableArray<NSNumber*>*)array {
    
    // 遍历所有的步长
    for (NSInteger d=array.count/2; d>0; d/=2) {
        // 遍历所有的元素（每组元素）。这里d其实是该组中的第二个元素。i每加一次，相当于切换到下一组。
        for (NSInteger i=d; i<array.count; i++) {
            
            // 遍历本组中所有的元素。
            // 并不是一次循环遍历完，该组元素。而是结合 上层的i++，每隔步长进行交换。例如，组1比，组2比，组3比，组1比。
            for (NSInteger j=i-d; j>=0; j-=d) {
                if (array[j].integerValue > array[j+d].integerValue) {
                    NSNumber *t = array[j];
                    array[j] = array[j+d];
                    array[j+d] = t;
                }
            }
            
        }
    }
    
    
    
    
}

@end


void insert_sort(int (*array)[]) {
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        
        int array[] = {5,3,2,8,5,9,1,0};
        
        // insert_sort(arr);
        
        int length = sizeof(array)/sizeof(array[0]);
        
        for (int i=1; i<length; i++) {
            
            if (array[i] < array[i-1]) {
                int temp = array[i];
                int j;
                
                //  如果temp比前面的小，前面的后退一个，向后覆盖。
                for (j=i-1; j>=0&&temp<array[j]; j--) {
                    array[j+1] = array[j];
                }
                // 直到 temp 大于或者等于 前面的一个数时候，这个位置的后面一个，就是temp需要插入的位置。
                array[j+1] = temp;
                
            }
            
        }
        
        for (int i=0; i<8; i++) {
            printf("%d",array[i]);
        }
        printf("\n");
        
        
        ////
        NSMutableArray*arr = [NSMutableArray arrayWithObjects:@5,@3,@2,@8,@5,@9,@1,@0, nil];
        [InsertSort sort:arr];
        NSLog(@"%@",arr);
        
        
        ///
        NSMutableArray*arrss = [NSMutableArray arrayWithObjects:@3,@5,@2,@7,@8,@1,@2,@0,@4,@7,@4,@3,@8, nil];
        [ShellSort sort:arrss];
        NSLog(@"%@",arrss);


        
    }
    return 0;
}
