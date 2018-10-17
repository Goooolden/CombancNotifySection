//
//  NoticeListTableViewCell.m
//  OANoticeNews
//
//  Created by Golden on 2018/9/12.
//  Copyright © 2018年 Combanc. All rights reserved.
//

#import "NoticeListTableViewCell.h"
#import "Masonry.h"
#import "UIColor+NoticeCategory.h"

@interface NoticeListTableViewCell()

@property (nonatomic, strong) UIView *backGroundView;

@end

@implementation NoticeListTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self configUI];
    }
    return self;
}

- (void)configUI {
    self.backGroundView = [[UIView alloc]init];
    self.backGroundView.backgroundColor = [UIColor whiteColor];
    self.backGroundView.layer.cornerRadius = 10;
    [self.contentView addSubview:self.backGroundView];
    
    self.timeLabel = [[UILabel alloc]init];
    self.timeLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    self.timeLabel.textColor = [UIColor colorWithHex:@"#8e8e93"];
    [self.backGroundView addSubview:self.timeLabel];
    
    self.authorLabel = [[UILabel alloc]init];
    self.authorLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    self.authorLabel.textColor = [UIColor colorWithHex:@"#8e8e93"];
    [self.backGroundView addSubview:self.authorLabel];
    
    self.lineLabel = [[UILabel alloc]init];
    self.lineLabel.backgroundColor = [UIColor colorWithHex:@"#EBEBF1"];
    [self.backGroundView addSubview:self.lineLabel];
    
    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:17];
    self.titleLabel.textColor = [UIColor colorWithHex:@"#38383d"];
    self.titleLabel.numberOfLines = 2;
    [self.backGroundView addSubview:self.titleLabel];
    
    [self.backGroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.top.equalTo(self.contentView.mas_top).offset(6);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-6);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backGroundView.mas_left).offset(10);
        make.top.equalTo(self.backGroundView.mas_top).offset(15);
    }];
    
    [self.authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.timeLabel.mas_right).offset(30);
        make.top.bottom.equalTo(self.timeLabel);
    }];
    
    [self.lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.timeLabel.mas_bottom).offset(15);
        make.left.equalTo(self.backGroundView.mas_left).offset(10);
        make.right.equalTo(self.backGroundView.mas_right).offset(-10);
        make.height.mas_offset(1);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backGroundView.mas_left).offset(10);
        make.right.equalTo(self.backGroundView.mas_right).offset(-10);
        make.top.equalTo(self.lineLabel.mas_bottom).offset(10);
        make.bottom.equalTo(self.backGroundView.mas_bottom).offset(-15);
    }];
}

@end
