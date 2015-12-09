//
//  PlayView.h
//  娱乐娱乐
//
//  Created by apple-jd17 on 15/12/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface PlayView : UIView

+(PlayView *)sharedInstance;

-(void)playWithURL:(NSURL *)musicURL;

@property(nonatomic,strong)AVPlayer *player;
@property(nonatomic,strong)UIButton *playBtn;

@property(nonatomic,strong)UIView *view;
@property(nonatomic,strong)UIButton *lastMusic;
@property(nonatomic,strong)UIButton *nextMusic;

@end
