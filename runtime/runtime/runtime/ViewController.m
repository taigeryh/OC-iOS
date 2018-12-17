//
//  ViewController.m
//  runtime
//
//  Created by taiyh on 2018/12/14.
//  Copyright © 2018 taiyh. All rights reserved.
//

#import "ViewController.h"

#import "NSObject+AssociatedObject.h"
#import "MethodSwizzlingObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSObject *obj = [[NSObject alloc] init];
    obj.associatedObject = @"1";
    
    NSLog(@"%@", obj.associatedObject);
    

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}


@end
