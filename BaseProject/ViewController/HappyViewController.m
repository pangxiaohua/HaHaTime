//
//  HappyViewController.m
//  娱乐娱乐
//
//  Created by apple-jd17 on 15/12/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HappyViewController.h"
#import "HappyViewModel.h"
#import "HappyViewCell.h"

@interface HappyViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong)UICollectionView *collectionVM;
@property(nonatomic,strong)HappyViewModel *happyVM;

@end

@implementation HappyViewController

-(UICollectionView *)collectionVM{
    if (!_collectionVM) {
        _collectionVM = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
        _collectionVM.dataSource = self;
        _collectionVM.delegate = self;
        _collectionVM.backgroundColor = [UIColor whiteColor];
        
        [_collectionVM registerClass:[HappyViewCell class] forCellWithReuseIdentifier:@"Cell"];
        [_collectionVM registerClass:[HappyMaxViewCell class] forCellWithReuseIdentifier:@"MaxCell"];
        
        [self.view addSubview:_collectionVM];
        [_collectionVM mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        
        
        _collectionVM.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.happyVM refreshDataCompletionHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    [_collectionVM reloadData];
                }
                [_collectionVM.header endRefreshing];
            }];
        }];
        
        
        _collectionVM.footer = [MJRefreshBackFooter footerWithRefreshingBlock:^{
           [self.happyVM getMoreDataCompletionHandle:^(NSError *error) {
               if (error) {
                   [self showErrorMsg:error.localizedDescription];
               }else{
                   [_collectionVM reloadData];
               }
               [_collectionVM.footer endRefreshing];
           }];
        }];
    }
    return _collectionVM;
}

-(HappyViewModel *)happyVM{
    if (!_happyVM) {
        switch (self.infoType.integerValue) {
            case 0:
                _happyVM = [[HappyViewModel alloc]initWithHappyListType:HappyListTypeReMen];
                break;
            case 1:
                _happyVM = [[HappyViewModel alloc]initWithHappyListType:HappyListTypeMengChong];
                break;
            case 2:
                _happyVM = [[HappyViewModel alloc]initWithHappyListType:HappyListTypeHuDong];
                break;
            case 3:
                _happyVM = [[HappyViewModel alloc]initWithHappyListType:HappyListTypeBaoXiao];
                break;
            case 4:
                _happyVM = [[HappyViewModel alloc]initWithHappyListType:HappyListTypeShiPin];
                break;
            case 5:
                _happyVM = [[HappyViewModel alloc]initWithHappyListType:HappyListTypeZiXun];
                break;
            case 6:
                _happyVM = [[HappyViewModel alloc]initWithHappyListType:HappyListTypeShengHuo];
                break;
            default:
                break;
        }
    }
    return _happyVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
    self.navigationItem.title = @"热门头条";
    
    [self.collectionVM.header beginRefreshing];
    self.view.backgroundColor = [UIColor whiteColor];
}


+(UINavigationController *)defaultNavi{
    static UINavigationController *navi = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        HappyViewController *vc = [HappyViewController new];
        navi = [[UINavigationController alloc]initWithRootViewController:vc];
    });
    return navi;
}



#pragma mark - UICollectionViewDelegate

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.happyVM.rowNumber;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row%7 == 0) {
        HappyMaxViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MaxCell" forIndexPath:indexPath];
        [cell.imageView.imageView setImageWithURL:[self.happyVM picURLFowRow:indexPath.row]];
        cell.titleLb.text = [self.happyVM titleFowRow:indexPath.row];
        cell.slanLb.text = [self.happyVM slanFowRow:indexPath.row];
        
        return cell;
    }
    
    HappyViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell.imageView.imageView setImageWithURL:[self.happyVM picURLFowRow:indexPath.row]];
    cell.titleLb.text = [self.happyVM titleFowRow:indexPath.row];
    cell.slanLb.text = [self.happyVM slanFowRow:indexPath.row];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

//列间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
//行间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

//每个cell的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row%7==0) {
        CGFloat width = kWindowW;
        CGFloat height = 180;
        return CGSizeMake(width, height);
    }
    CGFloat width = kWindowW/2.0 ;
    CGFloat height = 180;
    return CGSizeMake(width, height);
}


@end
