//
//  NoticeInterfaceMacro.h
//  Pods
//
//  Created by Golden on 2018/11/12.
//
#import <UIKit/UIKit.h>
#ifndef NoticeInterfaceMacro_h
#define NoticeInterfaceMacro_h

#define isNilOrNull(obj) (obj == nil || [obj isEqual:[NSNull null]])

#define setObjectForKey(object) \
do { \
[dictionary setObject:object forKey:@#object]; \
} while (0)

#define setObjectForParameter(object) \
do { \
NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:nil]; \
NSString *str = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]; \
[paramDic setObject:str forKey:@"param"]; \
} while (0)

#define NoticeToken (@"token")
#define BASE_URL (@"https://campus.shuxiaoyun.cn/micro/oa")
#define NewsImageURL (@"https://campus.shuxiaoyun.cn/micro/file/upload")
#define MyToken [[NSUserDefaults standardUserDefaults] objectForKey:NoticeToken]

//请求header
NS_INLINE NSDictionary *header(NSString *token) {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    setObjectForKey(token);
    return dictionary;
}

// 获取消息列表
#define GetMessageList [NSString stringWithFormat:@"%@/msg/receive",BASE_URL]
// {"type":"2","page":"1","pageSize":"10","sdate":"","edate":"","searchStr":""}
NS_INLINE NSDictionary *GetMessageListParameter(NSString *type, NSString *page, NSString *pageSize, NSString *sdate, NSString *edate, NSString *searchStr) {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    setObjectForKey(type);
    setObjectForKey(page);
    setObjectForKey(pageSize);
    setObjectForKey(sdate);
    setObjectForKey(edate);
    setObjectForKey(searchStr);
    return dictionary.copy;
}

//获取公告列表
#define GetNoticelist_URL ([NSString stringWithFormat:@"%@/notice/list",BASE_URL])
/**
 获取公告列表的参数
 @param page 当前页
 @param pageSize 每页条数
 @param sdate 开始时间
 @param edate 结束时间
 @param states [1,2]
 @param searchStr 搜索内容
 */
NS_INLINE NSDictionary *noticelistParam(NSString *page,NSString *pageSize,NSString *sdate,NSString *edate,NSArray *states,NSString *searchStr) {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionary];
    setObjectForKey(page);
    setObjectForKey(pageSize);
    setObjectForKey(sdate);
    setObjectForKey(edate);
    setObjectForKey(states);
    setObjectForKey(searchStr);
    setObjectForParameter(dictionary.copy);
    return paramDic.copy;
}

//获取公告详情（返回参数与公告列表一样，不需要再次请求）
#define GetNoticeinfo_URL ([NSString stringWithFormat:@"%@/notice/info",BASE_URL])
/**
 获取公告详情参数
 @param id 公告ID
 */
NS_INLINE NSDictionary *noticeInfoParam(NSString *id) {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionary];
    setObjectForKey(id);
    setObjectForParameter(dictionary.copy);
    return paramDic.copy;
}

#endif /* NoticeInterfaceMacro_h */
