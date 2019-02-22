//
//  main.m
//  Queue
//
//  Created by tyh on 2019/2/12.
//  Copyright © 2019 tyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Queue : NSObject

@end

@interface Queue ()
@property (nonatomic, strong) NSMutableArray *array;
@end

@implementation Queue

- (instancetype)init {
    if (self = [super init]) {
        _array = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)add:(NSString *)item {
    [self.array addObject:item];
}

- (void)poll {
    if (self.array.count > 0) {
        [self.array removeObjectAtIndex:0];
    }
}

- (NSString *)description {
    return self.array.description;
}


@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        Queue *q = [[Queue alloc] init];
        [q add:@"a"];
        [q add:@"b"];
        [q add:@"c"];
        NSLog(@"%@",q);
        
        [q poll];
        NSLog(@"%@",q);

        
    }
    return 0;
}
