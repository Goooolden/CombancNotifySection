//
//  NoticeInterfaceRequest.m
//  CombancNewsSection
//
//  Created by Golden on 2018/11/12.
//

#import "NoticeInterfaceRequest.h"
#import "HTTPTool.h"
#import "NoticeInterfaceMacro.h"
#import "NoticeModel.h"
#import "MJExtension.h"

@implementation NoticeInterfaceRequest

+ (void)requestNoticeList:(NSDictionary *)param success:(RequestSucess)success failed:(RequestFailed)failed {
    [HTTPTool postWithURL:GetNoticelist_URL headers:header(MyToken) params:param success:^(id json) {
        if([[NoticeInterfaceRequest new] isRequestSuccess:json]) {
            NSArray *dataArray = [NoticelistModel mj_objectArrayWithKeyValuesArray:json[@"data"][@"list"]];
            success(dataArray);
        }
    } failure:^(NSError *error) {
        failed(error);
    }];
}
+ (void)requestPublicNoticeList:(NSDictionary *)param success:(RequestSucess)success failed:(RequestFailed)failed {
    [HTTPTool postWithURL:GetMessageList headers:header(MyToken) params:param success:^(id json) {
        if([[NoticeInterfaceRequest new] isRequestSuccess:json]) {
            NSArray *dataArray = [NoticelistModel mj_objectArrayWithKeyValuesArray:json[@"data"][@"list"]];
            success(dataArray);
        }
    } failure:^(NSError *error) {
        failed(error);
    }];
}

//请求参数成功检测
- (BOOL)isRequestSuccess:(id)json {
    switch ([json[@"result"] intValue]) {
        case 1:{
            //操作成功
            return YES;
            break;
        }
        case 0:{
            //没有查询到数据
            return NO;
            break;
        }
        case -1:{
            //操作过程中出现异常
            return NO;
            break;
        }
        case -2:{
            //数据重复，一般在新增接口中
            return NO;
            break;
        }
        case -100:{
            //用户会话过期，需重新登陆
            return NO;
            break;
        }
        default:{
            return NO;
            break;
        }
    }
    return NO;
}

@end
