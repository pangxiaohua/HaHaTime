//
//  XiMaAlbumViewModel.h
//  娱乐娱乐
//
//  Created by apple-jd17 on 15/12/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "XiMaNetManager.h"

@interface XiMaAlbumViewModel : BaseViewModel

/** 专门的初始化方法 */
-(instancetype)initWithAlbumId:(NSInteger)albumId NS_DESIGNATED_INITIALIZER;

@property(nonatomic)NSInteger albumId;

/** 当前请求页数 */
@property(nonatomic)NSInteger pageId;

/** 最大页数 */
@property(nonatomic)NSInteger maxPageId;

/** 是否有更多页 */
@property(nonatomic,getter=isHasMore)BOOL hasMore;

/** 获取某行的封面图片URL */
-(NSURL *)coverURLForRow:(NSInteger)row;

/** 获取某行题目 */
-(NSString *)titleLForRow:(NSInteger)row;

/** 获取某行更新时间 */
-(NSString *)timeLForRow:(NSInteger)row;

/** 获取某行出处 */
-(NSString *)sourceLForRow:(NSInteger)row;

/** 获取某行播放数 */
-(NSString *)playCountLForRow:(NSInteger)row;

/** 获取某行喜欢数 */
-(NSString *)favorCountLForRow:(NSInteger)row;

/** 获取某行评论数 */
-(NSString *)commentCountLForRow:(NSInteger)row;

/** 获取播放时长 */
-(NSString *)durationLForRow:(NSInteger)row;

/** 某行下载链接地址 */
-(NSURL *)downLoadURLLForRow:(NSInteger)row;

/** 获取某行音频播放地址 */
-(NSURL *)musicURLLForRow:(NSInteger)row;

@end
