//
//  Son+Load.m
//  runtime
//
//  Created by tyh on 2018/12/23.
//  Copyright © 2018 taiyh. All rights reserved.
//

#import "Son+Load.h"

@implementation Son (Load)

+ (void)load {
    NSLog(@"%@ - %s", [self class], __func__);
}

@end
