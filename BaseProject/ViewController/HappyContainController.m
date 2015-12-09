//
//  HappyContainController.m
//  娱乐娱乐
//
//  Created by apple-jd17 on 15/12/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HappyContainController.h"
#import "HappyViewModel.h"
#import "HappyViewController.h"

@interface HappyContainController ()<UIScrollViewDelegate>

@end

@implementation HappyContainController

+(UINavigationController *)defaultNavi{
    static UINavigationController *navi = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        HappyContainController *vc = [[HappyContainController alloc]initWithViewControllerClasses:[self viewControllersClasses] andTheirTitles:[self itemNames]];
        vc.keys = [self vcKeys];
        vc.values = [self vcValues];
        
        navi = [[UINavigationController alloc]initWithRootViewController:vc];
    });
    return navi;
}

+(NSArray *)vcKeys{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemNames]) {
        [arr addObject:@"infoType"];
    }
    return [arr copy];
}

+(NSArray *)vcValues{
    NSMutableArray *arr = [NSMutableArray new];
    for (int i=0; i<[self itemNames].count; i++) {
        [arr addObject:@(i)];
    }
    return arr;
}

-(HappyViewController *)HappyVCWithType:(HappyListType)type{
    HappyViewController *vc = [[HappyViewController alloc]init];
    vc.type = type;
    return vc;
}

+(NSArray *)itemNames{
    return @[@"热门",@"萌宠",@"互动",@"爆笑",@"视频",@"资讯",@"生活"];
}



+(NSArray *)viewControllersClasses{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemNames]) {
        [arr addObject:[HappyViewController class]];
    }
    return [arr copy];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的头条";
    [Factory addMenuItemToVC:self];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
