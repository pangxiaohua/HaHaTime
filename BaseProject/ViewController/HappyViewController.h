//
//  HappyViewController.h
//  娱乐娱乐
//
//  Created by apple-jd17 on 15/12/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HappyViewModel.h"

@interface HappyViewController : UIViewController

+(UINavigationController *)defaultNavi;
@property(nonatomic)HappyListType type;
/** 接收外部传参，决定当前控制器现实那种类型 */
@property(nonatomic,strong)NSNumber *infoType;


@end
