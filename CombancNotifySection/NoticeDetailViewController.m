//
//  NoticeDetailViewController.m
//  OANoticeNews
//
//  Created by Golden on 2018/9/26.
//  Copyright © 2018年 Combanc. All rights reserved.
//

#import "NoticeDetailViewController.h"
#import "Masonry.h"
#import "NoticeInterfaceMacro.h"

@interface NoticeDetailViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIWebView *webView;

@end

@implementation NoticeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self configUI];
    [self reloadData];
    self.title = @"详情";
}

- (void)configUI {
    self.webView = [[UIWebView alloc]init];
    self.webView.delegate = self;
    self.webView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self.webView loadHTMLString:[self.model.content stringByReplacingOccurrencesOfString:@"\n" withString:@""] baseURL:nil];
}

- (void)reloadData {
    NSString *htmlString = [self.model.content stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    NSArray *headHtml = [htmlString componentsSeparatedByString:@"<body>"];
    NSArray *bodyHtml = [[headHtml lastObject] componentsSeparatedByString:@"</body>"];
    
    NSMutableString *html = [NSMutableString string];
    [html appendString:@"<html>"];
    [html appendString:@"<head>"];
    [html appendFormat:@"<link rel=\"stylesheet\" href=\"%@\">",[[NSBundle mainBundle] URLForResource:@"CombancNewsDetail.css" withExtension:nil]];
    [html appendString:@"</head>"];
    [html appendString:@"<body>"];
    [html appendString:[self combineDetailWithBody:[bodyHtml firstObject]]];
    [html appendString:@"</body>"];
    [html appendString:@"</html>"];
    [self.webView loadHTMLString:html baseURL:nil];
}

- (NSString *)combineDetailWithBody:(NSString *)bodyHtml {
    NSMutableString *body = [NSMutableString string];
    //添加标题和作者
    [body appendFormat:@"<div class=\"title\">%@</div>",self.model.title];
    NSString *time = [NSString stringWithFormat:@"发布时间：%@",self.model.publishTime];
    NSString *author = [NSString stringWithFormat:@"发布人：%@",self.model.userName];
    [body appendFormat:@"<div class=\"time\"> %@ &nbsp %@</div>",author,time];
    //添加主题内容
    [body appendFormat:@"<div class=\"contentText\">%@</div>", bodyHtml];
    //添加图片
    NSString *onload = @"this.onclick = function() {"
    "  window.location.href = 'combanc:src=' +this.src;"
    "};";
    for (NoticeFileImgsModel *model in self.model.imgs) {
        NSString *imagePath = [NSString stringWithFormat:@"%@%@", NewsImageURL, model.path];
        NSString *imageStr = [NSString stringWithFormat:@"<img src=\"%@\" onload=\"%@\" style= height=\"250px\"; width=\"100%%\"", imagePath,onload];
        [body appendFormat:@"<div class=\"imageList\"><br>%@</div>",imageStr];
    }
    //添加附件
    for (NoticeFileImgsModel *model in self.model.files) {
        NSString *filePath = [NSString stringWithFormat:@"%@%@", BASE_URL, model.path];
        [body appendFormat:@"<a href= %@> %@ </a> <br />",filePath,model.name];
    }
    return body;
}

@end
