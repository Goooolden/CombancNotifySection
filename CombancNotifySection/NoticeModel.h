//
//  NoticeModel.h
//  OANoticeNews
//
//  Created by Golden on 2018/9/26.
//  Copyright © 2018年 Combanc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NoticeModel : NSObject

@end

@interface NoticelistModel : NSObject

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *createTime;
@property (nonatomic, copy) NSString *publishTime;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, copy) NSString *stateStr;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *typeStr;
@property (nonatomic, copy) NSArray  *files;
@property (nonatomic, copy) NSArray  *imgs;

@end

@interface NoticeFileImgsModel : NSObject

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *tabledId;
@property (nonatomic, copy) NSString *tableName;
@property (nonatomic, copy) NSString *fileId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *path;

@end
