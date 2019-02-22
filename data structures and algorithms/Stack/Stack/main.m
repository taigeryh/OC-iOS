//
//  main.m
//  Stack
//
//  Created by tyh on 2019/2/12.
//  Copyright © 2019 tyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stack : NSObject

@end

@interface Stack ()
@property (nonatomic, strong) NSMutableArray *array;
@end

@implementation Stack

- (instancetype)init {
    if (self = [super init]) {
        _array = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)push:(NSString*)str {
    [self.array addObject:str];
}

- (void)pop {
    [self.array removeLastObject];
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
