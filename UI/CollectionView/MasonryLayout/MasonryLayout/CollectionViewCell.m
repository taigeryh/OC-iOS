//
//  CollectionViewCell.m
//  MasonryLayout
//
//  Created by tyh on 2019/1/7.
//  Copyright © 2019 tyh. All rights reserved.
//

#import "CollectionViewCell.h"


@interface CollectionViewCell()

@property (nonatomic, strong) UILabel * label;

@end

@implementation CollectionViewCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        self.label.textColor = [UIColor whiteColor];
        self.label.font = [UIFont systemFontOfSize:20];
        [self addSubview:self.label];
    }
    return self;
}

- (void)setTitle:(NSString *)title {
    _title = [title copy];
    self.label.text = _title;
}

- (void)layoutSubviews {
    self.label.center = self.center;
}

@end
