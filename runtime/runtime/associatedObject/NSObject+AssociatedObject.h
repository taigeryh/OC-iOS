//
//  NSObject+AssociatedObject.h
//  runtime
//
//  Created by taiyh on 2018/12/14.
//  Copyright © 2018 taiyh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (AssociatedObject)

@property (nonatomic, strong) id associatedObject;

@end

NS_ASSUME_NONNULL_END
