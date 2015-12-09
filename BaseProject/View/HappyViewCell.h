//
//  HappyViewCell.h
//  娱乐娱乐
//
//  Created by apple-jd17 on 15/12/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HappyViewCell : UICollectionViewCell

@property(nonatomic,strong)TRImageView *imageView;
@property(nonatomic,strong)UILabel *titleLb;
@property(nonatomic,strong)UILabel *slanLb;
@property(nonatomic,strong)UIImageView *eyeView;

@end

@interface HappyMaxViewCell : UICollectionViewCell

@property(nonatomic,strong)TRImageView *imageView;
@property(nonatomic,strong)UIView *backgroundVw;
@property(nonatomic,strong)UILabel *titleLb;
@property(nonatomic,strong)UILabel *slanLb;
@property(nonatomic,strong)UIImageView *eyeView;

@end
