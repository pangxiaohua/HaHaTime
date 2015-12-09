//
//  XiMaLaYaController.h
//  娱乐娱乐
//
//  Created by apple-jd17 on 15/11/25.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XiMaLaYaController : UIViewController
/** 制作单例的原因：侧边栏需要经常切换内容页，内容页不应该随着切换而被注释掉，每次切换应该都是同一个内存地址 */

+(UINavigationController *)defaultNavi;

@end
