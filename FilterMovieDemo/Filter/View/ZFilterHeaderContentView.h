//
//  ZFilterHeaderContentView.h
//  FilterMovieDemo
//
//  Created by 周恩慧 on 2017/12/19.
//  Copyright © 2017年 周恩慧. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZFilterFirstModel;
@class ZFilterModel;

typedef void(^didselectFilterBlock)(ZFilterModel *model);

@interface ZFilterHeaderContentView : UIView

@property (nonatomic, strong) ZFilterFirstModel *model;

@property (nonatomic, copy) didselectFilterBlock selectFilterBlock;

@end
