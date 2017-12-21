//
//  ZFilterFirstModel.h
//  FilterMovieDemo
//
//  Created by 周恩慧 on 2017/12/19.
//  Copyright © 2017年 周恩慧. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZFilterModel;
@interface ZFilterFirstModel : NSObject

@property (nonatomic, strong) NSMutableArray <ZFilterModel *> *modelArray;

/** collectionView偏移量 这里没重用其实没用上 */
@property (nonatomic, assign) CGFloat contenoffsetX;


@end
