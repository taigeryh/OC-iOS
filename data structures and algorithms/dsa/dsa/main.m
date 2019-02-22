// 二分查找。

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        
        
        NSArray<NSNumber*> * array = @[@1,@2,@3,@4,@5];
        
        int target = 8;
        int begin = 0;
        
        int end = array.count - 1;
        
        int mid = (begin+end)/2;
        
        int index = -1;
        
        while (true) {
            
            // 没有找到。
            if (begin >= end) {
                break;
            }
            
            // 判断中间的元素是否目标元素
            int miditem = array[mid].intValue;
            if(miditem == target) {
                index = mid;
                break;
            } else {
                if (miditem>target) {
                    
                    end = mid-1;
                } else {
                    begin = mid-1;
                }
                // 新的中间位置
                mid = (begin+end)/2;
            }
            
        }
        
    }
    return 0;
}
