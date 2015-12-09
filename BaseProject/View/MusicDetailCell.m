//
//  MusicDetailCell.m
//  娱乐娱乐
//
//  Created by apple-jd17 on 15/12/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MusicDetailCell.h"

@implementation MusicDetailCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(TRImageView *)coverIV{
    if (!_coverIV) {
/*TRImageView是对UIImageView进行封装的类，主要作用是当图片和当前显示框的比例不一致时，会对图片进行按比例放大充满显示框，将超出显示框的图片剪切掉。它要求必须是用alloc + init进行初始化才有用。*/
        _coverIV = [[TRImageView alloc]init];
        [self.contentView addSubview:_coverIV];
        [_coverIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(55, 55));
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(10);
        }];
        //设置音乐图片圆角
        _coverIV.layer.cornerRadius = 55/2;
        //添加图片上面的播放标识
        UIImageView *playIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"find_album_play"]];
        [_coverIV addSubview:playIV];
        [playIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(25, 25));
            make.center.mas_equalTo(0);
        }];
    }
    return _coverIV;
}

-(UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.coverIV.mas_right).mas_equalTo(10);
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(self.timeLb.mas_left).mas_equalTo(-10);
        }];
        _titleLb.font = [UIFont systemFontOfSize:15];
        _titleLb.numberOfLines = 0;
    }
    return _titleLb;
}

-(UILabel *)timeLb{
    if (!_timeLb) {
        _timeLb = [UILabel new];
        [self.contentView addSubview:_timeLb];
        _timeLb.font = [UIFont systemFontOfSize:12];
        _timeLb.textColor = [UIColor lightGrayColor];
        [_timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.width.mas_equalTo(50);
        }];
        //字体右对其
        _timeLb.textAlignment = NSTextAlignmentRight;
    }
    return _timeLb;
}

-(UILabel *)sourceLb{
    if (!_sourceLb) {
        _sourceLb = [UILabel new];
        [self.contentView addSubview:_sourceLb];
        
        _sourceLb.font = [UIFont systemFontOfSize:15];
        _sourceLb.textColor = [UIColor lightGrayColor];
        
        [_sourceLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.coverIV.mas_right).mas_equalTo(10);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
    }
    return _sourceLb;
}

-(UILabel *)playCount{
    if (!_playCount) {
        _playCount = [UILabel new];
        //添加播放次数左边的小图片
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sound_play"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.sourceLb.mas_leftMargin);
            make.bottom.mas_equalTo(-10);
            make.size.mas_equalTo(CGSizeMake(20, 20));
            make.top.mas_equalTo(self.sourceLb.mas_bottom).mas_equalTo(8);
        }];
        [self.contentView addSubview:_playCount];
        [_playCount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(3);
            make.centerY.mas_equalTo(imageView);
        }];
        _playCount.textColor = [UIColor lightGrayColor];
        _playCount.font = [UIFont systemFontOfSize:12];
    }
    return _playCount;
}

-(UILabel *)favorCountLb{
    if (!_favorCountLb) {
        _favorCountLb = [UILabel new];
        //喜欢次数左边的图片标识
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sound_likes_n"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.playCount);
            make.left.mas_equalTo(self.playCount.mas_right).mas_equalTo(7);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
        [self.contentView addSubview:_favorCountLb];
        _favorCountLb.textColor = [UIColor lightGrayColor];
        _favorCountLb.font = [UIFont systemFontOfSize:12];
        [_favorCountLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(3);
            make.centerY.mas_equalTo(imageView);
        }];
    }
    return _favorCountLb;
}

-(UILabel *)commentCountLb{
    if (!_commentCountLb) {
        _commentCountLb = [UILabel new];
        //评论数左边的图片标识
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sound_comments"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(18, 18));
            make.centerY.mas_equalTo(self.favorCountLb);
            make.left.mas_equalTo(self.favorCountLb.mas_right).mas_equalTo(7);
        }];
        [self.contentView addSubview:_commentCountLb];
        [_commentCountLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(imageView);
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(3);
        }];
        _commentCountLb.textColor = [UIColor lightGrayColor];
        _commentCountLb.font = [UIFont systemFontOfSize:12];
    }
    return _commentCountLb;
}

-(UILabel *)durationLb{
    if (!_durationLb) {
        _durationLb = [UILabel new];
        _durationLb.textColor = [UIColor lightGrayColor];
        _durationLb.font = [UIFont systemFontOfSize:12];
        //时长旁边的图片标识
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sound_duration"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.commentCountLb.mas_right).mas_equalTo(7);
            make.centerY.mas_equalTo(self.commentCountLb);
            make.size.mas_equalTo(CGSizeMake(18, 18));
        }];
        [self.contentView addSubview:_durationLb];
        [_durationLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(3);
            make.centerY.mas_equalTo(imageView);
        }];
    }
    return _durationLb;
}


-(UIButton *)downLoadBtn{
    if (!_downLoadBtn) {
        _downLoadBtn = [UIButton buttonWithType:0];
        [_downLoadBtn setBackgroundImage:[UIImage imageNamed:@"cell_download"] forState:0];
        [_downLoadBtn bk_addEventHandler:^(id sender) {
            DDLogVerbose(@"下载按钮被点击");
        } forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_downLoadBtn];
        [_downLoadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(20, 20));
            make.right.mas_equalTo(-5);
            make.centerY.mas_equalTo(self.durationLb);
        }];
    }
    return _downLoadBtn;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //为了触发下按钮的懒加载
        self.downLoadBtn.hidden = NO;
        //设置选中后的背景色
        UIView *view = [UIView new];
        view.backgroundColor = kRGBColor(243, 255, 254);
        self.selectedBackgroundView = view;
        //分割线距离左侧空间
        self.separatorInset = UIEdgeInsetsMake(0, 76, 0, 0);
    }
    return self;
}


@end
