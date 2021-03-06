//
//  IndexViewController.m
//  HTMLDemo
//
//  Created by Chaosky on 16/6/29.
//  Copyright © 2016年 1000phone. All rights reserved.
//

#import "IndexViewController.h"

@interface IndexViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation IndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"千锋官方网站";
    // Do any additional setup after loading the view.
    NSURL * indexURL = [[NSBundle mainBundle] URLForResource:@"index" withExtension:@"html"];
    [self.webView loadRequest:[NSURLRequest requestWithURL:indexURL]];
    self.webView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"request url = %@", request.URL);
    NSString * requestURL = request.URL.absoluteString;
    // 判断是否为自定义协议
    if ([requestURL containsString:@"htmldemo"]) {
        if ([requestURL containsString:@"teacher"]) {
            // 处理讲师
            NSArray * splitArray = [requestURL componentsSeparatedByString:@"/"];
            NSString * name = splitArray.lastObject;
            NSLog(@"name = %@", name);
            // 执行指定id的跳转
            [self performSegueWithIdentifier:@"ShowDetail" sender:name];
        }
    }
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController * distinationVC = segue.destinationViewController;
    distinationVC.title = sender;
}

@end
