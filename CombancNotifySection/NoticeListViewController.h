//
//  NoticeListViewController.h
//  OANoticeNews
//
//  Created by Golden on 2018/9/12.
//  Copyright © 2018年 Combanc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum NoticeType{
    AllNoticeType = 0,
    PublicNoticeType
}NoticeType;

@interface NoticeListViewController : UIViewController

@property (nonatomic, assign) NoticeType noticeType;
@property (nonatomic, copy  ) NSString *baseUrl;
@property (nonatomic, copy  ) NSString *token;

@end
