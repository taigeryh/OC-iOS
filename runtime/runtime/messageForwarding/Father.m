//
//  Father.m
//  runtime
//
//  Created by tyh on 2018/12/23.
//  Copyright © 2018 taiyh. All rights reserved.
//

#import "Father.h"

@implementation Father

+ (void)load {
    NSLog(@"%@ - %s", [self class], __func__);
}

+ (void)initialize {
    NSLog(@"%@ - %s", [self class], __func__);
}

@end
