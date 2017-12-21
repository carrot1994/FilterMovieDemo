//
//  ZFilterCell.m
//  FilterMovieDemo
//
//  Created by 周恩慧 on 2017/12/19.
//  Copyright © 2017年 周恩慧. All rights reserved.
//

#import "ZFilterCell.h"
#import "ZTVModel.h"

@interface ZFilterCell ()

@property (nonatomic, strong) UIImageView *videoImageView;
@property (nonatomic, strong) UILabel *videoNameLabel;
@property (nonatomic, strong) UILabel *desciptionLabel;

@end

@implementation ZFilterCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _videoImageView = ({
            UIImageView *view = [[UIImageView alloc]init];
            view.contentMode = UIViewContentModeScaleAspectFill;
            view.clipsToBounds = YES;
            view.layer.cornerRadius = 8;
            view;
        });
        
        _videoNameLabel = ({
            UILabel *view = [[UILabel alloc]init];
            view.font = [UIFont systemFontOfSize:15];
            view.textColor = [UIColor blackColor];
            view.textAlignment = NSTextAlignmentCenter;
            view;
        });
        
        _desciptionLabel = ({
            UILabel *view = [[UILabel alloc]init];
            view.font = [UIFont systemFontOfSize:15];
            view.textColor = [UIColor lightGrayColor];
            view.textAlignment = NSTextAlignmentCenter;
            view;
        });
        
        [self.contentView addSubview:_videoImageView];
        [self.contentView addSubview:_videoNameLabel];
        [self.contentView addSubview:_desciptionLabel];
        
        
        [_videoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self);
            make.height.equalTo(@(160));
        }];
        
        [_videoNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_videoImageView.mas_bottom).offset(10);
            make.left.right.equalTo(self);
        }];
        
        [_desciptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(_videoNameLabel.mas_bottom).offset(10);
            make.left.right.equalTo(self);
        }];
        
    }
    return self;
}

- (void)setModel:(ZTVModel *)model {
    
    _model = model;
    
    [_videoImageView sd_setImageWithURL:[NSURL URLWithString:_model.tvImage]];
    _videoNameLabel.text = _model.tvName;
    _desciptionLabel.text = _model.tvDescription;
    
}

+ (NSString *)identifer {
    
    return @"ZFilterCellString";
}

@end
