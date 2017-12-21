//
//  ZFilterViewController.m
//  FilterMovieDemo
//
//  Created by 周恩慧 on 2017/12/19.
//  Copyright © 2017年 周恩慧. All rights reserved.
//

/**
 * ZFilterHeaderContentView是collectionView,里面item大小不固定，但是间距固定
 * ZFilterHeaderView是多个ZFilterHeaderContentView的集合，每一行就是一个ZFilterHeaderContentView
 **/
#import "ZFilterViewController.h"
#import "ZFilterCell.h"
#import "ZFilterModel.h"
#import "ZFilterFirstModel.h"
#import "ZFilterHeaderView.h"
#import "ZTVModel.h"


@interface ZFilterViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) ZFilterHeaderView *headerView;
@property (nonatomic, strong) NSMutableArray *headArray;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ZFilterViewController

#pragma mark - 初始化
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"筛选页";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    [self.collectionView addSubview:self.headerView];
    
    
    //调数据
    if (self.headArray.count && self.dataArray.count) {
        self.headerView.dataArray = self.headArray;
        [self.collectionView reloadData];
    }

}

#pragma mark - getter

- (ZFilterHeaderView *)headerView {
    
    if (!_headerView) {
        CGFloat height = self.headArray.count * 40 + 25;
        
        UIEdgeInsets contentInset = self.collectionView.contentInset;
        contentInset.top= height ;
        self.collectionView.contentInset = contentInset;
        
        __weak ZFilterViewController *weakSelf = self;
        
        _headerView = [[ZFilterHeaderView alloc]initWithFrame:CGRectMake(0, -height, self.view.width, height)];
        _headerView.itemSelectBlock = ^(NSUInteger index) {
            
            [weakSelf loadContentData];
        };
    }
    return _headerView;
}


- (UICollectionView *)collectionView {
    
    if (!_collectionView) {
        //minimumLineSpacing 设置最小行间距，minimumInteritemSpacing 设置同一列中间隔的cell最小间距。
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        CGFloat  maxCol = 3;
        CGFloat itemH = 220;
        
        CGFloat margin = 8;
        
        CGFloat itemW   = (SCREENW - (margin * (maxCol +1)))/maxCol;
        layout.itemSize = CGSizeMake(itemW, itemH);
        layout.minimumInteritemSpacing = margin;
        layout.minimumLineSpacing      = margin;
        layout.sectionInset = UIEdgeInsetsMake(0,margin,0, margin);
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) collectionViewLayout:layout];
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerClass:[ZFilterCell class] forCellWithReuseIdentifier:[ZFilterCell identifer]];
    }
    return _collectionView;
}

- (NSMutableArray *)headArray {
    
    if (!_headArray) {
        _headArray = [NSMutableArray array];
        for (int i = 0; i < 5; i++) {
            ZFilterFirstModel *model = [[ZFilterFirstModel alloc]init];
            
            for (int j = 0; j < 6;j++ ) {
            
                ZFilterModel *filterModel = [[ZFilterModel alloc]init];
                filterModel.filterText = [NSString stringWithFormat:@"第%d行%d列",i,j];
                if (j == 0) {
                    filterModel.select = YES;
                }
                
                [model.modelArray addObject:filterModel];
            }
              [_headArray addObject:model];
        }
    }
    return _headArray;
}


- (NSMutableArray *)dataArray {
    
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        
        for (int i = 0; i < 18; i++) {
            ZTVModel *model = [[ZTVModel alloc]init];
            model.tvImage = @"http://wx4.sinaimg.cn/mw690/826ff79fgy1fklkuvjzjcg20f00841ex.gif";
            model.tvName = @"中央电视台中央电视台";
            model.tvDescription = @"寻梦环游记寻梦环游记寻梦环游记";
            [_dataArray addObject:model];
        }
    }
    return _dataArray;
}
#pragma mark - 加载数据
- (void)loadContentData {
    
    NSArray *imagesArray = @[@"http://wx4.sinaimg.cn/mw690/826ff79fgy1fklkuvjzjcg20f00841ex.gif",@"http://wx2.sinaimg.cn/mw690/826ff79fly8fez92837adj20ku0kuaao.jpg",@"http://ww1.sinaimg.cn/mw690/826ff79fjw8f6ffwxc05cj20ku0l7aaj.jpg"];
    NSArray *tvNameArray = @[@"中央电视台中央电视台",@"广东电视台广东电视台",@"湖南电视台湖南电视台"];
    NSArray *tvDescriptionArray = @[@"寻梦环游记寻梦环游记寻梦环游记",@"妖猫传妖猫传妖猫传",@"沃视频沃视频"];
    
    NSInteger index = arc4random()%tvNameArray.count;
    
    [self.dataArray enumerateObjectsUsingBlock:^(ZTVModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        obj.tvImage = [imagesArray objectAtIndex:index];
        obj.tvName = [tvNameArray objectAtIndex:index];
        obj.tvDescription = [tvDescriptionArray objectAtIndex:index];
        
    }];
    
    [self.collectionView reloadData];
    
    
}

#pragma mark - 代理
#pragma mark - UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    ZTVModel *tvModel = [self.dataArray objectAtIndex:indexPath.item];
    
    ZFilterCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[ZFilterCell identifer] forIndexPath:indexPath];
    cell.model = tvModel;
    return cell;
    
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"点我干什么啦!");
    
}


@end
