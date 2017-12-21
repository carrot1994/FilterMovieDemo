//
//  ZFilterHeaderContentCollectionViewCell.h
//  FilterMovieDemo
//
//  Created by 周恩慧 on 2017/12/19.
//  Copyright © 2017年 周恩慧. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZFilterModel;

@interface ZFilterHeaderContentCollectionViewCell : UICollectionViewCell


@property (nonatomic, strong) ZFilterModel *model;

+ (NSString *)identifer;


@end
