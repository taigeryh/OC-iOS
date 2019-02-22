//
//  main.m
//  HeapSort
//
//  Created by tyh on 2019/2/15.
//  Copyright © 2019 tyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeapSort : NSObject

+ (void)sort:(NSMutableArray<NSNumber*>*)array ;

@end

@implementation HeapSort

+ (void)sort:(NSMutableArray<NSNumber*>*)array {
    // 开始位置是最后一个非叶子节点，即为最后一个节点的父节点。
    NSInteger start = (array.count-1)/2;
    
    // 结束位置,数据长度-1
    // 调整为大顶堆
    for (NSInteger i=start; i>=0; i--) {
        [HeapSort maxHeap:array size:array.count index:i];
    }
    
    // 交换.数组中第0个和堆中最后一个数交换位置。再把前面的d处理为大顶堆
    for (NSInteger i =array.count-1; i>0; i--) {
        NSNumber *p = array[0];
        array[0] = array[i];
        array[i] = p;
        
        [HeapSort maxHeap:array size:i index:0];
    }
    
}

// 大顶堆
+ (void)maxHeap:(NSMutableArray<NSNumber*> *)array size:(NSInteger)size index:(NSInteger)index {
    // 左子节点
    NSInteger leftNode = 2*index+1;
    // 右子节点
    NSInteger rightNode = 2*index+2;
    
    NSInteger maxIndex = index;
    // 和两个子节点对比，找出最大的节点
    if (leftNode < size && array[leftNode].integerValue > array[maxIndex].integerValue) {
        maxIndex = leftNode;
    }
    if (rightNode < size && array[rightNode].integerValue > array[maxIndex].integerValue) {
        maxIndex = rightNode;
    }
    
    // 交换位置
    if (maxIndex != index) {
        NSNumber *p = array[index];
        array[index] = array[maxIndex];
        array[maxIndex] = p;
        
        // 交换位置之后，可能会破坏之前排好的堆。所以需要重新调整。
        [HeapSort maxHeap:array size:size index:maxIndex];
    }
    
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSMutableArray *arr = [NSMutableArray arrayWithObjects:@9,@6,@8,@7,@0,@1,@10,@4,@2, nil];
        
        [HeapSort sort:arr];
        
        NSLog(@"%@",arr);
    }
    return 0;
}
