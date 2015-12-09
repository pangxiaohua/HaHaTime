//
//  XiMaNetManager.m
//  娱乐娱乐
//
//  Created by apple-jd17 on 15/11/25.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XiMaNetManager.h"

@implementation XiMaNetManager

/** 音乐top50的地址宏定义 通过宏定义，以后可以轻松的换掉接口 */
#define kRankListPath @"http://mobile.ximalaya.com/mobile/discovery/v1/rankingList/album"
#define kAlbumPath @"http://mobile.ximalaya.com/mobile/others/ca/album/track/%@/true/%@/20"


+(id)getRankListWithPageId:(NSInteger)PageId completionHandle:(void (^)(id, NSError *))completionHandle{
    //http://mobile.ximalaya.com/mobile/discovery/v1/rankingList/album?device=iPhone&key=ranking:album:played:1:2&pageId=1&pageSize=20&position=0&title=排行榜

    NSDictionary *params = @{@"device":@"iPhone",@"key":@"ranking:album:played:1:2",@"pageId":@(PageId),@"pageSize":@20,@"position":@0,@"title":@"排行榜"};
    return [self GET:kRankListPath parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([XiMaLaYaModel objectWithKeyValues:responseObj],error);
    }];
    
}


+(id)getAlbumWithId:(NSInteger)ID page:(NSInteger)pageId completionHandle:(void (^)(id, NSError *))completionHandle{
    
    NSString *path = [NSString stringWithFormat:kAlbumPath,@(ID),@(pageId)];
    
    return [self GET:path parameters:@{@"device":@"iPhone"} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([AlbumModdel objectWithKeyValues:responseObj],error);
    }];
}






@end
