//
//  XiMaLaYaViewModel.m
//  娱乐娱乐
//
//  Created by apple-jd17 on 15/11/25.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XiMaLaYaViewModel.h"

@implementation XiMaLaYaViewModel

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [XiMaNetManager getRankListWithPageId:_PageId completionHandle:^(XiMaLaYaModel *model, NSError *error) {
        if (!error) {
            if (_PageId == 1) {
                [self.dataArr removeAllObjects];
            }
            [self.dataArr addObjectsFromArray:model.list];
            _maxPageId = model.maxPageId;
        }
        completionHandle(error);
    }];
}

-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _PageId = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}

-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    if (self.isHasMore) {
        _PageId +=1;
        [self getDataFromNetCompleteHandle:completionHandle];
    }else{
        NSError *err = [NSError errorWithDomain:@"" code:999 userInfo:@{NSLocalizedDescriptionKey:@"没有更多数据了"}];
        completionHandle(err);
    }
}

-(XiMaModelList *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}

-(NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].albumCoverUrl290];
}

-(NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}

-(NSString *)descForRow:(NSInteger)row{
    return [self modelForRow:row].intro;
}

-(NSString *)numberForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"%ld集",(long)[self modelForRow:row].tracks];
}

-(BOOL)isHasMore{
    return _maxPageId > _PageId;
}

-(NSInteger)ablumIdForRow:(NSInteger)row{
    return [self modelForRow:row].albumId;
}



@end
