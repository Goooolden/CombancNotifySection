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

static NSString *const NoticeCellID = @"NoticeCellID";

@interface NoticeListViewController ()<
UITableViewDelegate,
UITableViewDataSource,
UISearchBarDelegate>

@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) UISearchBar *searchBar;

@end

@implementation NoticeListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"通知";
    [self configUI];
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
        make.top.equalTo(self.view.mas_top).offset(64);
        make.left.right.equalTo(self.view);
    }];
    [self.myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.searchBar.mas_bottom);
        make.left.right.bottom.equalTo(self.view);
    }];
}

#pragma mark - TableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NoticeListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NoticeCellID];
    if (!cell) {
        cell = [[NoticeListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NoticeCellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor colorWithHex:@"#EBEBF1"];
    cell.timeLabel.text = @"08-11 15:30";
    cell.authorLabel.text = @"发布人：管理员";
    cell.titleLabel.text = @"教育局教育局转发渭南市教育局人社局关于做好第十一批陕西省特级教师评选的级评工作工作";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NoticeDetailViewController *noticeDetailVC = [[NoticeDetailViewController alloc]init];
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

@end
