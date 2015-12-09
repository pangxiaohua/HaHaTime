//
//  HappyViewModel.h
//  娱乐娱乐
//
//  Created by apple-jd17 on 15/12/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "HappyNetManager.h"

@interface HappyViewModel : BaseViewModel

-(NSURL *)picURLFowRow:(NSInteger)row;

-(NSString *)titleFowRow:(NSInteger)row;
-(NSString *)slanFowRow:(NSInteger)row;

@property(nonatomic,strong)NSString *cate_sign;
@property(nonatomic)NSInteger pubtime;

@property(nonatomic)HappyListType type;

-(id)initWithHappyListType:(HappyListType)type;

-(BOOL)isMaxCellForRow:(NSInteger)row;



@end
