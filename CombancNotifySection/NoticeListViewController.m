//
//  NoticeListViewController.m
//  OANoticeNews
//
//  Created by Golden on 2018/9/12.
//  Copyright © 2018年 Combanc. All rights reserved.
//

#import "NoticeListViewController.h"
#import "NoticeListTableViewCell.h"
#import "NoticeDetailViewController.h"
#import "NoticeModel.h"
#import "UIColor+NoticeCategory.h"
#import "Masonry.h"

#import "NoticeInterfaceMacro.h"
#import "NoticeInterfaceRequest.h"

static NSString *const NoticeCellID = @"NoticeCellID";

@interface NoticeListViewController ()<
UITableViewDelegate,
UITableViewDataSource,
UISearchBarDelegate>

@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation NoticeListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"通知";
    [self configUI];
    [self requestNoticelist];
}

- (void)setToken:(NSString *)token {
    [[NSUserDefaults standardUserDefaults] setObject:token forKey:NoticeToken];
}

- (void)configUI {
    self.myTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.showsVerticalScrollIndicator = NO;
    self.myTableView.showsHorizontalScrollIndicator = NO;
    self.myTableView.estimatedRowHeight = 80;
    self.myTableView.rowHeight = UITableViewAutomaticDimension;
    self.myTableView.tableFooterView = [UIView new];
    self.myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.myTableView.backgroundColor = [UIColor colorWithHex:@"#EBEBF1"];
    [self.view addSubview:self.myTableView];
    
    self.searchBar = [[UISearchBar alloc]initWithFrame:CGRectZero];
    [self.searchBar setPlaceholder:@"搜索"];
    [self.searchBar setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitle:@"取消"];
    [self.searchBar setTintColor:[UIColor blueColor]];
    [self.searchBar setShowsCancelButton:NO animated:YES];
    [self.searchBar setBackgroundImage:[UIColor createImageWithColor:[UIColor colorWithHex:@"#EBEBF1"]]];
    UIView *searchTextField = [[[self.searchBar.subviews firstObject] subviews] lastObject];
    [searchTextField setBackgroundColor:[UIColor whiteColor]];
    self.searchBar.delegate = self;
    [self.searchBar sizeToFit];
    [self.view addSubview:self.searchBar];
    
    [self.searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(0);
        make.left.right.equalTo(self.view);
    }];
    [self.myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.searchBar.mas_bottom);
        make.left.right.bottom.equalTo(self.view);
    }];
}

#pragma mark - TableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NoticeListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NoticeCellID];
    if (!cell) {
        cell = [[NoticeListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NoticeCellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor colorWithHex:@"#EBEBF1"];
    NoticelistModel *model = self.dataArray[indexPath.row];
    cell.timeLabel.text = model.createTime;
    cell.authorLabel.text = [NSString stringWithFormat:@"发布人：%@",model.userName];
    cell.titleLabel.text = model.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NoticeDetailViewController *noticeDetailVC = [[NoticeDetailViewController alloc]init];
    noticeDetailVC.model = self.dataArray[indexPath.row];
    [self.navigationController pushViewController:noticeDetailVC animated:YES];
}

#pragma mark - SearchBarDelegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    [self.searchBar setShowsCancelButton:YES animated:YES];
    return YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self.searchBar resignFirstResponder];
    [self.searchBar setShowsCancelButton:NO animated:YES];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.searchBar resignFirstResponder];
}

#pragma mark - 网络请求
- (void)requestNoticelist {
    [NoticeInterfaceRequest requestNoticeList:noticelistParam(@"1", @"10", @"", @"", @[], @"") success:^(id json) {
        self.dataArray = json;
        [self.myTableView reloadData];
    } failed:^(NSError *error) {}];
}
@end
