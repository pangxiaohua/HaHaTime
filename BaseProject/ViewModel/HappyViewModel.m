//
//  HappyViewModel.m
//  娱乐娱乐
//
//  Created by apple-jd17 on 15/12/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HappyViewModel.h"

@implementation HappyViewModel


-(id)initWithHappyListType:(HappyListType)type{
    if (self = [super init]) {
        self.type = type;
    }
    return self;
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
   self.dataTask = [HappyNetManager getHappyLifeWithCate_sign:_cate_sign Type:_type pubtime:_pubtime completionHandle:^(HappyModel *model, NSError *error) {
       if (!error) {
           if ([_cate_sign isEqualToString:@"null"]&&(_pubtime == 0)) {
               [self.dataArr removeAllObjects];
           }
           [self.dataArr addObjectsFromArray:model.data.list];
           _cate_sign = model.data.nextsign;
           _pubtime = model.data.nexttime;
       }
       completionHandle(error);
   }];
}

-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _cate_sign = @"null";
    _pubtime = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}


-(HappyDataListModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}


-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    
    [self getDataFromNetCompleteHandle:completionHandle];
    
}

-(NSURL *)picURLFowRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].img_src];
}

-(NSString *)titleFowRow:(NSInteger)row{
    return [self modelForRow:row].title;
}

-(NSString *)slanFowRow:(NSInteger)row{
    return @([self modelForRow:row].visit_num).stringValue;
}

-(BOOL)isMaxCellForRow:(NSInteger)row{
    
    if ([[self modelForRow:row].is_rec isEqualToString:@"0"]) {
        return YES;
    }
    return NO;
}


@end
