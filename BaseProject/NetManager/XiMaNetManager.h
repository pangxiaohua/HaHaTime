//
//  XiMaNetManager.h
//  娱乐娱乐
//
//  Created by apple-jd17 on 15/11/25.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "XiMaLaYaModel.h"
#import "AlbumModdel.h"

@interface XiMaNetManager : BaseNetManager

/**
 *  获取音乐分类列表 top500
 *
 *  @param PageID 当前页数从1开始 eg 1,2,3,4,5...
 *
 *  @return 返回当前请求所在的任务
 */
+(id)getRankListWithPageId:(NSInteger)PageId kCompletionHandle;


/**
 *
 *  @param ID     音乐组ID
 *  @param pageId 当前页数 ，从1开始，eg 1,2,3,4...
 *
 *  @return 返回当前请求所在任务
 */
+(id)getAlbumWithId:(NSInteger)ID page:(NSInteger)pageId kCompletionHandle;


@end
