//
//  HappyNetManager.h
//  娱乐娱乐
//
//  Created by apple-jd17 on 15/12/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "HappyModel.h"

typedef NS_ENUM(NSUInteger, HappyListType) {
    HappyListTypeReMen, //热门
    HappyListTypeMengChong, //萌宠
    HappyListTypeHuDong,  //互动
    HappyListTypeBaoXiao,  // 爆笑
    HappyListTypeShiPin,  //视频
    HappyListTypeZiXun,   //资讯
    HappyListTypeShengHuo,  //生活
};

@interface HappyNetManager : BaseNetManager

+(id)getHappyLifeWithCate_sign:(NSString *)cate_sign Type:(HappyListType)type pubtime:(NSInteger)pubtime completionHandle:(void(^)(HappyModel *model,NSError *error))completionHandle;


@end
