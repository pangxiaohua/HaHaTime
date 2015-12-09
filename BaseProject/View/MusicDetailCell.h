//
//  MusicDetailCell.h
//  娱乐娱乐
//
//  Created by apple-jd17 on 15/12/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MusicDetailCell : UITableViewCell

/** 原则上.h文件中只需要放被调用get或者set方法的属性 */

/** 音乐封面图 */
@property(nonatomic,strong)TRImageView *coverIV;
/** 题目标签 */
@property(nonatomic,strong)UILabel *titleLb;
/** 添加时间标签 */
@property(nonatomic,strong)UILabel *timeLb;
/** 音乐来源标签 */
@property(nonatomic,strong)UILabel *sourceLb;
/** 播放次数标签 */
@property(nonatomic,strong)UILabel *playCount;
/** 喜欢次数标签 */
@property(nonatomic,strong)UILabel *favorCountLb;
/** 评论次数标签 */
@property(nonatomic,strong)UILabel *commentCountLb;
/** 播放时常标签 */
@property(nonatomic,strong)UILabel *durationLb;
/** 下载按钮 */
@property(nonatomic,strong)UIButton *downLoadBtn;

@end
