//
//  ViewController.m
//  MasonryLayout
//
//  Created by tyh on 2019/1/7.
//  Copyright © 2019 tyh. All rights reserved.
//

// https://github.com/chiahsien/CHTCollectionViewWaterfallLayout

#import "ViewController.h"
#import "MKMasonryViewLayout.h"
#import "CollectionViewCell.h"

static NSString * const cellId = @"cellId";

@interface ViewController ()<MKMasonryViewLayoutDelegate,UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MKMasonryViewLayout *layout = [[MKMasonryViewLayout alloc] init];
    layout.numberOfColumns = 3;
    layout.interItemSpacing = 10;
    layout.delegate = self;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:cellId];
    
    [self.view addSubview:self.collectionView];
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(MKMasonryViewLayout *)layout heightForItemAtIndexPath:(NSIndexPath *)indexPath {
    return 100 + (arc4random() % 140);
}


#pragma mark -
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 100;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];
    cell.title = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    return cell;
}


@end
