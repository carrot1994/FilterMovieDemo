//
//  ZTVModel.h
//  FilterMovieDemo
//
//  Created by 周恩慧 on 2017/12/19.
//  Copyright © 2017年 周恩慧. All rights reserved.
//  电影cell

#import <Foundation/Foundation.h>

@interface ZTVModel : NSObject

/** 电视ID*/
@property (nonatomic, copy) NSString *tvID;
/** 电视名称*/
@property (nonatomic, copy) NSString *tvName;
/** 简介*/
@property (nonatomic, copy) NSString *tvDescription;
/** 海报*/
@property (nonatomic, copy) NSString *tvImage;

@end
