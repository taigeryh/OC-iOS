//
//  Son+Initialize.m
//  runtime
//
//  Created by tyh on 2018/12/23.
//  Copyright © 2018 taiyh. All rights reserved.
//

#import "Son+Initialize.h"

@implementation Son (Initialize)

+ (void)initialize {
    NSLog(@"%@ - %s", [self class], __func__);
}

@end
