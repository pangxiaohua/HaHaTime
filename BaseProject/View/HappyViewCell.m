//
//  HappyViewCell.m
//  娱乐娱乐
//
//  Created by apple-jd17 on 15/12/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HappyViewCell.h"

@implementation HappyViewCell

-(TRImageView *)imageView{
    if (!_imageView) {
        _imageView = [[TRImageView alloc]init];
        [self.contentView addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(8);
            make.right.mas_equalTo(-8);
            make.height.mas_equalTo(120);
        }];
    }
    return _imageView;
}

-(UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.font = [UIFont systemFontOfSize:12];
        _titleLb.textColor = [UIColor blackColor];
        _titleLb.numberOfLines = 0;
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(8);
            make.top.mas_equalTo(self.imageView.mas_bottom).mas_equalTo(8);
            make.width.mas_equalTo(kWindowW/2.0 - 8);
        }];
    }
    return _titleLb;
}

-(UILabel *)slanLb{
    if (!_slanLb) {
        _slanLb = [UILabel new];
        _slanLb.textColor = [UIColor whiteColor];
        _slanLb.font = [UIFont systemFontOfSize:12];
        [self.imageView addSubview:_slanLb];
        [_slanLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.mas_equalTo(-5);
        }];
    }
    return _slanLb;
}

-(UIImageView *)eyeView{
    if (!_eyeView) {
        _eyeView = [[UIImageView alloc]init];
        [self.imageView addSubview:_eyeView];
        [_eyeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.slanLb.mas_left).mas_equalTo(-2);
            make.bottomMargin.mas_equalTo(self.mas_bottomMargin);
            make.height.mas_equalTo(self.slanLb.mas_height);
        }];
    }
    return _eyeView;
}

@end


@implementation HappyMaxViewCell

-(TRImageView *)imageView{
    if (!_imageView) {
        _imageView = [[TRImageView alloc]init];
        [self.contentView addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _imageView;
}

-(UIView *)backgroundVw{
    if (!_backgroundVw) {
        _backgroundVw = [UIView new];
        _backgroundVw.backgroundColor = kRGBColor(34, 20, 4);
        _backgroundVw.alpha = 0.5;
        [self.imageView addSubview:_backgroundVw];
        [_backgroundVw mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.height.mas_equalTo(35);
        }];
    }
    return _backgroundVw;
}

-(UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.textColor = [UIColor whiteColor];
        _titleLb.font = [UIFont systemFontOfSize:12];
        [self.backgroundVw addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(8);
            make.centerY.mas_equalTo(0);
        }];
    }
    return _titleLb;
}

-(UILabel *)slanLb{
    if (!_slanLb) {
        _slanLb = [UILabel new];
        _slanLb.textColor = [UIColor whiteColor];
        _slanLb.font = [UIFont systemFontOfSize:12];
        [self.backgroundVw addSubview:_slanLb];
        [_slanLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.mas_equalTo(-5);
        }];
    }
    return _slanLb;
}

-(UIImageView *)eyeView{
    if (!_eyeView) {
        _eyeView = [[UIImageView alloc]init];
        [self.backgroundVw addSubview:_eyeView];
        [_eyeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(10);
            make.centerY.mas_equalTo(self.slanLb);
            make.right.mas_equalTo(self.slanLb.mas_left).mas_equalTo(3);
        }];
    }
    return _eyeView;
}

@end
