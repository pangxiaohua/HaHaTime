//
//  PlayView.m
//  娱乐娱乐
//
//  Created by apple-jd17 on 15/12/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "PlayView.h"

@implementation PlayView

+(PlayView *)sharedInstance{
    static PlayView *p = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        p = [[PlayView alloc]init];
    });
    return p;
}

-(id)init{
    if (self = [super init]) {
        self.playBtn.hidden = NO;
        self.nextMusic.hidden = NO;
        self.lastMusic.hidden = NO;
    }
    return self;
}

-(UIView *)view{
    if (!_view) {
        _view = [UIView new];
        _view.backgroundColor = kRGBColor(234, 164, 184);
        [self addSubview:_view];
        [_view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _view;
}



-(UIButton *)playBtn{
    if (!_playBtn) {
        _playBtn = [UIButton buttonWithType:0];
        [_playBtn setBackgroundImage:[UIImage imageNamed:@"toolbar_play_n_p"] forState:UIControlStateNormal];
        [_playBtn setBackgroundImage:[UIImage imageNamed:@"toolbar_pause_n_p"] forState:UIControlStateSelected];
        
        [self.view addSubview:_playBtn];
        [_playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.centerY.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(45, 45));
        }];
//        [_playBtn bk_addEventHandler:^(UIButton *sender) {
//            if (sender.selected) {
//                [_player pause];
//            }else{
//                [_player play];
//            }
//            sender.selected = !sender.selected;
//        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _playBtn;
}

-(UIButton *)lastMusic{
    if (!_lastMusic) {
        _lastMusic = [UIButton buttonWithType:0];
        [_lastMusic setBackgroundImage:[UIImage imageNamed:@"toolbar_prev_n_p"] forState:UIControlStateNormal];
        [_lastMusic setBackgroundImage:[UIImage imageNamed:@"toolbar_prev_h"] forState:UIControlStateSelected];
        [self.view addSubview:_lastMusic];
        [_lastMusic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(45, 45));
            make.right.mas_equalTo(self.playBtn.mas_left).mas_equalTo(-20);
        }];
    }
    return _lastMusic;
}

-(UIButton *)nextMusic{
    if (!_nextMusic) {
        _nextMusic = [UIButton buttonWithType:0];
        [_nextMusic setBackgroundImage:[UIImage imageNamed:@"toolbar_next_n_p"] forState:UIControlStateNormal];
        [_nextMusic setBackgroundImage:[UIImage imageNamed:@"toolbar_next_h"] forState:UIControlStateSelected];
        
        [self.view addSubview:_nextMusic];
        [_nextMusic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(45, 45));
            make.left.mas_equalTo(self.playBtn.mas_right).mas_equalTo(20);
        }];
    }
    return _nextMusic;
}


-(void)playWithURL:(NSURL *)musicURL{
    //设置支持的类别
    [[AVAudioSession sharedInstance]setCategory:AVAudioSessionCategoryPlayback error:nil];
    //激活
    [[AVAudioSession sharedInstance]setActive:YES error:nil];
    
    //static AVPlayer *player = nil;
    _player = [AVPlayer playerWithURL:musicURL];
    [_player play];
    self.playBtn.selected = YES;
}


@end
