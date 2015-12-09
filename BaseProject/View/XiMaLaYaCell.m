//
//  XiMaLaYaCell.m
//  娱乐娱乐
//
//  Created by apple-jd17 on 15/11/25.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XiMaLaYaCell.h"

@implementation XiMaLaYaCell

-(UILabel *)orderLb{
    if (!_orderLb) {
        _orderLb = [[UILabel alloc]init];
        _orderLb.font = [UIFont systemFontOfSize:18];
        _orderLb.textColor = [UIColor lightGrayColor];
        //居中
        _orderLb.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_orderLb];
        //使用KVO键值观察，如果text被赋值为1 ，颜色是...
        //下方方法：如果_orderLb 的text属性 被赋新值 则触发task
        [_orderLb bk_addObserverForKeyPath:@"text" options:NSKeyValueObservingOptionNew task:^(id obj, NSDictionary *change) {
            NSString *value = change[@"new"];
            if ([value isEqualToString:@"1"]) {
                _orderLb.textColor = [UIColor redColor];
            }else if ([value isEqualToString:@"2"]){
                _orderLb.textColor = [UIColor orangeColor];
            }else if ([value isEqualToString:@"3"]){
                _orderLb.textColor = [UIColor greenColor];
            }else{
                _orderLb.textColor = [UIColor blackColor];
            }
        }];
        [self.orderLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.width.mas_equalTo(35);
        }];
    }
    return _orderLb;
}

-(TRImageView *)iconIV{
    if (!_iconIV) {
    //这里要注意的是，TRImageView 是对UIImageView封装的类，必须要用此初始化方法才有效
        _iconIV = [[TRImageView alloc]init];
        [self.contentView addSubview:_iconIV];
        [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(65, 65));
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(self.orderLb.mas_right).mas_equalTo(0);
        }];
    }
    return _iconIV;
}

-(UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.font = [UIFont systemFontOfSize:18];
        [self.contentView addSubview:_titleLb];
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.iconIV.mas_topMargin).mas_equalTo(3);
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
    }
    return _titleLb;
}

-(UILabel *)descLb{
    if (!_descLb) {
        _descLb = [UILabel new];
        _descLb.font = [UIFont systemFontOfSize:15];
        _descLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_descLb];
        [self.descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
    }
    return _descLb;
}

-(UILabel *)numberLb{
    if (!_numberLb) {
        _numberLb = [UILabel new];
        _numberLb.font = [UIFont systemFontOfSize:12];
        _numberLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_numberLb];
        [self.numberLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.numberIV.mas_right).mas_equalTo(2);
            make.right.mas_equalTo(-10);
            make.bottomMargin.mas_equalTo(self.iconIV.mas_bottomMargin).mas_equalTo(-3);
            make.centerY.mas_equalTo(self.numberIV);
        }];
    }
    return _numberLb;
}

-(TRImageView *)numberIV{
    if (!_numberIV) {
        _numberIV = [[TRImageView alloc]init];
        _numberIV.imageView.image = [UIImage imageNamed:@"album_tracks"
                                     ];
        [self.contentView addSubview:_numberIV];
        [self.numberIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(10, 10));
        }];
    }
    return _numberIV;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    //右剪头样式
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //添加依赖autolayou 一定要有顺序，即从左到右，从上向下
        self.separatorInset = UIEdgeInsetsMake(0, 105, 0, 0);
    }
    return  self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
