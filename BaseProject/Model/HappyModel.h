//
//  HappyModel.h
//  娱乐娱乐
//
//  Created by apple-jd17 on 15/12/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class HappyExtModel,HappyDataModel,HappyDataListModel,HappyDataListDisplayModel,HappyDataListActionModel,HappyDataListImg_PositionModel;
@interface HappyModel : BaseModel

@property (nonatomic, assign) BOOL status;

@property (nonatomic, strong) HappyDataModel *data;

@property (nonatomic, strong) HappyExtModel *ext;

@property (nonatomic, assign) NSInteger count;

@end
@interface HappyExtModel : NSObject

@property (nonatomic, assign) NSInteger trending_border;

@property (nonatomic, copy) NSString *inter_url;

@property (nonatomic, assign) NSInteger c_time;

@end

@interface HappyDataModel : NSObject

@property (nonatomic, assign) NSInteger pageno;

@property (nonatomic, assign) NSInteger currtime;

@property (nonatomic, assign) NSInteger prevtime;

@property (nonatomic, assign) NSInteger nexttime;

@property (nonatomic, strong) NSArray<HappyDataListModel *> *list;

@property (nonatomic, copy) NSString *currsign;

@property (nonatomic, copy) NSString *prevsign;

@property (nonatomic, copy) NSString *nextsign;

@end

@interface HappyDataListModel : NSObject

@property (nonatomic, assign) BOOL is_promote;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) BOOL has_image;

@property (nonatomic, copy) NSString *summary;

@property (nonatomic, copy) NSString *ncate_id;

@property (nonatomic, copy) NSString *src_id;

@property (nonatomic, assign) NSInteger visit_num;

@property (nonatomic, assign) BOOL has_quiz;

@property (nonatomic, assign) BOOL is_trending;

@property (nonatomic, strong) HappyDataListActionModel *action;

@property (nonatomic, copy) NSString *pubtime;

@property (nonatomic, copy) NSString *img_src;

@property (nonatomic, assign) BOOL is_original;

@property (nonatomic, strong) HappyDataListImg_PositionModel *img_position;

@property (nonatomic, copy) NSString *has_attr;

@property (nonatomic, assign) BOOL has_video;

@property (nonatomic, copy) NSString *Id;

@property (nonatomic, assign) NSInteger topic_id;

@property (nonatomic, strong) HappyDataListDisplayModel *display;

@property (nonatomic, copy) NSString *src_link;

@property (nonatomic, copy) NSString *ack_code;

@property (nonatomic, copy) NSString *src_title;

@property (nonatomic, copy) NSString *is_rec;

@property (nonatomic, assign) BOOL is_hot;

@property (nonatomic, copy) NSString *cate_id;

@end

@interface HappyDataListDisplayModel : NSObject

@property (nonatomic, copy) NSString *type;

@property (nonatomic, assign) NSInteger value;

@end

@interface HappyDataListActionModel : NSObject

@property (nonatomic, copy) NSString *target;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *value;

@end

@interface HappyDataListImg_PositionModel : NSObject

@property (nonatomic, assign) CGFloat x;

@property (nonatomic, assign) CGFloat y;

@end

