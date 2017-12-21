//
//  ZFilterHeaderContentView.m
//  FilterMovieDemo
//
//  Created by 周恩慧 on 2017/12/19.
//  Copyright © 2017年 周恩慧. All rights reserved.
//

#import "ZFilterHeaderContentView.h"
#import "ZFilterModel.h"
#import "ZFilterHeaderContentCollectionViewCell.h"
#import "ZFilterFirstModel.h"

@interface ZFilterHeaderContentView ()

<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) ZFilterModel *selectModel;

@end

@implementation ZFilterHeaderContentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.collectionView];
    }
    return self;
}


- (UICollectionView *)collectionView {
    
    if (!_collectionView) {
        //minimumLineSpacing 设置最小行间距，minimumInteritemSpacing 设置同一列中间隔的cell最小间距。
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = 9;
        layout.minimumInteritemSpacing = 10;
        //        layout.itemSize = CGSizeMake(100, 30);
        layout.sectionInset = UIEdgeInsetsMake(5, 8, 0, 0);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[ZFilterHeaderContentCollectionViewCell class] forCellWithReuseIdentifier:[ZFilterHeaderContentCollectionViewCell identifer]];
        
    }
    return _collectionView;
}

- (void)setModel:(ZFilterFirstModel *)model {
    
    _model = model;
    
    self.collectionView.contentOffset = CGPointMake(_model.contenoffsetX, 0);
    
    //默认选中
    __weak ZFilterHeaderContentView *weakSelf = self;
    
    [model.modelArray enumerateObjectsUsingBlock:^(ZFilterModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.select == YES) {
            weakSelf.selectModel = obj;
            *stop = YES;
        }
        
    }];
    
    [self.collectionView reloadData];
}



- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    _collectionView.width = self.width;
    _collectionView.height = self.height;
}

#pragma mark - UICollectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.model.modelArray.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ZFilterModel *model = [self.model.modelArray objectAtIndex:indexPath.item];
    
    ZFilterHeaderContentCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[ZFilterHeaderContentCollectionViewCell identifer] forIndexPath:indexPath];
    cell.model = model;
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ZFilterModel *model = [self.model.modelArray objectAtIndex:indexPath.item];
    
    
    if ([self.selectModel isEqual:model]) {
        return;
    }
    self.selectModel = model;
    
    [self.model.modelArray enumerateObjectsUsingBlock:^(ZFilterModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx != indexPath.item) {
            obj.select = NO;
        }else{
            obj.select = YES;
        }
        
    }];
    if (self.selectFilterBlock) {
        self.selectFilterBlock(model);
    }
    
    [collectionView reloadData];
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    
    CGFloat horizontalOffset = scrollView.contentOffset.x;
    self.model.contenoffsetX  = horizontalOffset;
    
    
}

//每个cell大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZFilterModel *model = [self.model.modelArray objectAtIndex:indexPath.item];
    
    CGSize size =  [model.filterText sizeWithFont:[UIFont systemFontOfSize:15]];
    
    return CGSizeMake(size.width + 20, 30);
    
    
}




@end
