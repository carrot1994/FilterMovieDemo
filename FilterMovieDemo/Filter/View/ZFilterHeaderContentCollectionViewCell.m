//
//  ZFilterHeaderContentCollectionViewCell.m
//  FilterMovieDemo
//
//  Created by 周恩慧 on 2017/12/19.
//  Copyright © 2017年 周恩慧. All rights reserved.
//

#import "ZFilterHeaderContentCollectionViewCell.h"
#import "ZFilterModel.h"

@interface ZFilterHeaderContentCollectionViewCell ()

@property (nonatomic, strong) UILabel *nameLabel;

@end

@implementation ZFilterHeaderContentCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _nameLabel = ({
            UILabel *label = [[UILabel alloc]init];
            label.font = [UIFont systemFontOfSize:15];
            label.textColor = [UIColor blackColor];
            label.textAlignment = NSTextAlignmentCenter;
            label.layer.cornerRadius = 15;
            label.width = self.width;
            label.height = self.height - 10;
            label.y = 10;
            label.clipsToBounds = YES;
            [label sizeToFit];
            label;
        });
        
        [self.contentView addSubview:_nameLabel];
        
        
        
    }
    return self;
}


- (void)setModel:(ZFilterModel *)model {
    
    _model = model;
    
    _nameLabel.frame = self.bounds;
    _nameLabel.textColor = _model.select?[UIColor orangeColor]:[UIColor blackColor];
    _nameLabel.backgroundColor = _model.select?[UIColor lightGrayColor]:[UIColor whiteColor];
    _nameLabel.text = model.filterText;
}


+ (NSString *)identifer {
    
    return @"ZFilterHeaderContentCollectionViewCellString";
}

@end
