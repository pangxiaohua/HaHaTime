//
//  MusicController.m
//  娱乐娱乐
//
//  Created by apple-jd17 on 15/12/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MusicController.h"
#import "XiMaAlbumViewModel.h"
#import "MusicDetailCell.h"
#import "PlayView.h"



@interface MusicController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)XiMaAlbumViewModel *albumVM;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)PlayView *playView;

@property(nonatomic)NSInteger PlayRow;

@end

@implementation MusicController

-(XiMaAlbumViewModel *)albumVM{
    if (!_albumVM) {
        _albumVM = [[XiMaAlbumViewModel alloc]initWithAlbumId:_albumId];
    }
    return _albumVM;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [_tableView registerClass:[MusicDetailCell class] forCellReuseIdentifier:@"Cell"];
        
        _tableView.rowHeight = 90;
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
           [self.albumVM refreshDataCompletionHandle:^(NSError *error) {
               if (error) {
                   [self showErrorMsg:error.localizedDescription];
               }else{
                   [_tableView reloadData];
                   [_tableView.footer resetNoMoreData];
               }
               [_tableView.header endRefreshing];
           }];
        }];
        
        _tableView.footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
           [self.albumVM getMoreDataCompletionHandle:^(NSError *error) {
               if (error) {
                   [self showErrorMsg:error.localizedDescription];
                   [_tableView.footer endRefreshing];
               }else{
                   [_tableView reloadData];
                   if (self.albumVM.isHasMore) {
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

-(PlayView *)playView{
    if (!_playView) {
        _playView = [PlayView sharedInstance];
    }
    return _playView;
}

-(instancetype)initWithAlbumId:(NSInteger)albumId{
    if (self = [super init]) {
        self.albumId = albumId;
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *filePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSLog(@"地址:%@",filePath);
    
    self.navigationItem.title = @"列表歌单";
    [Factory addBackItemToVC:self];
    [self.tableView.header beginRefreshing];
//添加播放控制器视图
    [self.view addSubview:self.playView];
    [self.playView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(45);
    }];
    
}

-(void)play{
    if (!self.PlayRow) return;
    
        [_playView.playBtn bk_addEventHandler:^(UIButton *sender) {
        if (sender.selected) {
            [_playView.player pause];
        }else{
            [_playView.player play];
        }
            sender.selected = !sender.selected;
    } forControlEvents:UIControlEventTouchUpInside];
}

-(void)nextMusic{
    NSLog(@"进来了吗？");
    if (!self.PlayRow){
        return;
    }
    
    [_playView.nextMusic bk_addEventHandler:^(id sender) {
        ++self.PlayRow;
        [[PlayView sharedInstance]playWithURL:[self.albumVM musicURLLForRow:self.PlayRow]];
        NSLog(@"怎么不进来啊");
        
    } forControlEvents:UIControlEventTouchUpInside];
    NSLog(@"wohehe");

}

-(void)lastMusic{
    if (!self.PlayRow|(self.PlayRow <0)) {
        return;
    }
    
    [_playView.lastMusic bk_addEventHandler:^(id sender) {
        --self.PlayRow;
        [[PlayView sharedInstance]playWithURL:[self.albumVM musicURLLForRow:self.PlayRow]];
        NSLog(@"怎么不进来啊");

    } forControlEvents:UIControlEventTouchUpInside];
    
    
}



#pragma mark - UITableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.albumVM.rowNumber;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MusicDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    [cell.coverIV.imageView setImageWithURL:[self.albumVM coverURLForRow:indexPath.row]];
    cell.titleLb.text = [self.albumVM titleLForRow:indexPath.row];
    cell.timeLb.text = [self.albumVM timeLForRow:indexPath.row];
    cell.sourceLb.text = [self.albumVM sourceLForRow:indexPath.row];
    cell.playCount.text = [self.albumVM playCountLForRow:indexPath.row];
    cell.favorCountLb.text = [self.albumVM favorCountLForRow:indexPath.row];
    cell.commentCountLb.text = [self.albumVM commentCountLForRow:indexPath.row];
    cell.durationLb.text = [self.albumVM durationLForRow:indexPath.row];
    
    return cell;
}

kRemoveCellSeparator
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [[PlayView sharedInstance]playWithURL:[self.albumVM musicURLLForRow:indexPath.row]];
    self.playView.playBtn.selected = YES;
    
    self.PlayRow = indexPath.row;
    [self play];
    [self nextMusic];
    [self lastMusic];
}

//允许自动布局
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
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
