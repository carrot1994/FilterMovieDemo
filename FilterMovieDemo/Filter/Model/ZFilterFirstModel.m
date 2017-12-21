//
//  ZFilterFirstModel.m
//  FilterMovieDemo
//
//  Created by 周恩慧 on 2017/12/19.
//  Copyright © 2017年 周恩慧. All rights reserved.
//

#import "ZFilterFirstModel.h"

@implementation ZFilterFirstModel

- (NSMutableArray<ZFilterModel *> *)modelArray {
    
    if (!_modelArray) {
        _modelArray = [NSMutableArray array];
    }
    return _modelArray;
}

@end
