//
//  main.m
//  BubbleSort
//
//  Created by tyh on 2019/2/14.
//  Copyright © 2019 tyh. All rights reserved.
//

#import <Foundation/Foundation.h>


/*  5，7，2，9，4，1，0，5，7
 
 一共需要比较 length-1 轮。外圈。
 
 1次  5，7，2，9，4，1，0，5，7
 2次  5，2，7，9，4，1，0，5，7
 3次  5，2，7，9，4，1，0，5，7
 4次  5，2，7，4，9，1，0，5，7
 5次  5，2，7，4，1，9，0，5，7
 6次  5，2，7，4，1，0，9，5，7
 7次  5，2，7，4，1，0，5，9，7
 8次  5，2，7，4，1，0，5，7，9
 最大的9冒泡出来
 
 */
@interface BubbleSort : NSObject

+ (void)bubbleSort:(NSMutableArray *)array;

@end

@implementation BubbleSort

+ (void)bubbleSort:(NSMutableArray *)array {
    for (int i = 0; i < array.count-1; i++) {
        for (int j = 0; j < array.count-1 - i; j++) {
            NSLog(@"i:%d,vi:%@,j:%d,vj:%@,j+1:%d,vj+1:%@",i,array[i],j,array[j],j+1,array[j+1]);
            NSNumber * xx = array[j];
            NSNumber * xx2 = array[j+1];
//            if (array[j] > array[j+1]) {
//                NSLog(@"%@ > %@",array[j],array[j+1]);
//                [array exchangeObjectAtIndex:j withObjectAtIndex:j+1];
//            }
            if (xx.intValue > xx2.intValue) {
                NSLog(@"%@ > %@",array[j],array[j+1]);
                //[array exchangeObjectAtIndex:j withObjectAtIndex:j+1];
                NSNumber * t = array[j];
                array[j] = array[j+1];
                array[j+1] = t;
            }
            NSLog(@"i:%d,vi:%@,j:%d,vj:%@,j+1:%d,vj+1:%@",i,array[i],j,array[j],j+1,array[j+1]);
            NSLog(@"%@",array);
            NSLog(@"---");
        }
    }
}


@end


void bubble(int a[]) {

}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int a[] = {5,7,2,9,4,1,0,5,7};
        
        for (int i=0; i<9; i++) {
            printf("%d",a[i]);
        }
        printf("\n");

        int length = sizeof(a)/sizeof(a[0]);
        
        for (int i=0; i<length-1; i++) {
            for (int j=0; j<length-1-i; j++) {
                if(a[j]>a[j+1]) {
                    int temp = a[j];
                    a[j] = a[j+1];
                    a[j+1] = temp;
                }
            }
        }
        

        
        for (int i=0; i<9; i++) {
            printf("%d",a[i]);
        }
        printf("\n");
        
        NSNumber * xxx = @5;
        
        NSMutableArray *ar = [NSMutableArray arrayWithObjects:@5,@7,@2,@9,@4,@1,@0,@5,@7, nil];
        [BubbleSort bubbleSort:ar];
        NSLog(@"%@",ar);

    }
    return 0;
}



