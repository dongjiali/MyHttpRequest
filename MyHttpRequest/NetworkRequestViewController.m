//
//  NetworkRequestViewController.m
//  MyHttpRequest
//
//  Created by Dong JiaLi on 12-12-27.
//  Copyright (c) 2012年 Dong JiaLi. All rights reserved.
//

#import "NetworkRequestViewController.h"
#import "ASIHTTPRequest.h"
#import <QuartzCore/QuartzCore.h>
#define URLString @"http://allseeing-i.com"
@interface NetworkRequestViewController ()

@end

@implementation NetworkRequestViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        //获取全局变量
        appDelegate_ = [[UIApplication sharedApplication] delegate];
        xmlPerser_ = [[XmlPerser alloc]init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    UINavigationBar *navigationbar = [[UINavigationBar alloc]
                                      initWithFrame:CGRectMake(0, 0, 320, 44)];
    navigationbar.tintColor = [UIColor blackColor];
    [self.view addSubview:navigationbar];
    [navigationbar release];
    
    UINavigationItem *navigationitem = [[UINavigationItem alloc]initWithTitle:@"网络请求"];
    [navigationbar pushNavigationItem:navigationitem animated:YES];
    [navigationitem release];
    UIButton *backButton = [[UIButton alloc]initWithFrame: CGRectMake(0.0, 0.0, 44, 43)];
    [backButton setTitleColor:ColorWithRGBA(200, 200, 200,1) forState:0];
    [backButton setTitle:@"返回" forState:0];
    backButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [backButton addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc]
                                               initWithCustomView:backButton];
    temporaryBarButtonItem.style = UIBarButtonItemStylePlain;
    navigationitem.leftBarButtonItem=temporaryBarButtonItem;
    [temporaryBarButtonItem release];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1.frame = CGRectMake(10, 50, 80, 40);
    [button1 setTitle:@"同步请求" forState:0];
    [button1 setTitleColor:[UIColor grayColor] forState:0];
    [button1 addTarget:self action:@selector(tongbunetworkRequest:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.frame = CGRectMake(110, 50, 80, 40);
    [button2 setTitle:@"异步请求" forState:0];
    [button2 setTitleColor:[UIColor greenColor] forState:0];
    [button2 addTarget:self action:@selector(yibunetworkRequest:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button3.frame = CGRectMake(210, 50, 100, 40);
    [button3 setTitle:@"blocks块请求" forState:0];
    [button3 setTitleColor:[UIColor yellowColor] forState:0];
    [button3 addTarget:self action:@selector(blocksworkRequest:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button4.frame = CGRectMake(10, 100, 300, 30);
    [button4 setTitle:@"清除icooks" forState:0];
    [button4 setTitleColor:[UIColor blackColor] forState:0];
    [button4 addTarget:self action:@selector(clearIcooks:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
    
    textview_ = [[UITextView alloc]initWithFrame:CGRectMake(5, 140, 310, 260)];
    textview_.backgroundColor = [UIColor grayColor];
    [textview_ setDelegate:self];
    textview_.editable = NO;
    [self.view addSubview:textview_];
    [textview_ release];
}
//返回上一步 
- (void)backAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"netword%@",self);
    }];
}
//同步网络请求按钮响应事件
- (void)tongbunetworkRequest:(id)sender
{
        [self SynchronousNetworkRequest];
}

//同步调用网络
- (void)SynchronousNetworkRequest
{
    NSURL*url=[NSURL URLWithString:URLString];
    ASIHTTPRequest*request =[ASIHTTPRequest requestWithURL:url];
    //设置缓存方式
    [request setDownloadCache:appDelegate_.myCache];
    //设置缓存数据存储策略，这里采取的是如果无更新或无法联网就读取缓存数据
    [request setCacheStoragePolicy:ASICachePermanentlyCacheStoragePolicy];
    
    [request setDelegate:self];
    [request startSynchronous];
    NSError*error =[request error];
    if(!error){
        NSString *response =[request responseString];
        
        NSData *responseData = [request responseData];
        NSMutableString *responseString = [NSMutableString string];
        [xmlPerser_ XmlPerserdata:responseData ResultMark:@"html" ResultData:responseString];
        NSLog(@"(((%@)))",responseString);
        textview_.backgroundColor = [UIColor grayColor];
        textview_.text = response;
    }
}
//异步网络请求按钮响应事件
- (void)yibunetworkRequest:(id)sender
{
    [self AsynchronousNetworkRequest];
}

//调用异步请求
- (void)AsynchronousNetworkRequest
{
    NSURL*url=[NSURL URLWithString:URLString];
    ASIHTTPRequest*request =[ASIHTTPRequest requestWithURL:url];
    //设置缓存方式
    [request setDownloadCache:appDelegate_.myCache];
    //设置缓存数据存储策略，这里采取的是如果无更新或无法联网就读取缓存数据
    [request setCacheStoragePolicy:ASICachePermanentlyCacheStoragePolicy];
    [request startAsynchronous];
}
//异步请求回调完成
-(void)requestFinished:(ASIHTTPRequest*)request
{
    // 获得文本数据
    NSString*responseString =[request responseString];
    NSLog(@"(((%@)))",responseString);
    textview_.text = responseString;
    textview_.backgroundColor = [UIColor greenColor];
    // 获得二进制数据
    NSData*responseData =[request responseData];
    [responseData class];
}
//网络请求失败
-(void)requestFailed:(ASIHTTPRequest*)request
{
    NSError*error =[request error];
    if (error) {
        NSLog(@"error = %@",error);
    }
}

//blocks网络请求按钮响应事件
- (void)blocksworkRequest:(id)sender
{
    [self BlocksNetworkRequest];
}

//调用Blocks块网络请求
- (void)BlocksNetworkRequest
{
    NSURL*url=[NSURL URLWithString:URLString];
    ASIHTTPRequest*request =[ASIHTTPRequest requestWithURL:url];
    [request setDownloadCache:appDelegate_.myCache];
    //设置缓存数据存储策略，这里采取的是如果无更新或无法联网就读取缓存数据
    [request setCacheStoragePolicy:ASICachePermanentlyCacheStoragePolicy];
    [request setCompletionBlock:^{
        // Use when fetching text data
        NSString*responseString =[request responseString];
        NSLog(@"(((%@)))",responseString);
        textview_.text = responseString;
        textview_.backgroundColor = [UIColor yellowColor];
        // Use when fetching binary data
        NSData*responseData =[request responseData];
        [responseData class];
    }];
    [request setFailedBlock:^{
        NSError*error =[request error];
        if (error) {
            NSLog(@"error = %@",error);
        }
    }];
    [request startAsynchronous];
}

//清除缓存
- (void)clearIcooks:(UIButton *)sender
{
    appDelegate_ = [[UIApplication sharedApplication] delegate];
    [appDelegate_.myCache clearCachedResponsesForStoragePolicy:
     ASICachePermanentlyCacheStoragePolicy];
}

//开始编辑textview的回调
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    [textView resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAllButUpsideDown;
    //这里返回哪个值，就看你想支持那几个方向了。这里必须和后面plist文件里面的一致（我感觉是这样的）。
}

- (BOOL)shouldAutorotate {
    return YES;//支持转屏
}

- (void)dealloc
{
    [xmlPerser_ release];
    appDelegate_ = [[UIApplication sharedApplication] delegate];
    [appDelegate_.myCache clearCachedResponsesForStoragePolicy:
        ASICachePermanentlyCacheStoragePolicy];
    [super dealloc];
}

@end
