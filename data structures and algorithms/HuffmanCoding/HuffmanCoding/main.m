//
//  main.m
//  HuffmanCoding
//
//  Created by tyh on 2019/2/15.
//  Copyright © 2019 tyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HuffmanCoding.h"
#import "NSString+Byte.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSString *msg = @"can you can a can as a can canner can a can.";
        NSData *data = [msg toData];
        
        Byte *byte = (Byte *)data.bytes;
        NSInteger count = [data length];
        
        [HuffmanCoding zip:byte length:count];
        
    }
    return 0;
}
