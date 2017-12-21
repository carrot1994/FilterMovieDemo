//
//  ZFilterHeaderView.m
//  FilterMovieDemo
//
//  Created by 周恩慧 on 2017/12/19.
//  Copyright © 2017年 周恩慧. All rights reserved.
//

#import "ZFilterHeaderView.h"
#import "ZFilterHeaderContentView.h"
#import "ZFilterFirstModel.h"

@implementation ZFilterHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        
    }
    return self;
}


- (void)setDataArray:(NSArray *)dataArray {
    
    _dataArray = dataArray;
    
    __weak ZFilterHeaderView *weakSelf = self;
    
    [_dataArray enumerateObjectsUsingBlock:^(ZFilterFirstModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGFloat height = 40;
        ZFilterHeaderContentView *content = [[ZFilterHeaderContentView alloc]initWithFrame:CGRectMake(0,  (height) * idx, self.width, height)];
        content.model = obj;
        content.selectFilterBlock = ^(ZFilterModel *model) {
            
            if (weakSelf.itemSelectBlock) {
                weakSelf.itemSelectBlock(idx);
            }
        };
        [self addSubview:content];
        
    }];
    
    
}


@end
