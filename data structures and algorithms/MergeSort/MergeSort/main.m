//
//  main.m
//  MergeSort
//
//  Created by tyh on 2019/2/14.
//  Copyright © 2019 tyh. All rights reserved.
//

#import <Foundation/Foundation.h>


/// 归并排序
/*
 一个数组，两个部分，这两个部分都是内部有序的。
 */
@interface MergeSort : NSObject

@end

@implementation MergeSort


+ (void)sort:(NSMutableArray<NSNumber*>*)array
         low:(NSInteger)low
        high:(NSInteger)high
{
    NSInteger mid = (low+high)/2;
    if (low < high) {
        // 处理左边
        [MergeSort sort:array low:low high:mid];
        // 处理右边
        [MergeSort sort:array low:mid+1 high:high];
        // 归并
        [MergeSort sort:array start:low mid:mid end:high];
    }

}


// start, end ！
+ (void)sort:(NSMutableArray<NSNumber*> *)arry
       start:(NSInteger)start
         mid:(NSInteger)middle
         end:(NSInteger)end
{
    NSMutableArray *temp = [NSMutableArray array];
    
    NSInteger i = start;
    NSInteger j = middle+1;
    
    // 记录 arr 中的下标
    NSInteger index = 0;
    
    while (i<=middle && j<=end) {
        if (arry[i].integerValue <= arry[j].integerValue) {
            temp[index] = arry[i];
            i++;
        } else {
            temp[index] = arry[j];
            j++;
        }
        index++;
    }
    
    // 处理多余的数据
    while (j <= end) {
        temp[index] = arry[j];
        j++;
        index++;

    }
    while (i <= middle) {
        temp[index] = arry[i];
        i++;
        index++;

    }
    
    // 将temp放入原数组
    for (int k=0; k<temp.count; k++) {
        arry[k+start] = temp[k];
    }
}


@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSMutableArray*a = [NSMutableArray arrayWithObjects:@1,@3,@5,@2,@4,@6,@8,@10, nil];
        
//        [MergeSort sort:a start:0 mid:2 end:a.count-1];
        [MergeSort sort:a low:0 high:a.count-1];
        NSLog(@"%@",a);
    }
    return 0;
}
