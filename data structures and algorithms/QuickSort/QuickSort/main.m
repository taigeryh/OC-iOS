//
//  main.m
//  QuickSort
//
//  Created by tyh on 2019/2/14.
//  Copyright © 2019 tyh. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface QuickSort : NSObject

+ (void)sort:(NSMutableArray<NSNumber*>*)array start:(NSInteger)start end:(NSInteger)end;

@end

@implementation QuickSort


+ (void)sort:(NSMutableArray<NSNumber*>*)array start:(NSInteger)start end:(NSInteger)end {
    
    if (start < end) {
        // 基准
        NSNumber *pivot = array[start];
        NSInteger low = start;
        NSInteger high = end;
        
        // 循环，标准数小的放左边，标准数大的放右边。
        while (low < high) {
            // 右边向左。右边数字比标准数大的不动。
            while (low < high && array[high].integerValue >= pivot.integerValue) {
                high--;
            }
            // 直到右边数字比标准数小，将这个数字放到low的位置。
            array[low] = array[high];
            
            // 左边向右，左边数字比j标准数小的不动。
            while (low < high && array[low].integerValue <= pivot.integerValue) {
                low++;
            }
            // 直到左边数字比标准数大，将这个数字放到high的位置。
            array[high] = array[low];
            
        }
        // 直到，low=high,两个游标重合。
        array[low] = pivot; // low 或 high都行。
        // 此时，已经将数组分割，左边比基准数小，右边比标准数大。
        
        // 处理左边的
        [QuickSort sort:array start:start end:low];
        
        // 处理右边的
        [QuickSort sort:array start:low+1 end:end];
    }

}

@end


void quick_sort(int array[], int start, int end) {
    if (start < end) {
        int pivot = array[start];
        int low = start;
        int high = end;
        
        while (low < high) {
            while (low < high && array[high] >= pivot) {
                high--;
            }
            array[low] = array[high];
            
            while (low < high && array[low] <= pivot) {
                low++;
            }
            array[high] = array[low];
            
        }
        
        array[low] = pivot;
        
        quick_sort(array, start, low);
        quick_sort(array, low+1, end);
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        
        NSMutableArray * array = [NSMutableArray arrayWithObjects:@3,@4,@6,@7,@2,@7,@2,@8,@0, nil];
        
        NSLog(@"%@",array);
        [QuickSort sort:array start:0 end:array.count-1];
        NSLog(@"%@",array);
        
        printf("\n");
        
        int arr[] = {3,4,6,7,2,7,2,8,0};
        
        quick_sort(arr, 0, 9-1);
        
        for (int i=0; i<9; i++) {
            printf("%d",arr[i]);
        }
        printf("\n");

        
    }
    return 0;
}
