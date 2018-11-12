//
//  NoticeModel.m
//  OANoticeNews
//
//  Created by Golden on 2018/9/26.
//  Copyright © 2018年 Combanc. All rights reserved.
//

#import "NoticeModel.h"
#import "MJExtension.h"

@implementation NoticeModel

@end

@implementation NoticelistModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"files":@"NoticeFileImgsModel",
             @"imgs":@"NoticeFileImgsModel"
             };
}

@end

@implementation NoticeFileImgsModel

@end
