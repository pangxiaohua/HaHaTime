//
//  HappyNetManager.m
//  娱乐娱乐
//
//  Created by apple-jd17 on 15/12/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HappyNetManager.h"

@implementation HappyNetManager

+(id)getHappyLifeWithCate_sign:(NSString *)cate_sign Type:(HappyListType)type pubtime:(NSInteger)pubtime completionHandle:(void(^)(HappyModel *model,NSError *error))completionHandle{
    NSString *path = nil;
    
    switch (type) {
        case HappyListTypeReMen:
            path = [NSString stringWithFormat:@"http://app.lerays.com/api/stream/list?cate_sign=%@&cate_list=31&cate_type=cate&pubtime=%@",cate_sign,@(pubtime)];
            break;
        case HappyListTypeMengChong:
            path = [NSString stringWithFormat:@"http://app.lerays.com/api/stream/list?cate_sign=%@&cate_list=34&cate_type=cate&pubtime=%@",cate_sign,@(pubtime)];
            break;
        case HappyListTypeHuDong:
            path = [NSString stringWithFormat:@"http://app.lerays.com/api/stream/list?cate_sign=%@&cate_list=33&cate_type=cate&pubtime=%@",cate_sign,@(pubtime)];
            break;
        case HappyListTypeBaoXiao:
            path = [NSString stringWithFormat:@"http://app.lerays.com/api/stream/list?cate_sign=%@&cate_list=3&cate_type=cate&pubtime=%@",cate_sign,@(pubtime)];
            break;
        case HappyListTypeShiPin:
            path = [NSString stringWithFormat:@"http://app.lerays.com/api/stream/list?cate_sign=%@&cate_list=36&cate_type=cate&pubtime=%@",cate_sign,@(pubtime)];
            break;
        case HappyListTypeZiXun:
            path = [NSString stringWithFormat:@"http://app.lerays.com/api/stream/list?cate_sign=%@&cate_list=32&cate_type=cate&pubtime=%@",cate_sign,@(pubtime)];
            break;
        case HappyListTypeShengHuo:
            path = [NSString stringWithFormat:@"http://app.lerays.com/api/stream/list?cate_sign=%@&cate_list=35&cate_type=cate&pubtime=%@",cate_sign,@(pubtime)];
            break;
        default:
            break;
    }
    //因为请求下来的数据类型是一样的，所以可以合写
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
       
        completionHandle([HappyModel objectWithKeyValues:responseObj],error);
    }];
    
}

@end
