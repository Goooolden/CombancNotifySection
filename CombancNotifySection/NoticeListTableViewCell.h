//
//  NoticeListTableViewCell.h
//  OANoticeNews
//
//  Created by Golden on 2018/9/12.
//  Copyright © 2018年 Combanc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoticeModel.h"

@interface NoticeListTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *authorLabel;
@property (nonatomic, strong) UILabel *lineLabel;
@property (nonatomic, strong) UILabel *titleLabel;

@end
