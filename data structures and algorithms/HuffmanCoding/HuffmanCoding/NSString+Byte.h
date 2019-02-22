//
//  NSString+Byte.h
//  HuffmanCoding
//
//  Created by tyh on 2019/2/15.
//  Copyright © 2019 tyh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Byte)

- (NSData*)toData;

// 转成Bytes数组
- (Byte *)toBytes;

@end

NS_ASSUME_NONNULL_END
