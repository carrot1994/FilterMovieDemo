//
//  ZFilterModel.h
//  FilterMovieDemo
//
//  Created by 周恩慧 on 2017/12/19.
//  Copyright © 2017年 周恩慧. All rights reserved.
//  筛选cell

#import <Foundation/Foundation.h>

@interface ZFilterModel : NSObject

/** 是否选中*/
@property (nonatomic, assign) BOOL select;
/** 筛选区文字*/
@property (nonatomic, copy) NSString *filterText;

@end
