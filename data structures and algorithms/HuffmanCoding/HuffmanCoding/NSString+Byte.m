//
//  NSString+Byte.m
//  HuffmanCoding
//
//  Created by tyh on 2019/2/15.
//  Copyright © 2019 tyh. All rights reserved.
//

#import "NSString+Byte.h"

@implementation NSString (Byte)

- (NSData*)toData {
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

// 转成Bytes数组.但是读不到长度。只有通过data读取。
- (Byte*)toBytes {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    Byte *bytes = (Byte*)[data bytes];
    return bytes;
}



@end
