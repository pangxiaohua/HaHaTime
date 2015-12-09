//
//  XiMaAlbumViewModel.m
//  娱乐娱乐
//
//  Created by apple-jd17 on 15/12/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XiMaAlbumViewModel.h"

@implementation XiMaAlbumViewModel

-(NSInteger)rowNumber{
    return self.dataArr.count;
}

-(BOOL)isHasMore{
    return _maxPageId > _pageId;
}

/** 刷新，继承自基类中 */
-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    
    _pageId = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}

/**加载更多，继承自基类中 */
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _pageId += 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}

/** 请求网络(刷新和加载更多都是调用这个方法来获取数据) */
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    
    self.dataTask = [XiMaNetManager getAlbumWithId:_albumId page:_pageId completionHandle:^(AlbumModdel *model, NSError *error) {
        if (_pageId == 1) {
            [self.dataArr removeAllObjects];
        }
        
        [self.dataArr addObjectsFromArray:model.tracks.list];
        _maxPageId = model.tracks.maxPageId;
        completionHandle(error);
    }];
}

-(instancetype)initWithAlbumId:(NSInteger)albumId{
    if (self = [super init]) {
        self.albumId = albumId;
    }
    return self;
}

-(AlbumListModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}

/** 获取某行的封面图片URL */
-(NSURL *)coverURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].coverSmall];
}

/** 获取某行题目 */
-(NSString *)titleLForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}

/** 获取某行更新时间 */
-(NSString *)timeLForRow:(NSInteger)row{
    //获取秒数
    NSTimeInterval currentTime = [[NSDate date]timeIntervalSince1970];
    //算出当前时间和创建时间的间隔秒数
    NSTimeInterval delta = currentTime - [self modelForRow:row].createdAt/1000;
    //秒数转小时
    NSInteger hours = delta/3600;
    if (hours < 24) {
        return [NSString stringWithFormat:@"%d小时前",hours];
    }
    //秒数转天数
    NSInteger days = delta/3600*24;
    return [NSString stringWithFormat:@"%d天",days];
}

/** 获取某行出处 */
-(NSString *)sourceLForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"by %@",[self modelForRow:row].nickname];
}

/** 获取某行播放数 */
-(NSString *)playCountLForRow:(NSInteger)row{
    NSInteger count = [self modelForRow:row].playtimes;
    if (count < 10000) {
        return @([self modelForRow:row].playtimes).stringValue;
    }else{
        return [NSString stringWithFormat:@"%.1f万",count/10000.0];
    }
}

/** 获取某行喜欢数 */
-(NSString *)favorCountLForRow:(NSInteger)row{
    return @([self modelForRow:row].likes).stringValue;
}

/** 获取某行评论数 */
-(NSString *)commentCountLForRow:(NSInteger)row{
    return @([self modelForRow:row].comments).stringValue;
}

/** 获取播放时长 */
-(NSString *)durationLForRow:(NSInteger)row{
    NSInteger duration = [self modelForRow:row].duration;
    NSInteger minute = duration/60;
    NSInteger second = duration%60;
//%02ld 表示小于两位 用0补位 ，例如1 显示01
    return [NSString stringWithFormat:@"%ld:%ld",(long)minute,(long)second];
}

/** 某行下载链接地址 */
-(NSURL *)downLoadURLLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].downloadUrl];
}

/** 获取某行音频播放地址 */
-(NSURL *)musicURLLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].playUrl64];
}





@end
