//
//  ZFilterHeaderView.h
//  FilterMovieDemo
//
//  Created by 周恩慧 on 2017/12/19.
//  Copyright © 2017年 周恩慧. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^headerItemSelectedBlock)(NSUInteger index);

@interface ZFilterHeaderView : UIView

@property (nonatomic, copy) NSArray *dataArray;

@property (nonatomic, copy) headerItemSelectedBlock itemSelectBlock;

@end
