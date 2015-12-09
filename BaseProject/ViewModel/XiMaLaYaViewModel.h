//
//  XiMaLaYaViewModel.h
//  娱乐娱乐
//
//  Created by apple-jd17 on 15/11/25.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "XiMaNetManager.h"

@interface XiMaLaYaViewModel : BaseViewModel

/** 某条数据的图片URL */
-(NSURL *)iconURLForRow:(NSInteger)row;
/** 某条数据的题目 */
-(NSString *)titleForRow:(NSInteger)row;
/** 某条数据的描述 */
-(NSString *)descForRow:(NSInteger)row;
/** 某条数据的集数 */
-(NSString *)numberForRow:(NSInteger)row;
/** 当前页数 */
@property(nonatomic)NSInteger PageId;

/** 当前页数对应的数据ID */
-(NSInteger)ablumIdForRow:(NSInteger)row;

/** 当前最大页数 */
@property(nonatomic)NSInteger maxPageId;

/** 是否有更多页面 */
@property(nonatomic,getter=isHasMore)BOOL hasMore;



@end
