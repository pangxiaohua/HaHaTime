//
//  MusicController.h
//  娱乐娱乐
//
//  Created by apple-jd17 on 15/12/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MusicController : UIViewController

-(instancetype)initWithAlbumId:(NSInteger)albumId;
@property(nonatomic)NSInteger albumId;

@property(nonatomic,strong)NSIndexPath *index;



@end
