//
//  ViewController.m
//  HTMLDemo
//
//  Created by Chaosky on 16/6/29.
//  Copyright © 2016年 1000phone. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView * webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.webView];
    
//    NSURL * indexURL = [[NSBundle mainBundle] URLForResource:@"index" withExtension:@"html"];
//    
//    [self.webView loadRequest:[NSURLRequest requestWithURL:indexURL]];
//    self.webView loadHTMLString:<#(nonnull NSString *)#> baseURL:<#(nullable NSURL *)#>
//    self.webView loadData:<#(nonnull NSData *)#> MIMEType:<#(nonnull NSString *)#> textEncodingName:<#(nonnull NSString *)#> baseURL:<#(nonnull NSURL *)#>
    
//    NSString * mp3Path = [[NSBundle mainBundle] pathForResource:@"月半小夜曲" ofType:@"mp3"];
//    NSData * mp3Data = [NSData dataWithContentsOfFile:mp3Path];
//    [self.webView loadData:mp3Data MIMEType:@"audio/mpeg3" textEncodingName:@"UTF-8" baseURL:[NSBundle mainBundle].bundleURL];
    _webView.delegate = self;
    
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    // 执行JavaScript代码
    
    // 获取标题
    NSString * title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    self.title = title;
    
    // 设置搜索框的内容
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('index-kw').value = '土耳其 袭击';"];
    // 按钮点击
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('index-bn').click();"];
    
    // 隐藏广告
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('foot-blank').previousElementSibling.hidden = true;"];
    });
    
}

@end
