//
//  XiMaLaYaController.m
//  娱乐娱乐
//
//  Created by apple-jd17 on 15/11/25.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XiMaLaYaController.h"
#import "XiMaLaYaViewModel.h"
#import "XiMaLaYaCell.h"
#import "Factory.h"
#import "MusicController.h"


@interface XiMaLaYaController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)XiMaLaYaViewModel *ximaVM;

@end

@implementation XiMaLaYaController

-(XiMaLaYaViewModel *)ximaVM{
    if (!_ximaVM) {
        _ximaVM = [XiMaLaYaViewModel new];
    }
    return _ximaVM;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
/* 行高一样用rowheight 不然影响效率，所以这里删除了返回高度的协议方法，改为rowheight */
        _tableView.rowHeight = 85;
        _tableView.estimatedRowHeight = 85;
        [_tableView registerClass:[XiMaLaYaCell class] forCellReuseIdentifier:@"Cell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
           [self.ximaVM refreshDataCompletionHandle:^(NSError *error) {
               if (error) {
                   [self showErrorMsg:error];
               }else{
                   [self.tableView reloadData];
                   //重置脚步，没有更过数据
                   [_tableView.footer resetNoMoreData];
               }
               [_tableView.header endRefreshing];
           }];
        }];
        self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
           [self.ximaVM getMoreDataCompletionHandle:^(NSError *error) {
               if (error) {
                   [self showErrorMsg:error.localizedDescription];
               }else{
                   [self.tableView reloadData];
                   if ([self.ximaVM isHasMore]) {
                       [_tableView.footer endRefreshing];
                   }else{
                       [_tableView.footer endRefreshingWithNoMoreData];
                   }
               }
           }];
        }];
    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [Factory addMenuItemToVC:self];
    self.title = @"音乐top50";
    [self.tableView.header beginRefreshing];
}


+(UINavigationController *)defaultNavi{
    static UINavigationController *navi = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        XiMaLaYaController *vc = [XiMaLaYaController new];
        navi = [[UINavigationController alloc]initWithRootViewController:vc];
    });
    return navi;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableView

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.ximaVM.rowNumber;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XiMaLaYaCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.titleLb.text = [self.ximaVM titleForRow:indexPath.row];
    [cell.iconIV.imageView setImageWithURL:[self.ximaVM iconURLForRow:indexPath.row]];
    cell.orderLb.text = @(indexPath.row + 1).stringValue;
    cell.descLb.text = [self.ximaVM descForRow:indexPath.row];
    cell.numberLb.text = [self.ximaVM numberForRow:indexPath.row];
   // cell.backgroundColor = [UIColor yellowColor];
    return cell;
}

kRemoveCellSeparator
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MusicController *vc = [[MusicController alloc]initWithAlbumId:[self.ximaVM ablumIdForRow:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];   
}


@end
