//
//  NoticeInterfaceRequest.h
//  CombancNewsSection
//
//  Created by Golden on 2018/11/12.
//

#import <Foundation/Foundation.h>

typedef void(^RequestSucess)(id json);
typedef void(^RequestFailed)(NSError *error);

@interface NoticeInterfaceRequest : NSObject

+ (void)requestNoticeList:(NSDictionary *)param success:(RequestSucess)success failed:(RequestFailed)failed;

@end
