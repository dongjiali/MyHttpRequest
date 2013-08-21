//
//  QueueNetworkRequestViewController.m
//  MyHttpRequest
//
//  Created by Dong JiaLi on 13-1-4.
//  Copyright (c) 2013年 Dong JiaLi. All rights reserved.
//

#import "QueueNetworkRequestViewController.h"
#import "ASIHTTPRequest.h"
@interface QueueNetworkRequestViewController ()

@end

@implementation QueueNetworkRequestViewController
@synthesize queue = queue_;
@synthesize networkqueue = networkqueue_;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UINavigationBar *navigationbar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    navigationbar.tintColor = [UIColor blueColor];
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
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    temporaryBarButtonItem.style = UIBarButtonItemStylePlain;
    navigationitem.leftBarButtonItem=temporaryBarButtonItem;
    [temporaryBarButtonItem release];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1.frame = CGRectMake(10, 50, 80, 40);
    [button1 setTitle:@"队列请求1" forState:0];
    [button1 setTitleColor:[UIColor grayColor] forState:0];
    [button1 addTarget:self action:@selector(queueetworkRequest:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];

    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.frame = CGRectMake(100, 50, 80, 40);
    [button2 setTitle:@"队列请求2" forState:0];
    [button2 setTitleColor:[UIColor blueColor] forState:0];
    [button2 addTarget:self action:@selector(queuee2tworkRequest:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    textview_ = [[UITextView alloc]initWithFrame:CGRectMake(5, 100, 310, 250)];
    textview_.backgroundColor = [UIColor grayColor];
    [textview_ setDelegate:self];
    textview_.editable = NO;
    [self.view addSubview:textview_];
    [textview_ release];
    
    progressIndicator_ = [[UIProgressView alloc]initWithFrame:CGRectMake(5, 350, 310, 10)];
    [self.view addSubview:progressIndicator_];
    [progressIndicator_ setProgressTintColor:[UIColor redColor]];
    [progressIndicator_ release];
    
    {
    imageView1_ = [[UIImageView alloc]initWithFrame:CGRectMake(5, 370, 100, 100)];
    [imageView1_ setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:imageView1_];
    [imageView1_ release];
    
    progressData_1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 40, 80, 20)];
    progressData_1.textColor = ColorWithRGBA(60, 200, 200, 1);
    progressData_1.backgroundColor = ColorClear;
    progressData_1.font = [UIFont systemFontOfSize:10];
    [imageView1_ addSubview:progressData_1];
    [progressData_1 release];
    
    progressIndicator1_ = [[UIProgressView alloc]initWithFrame:CGRectMake(5, 360, 100, 10)];
    [self.view addSubview:progressIndicator1_];
    [progressIndicator1_ setProgressTintColor:ColorWithRGBA(60, 200, 200, 1)];
    [progressIndicator1_ release];
    }

    {
    imageView2_ = [[UIImageView alloc]initWithFrame:CGRectMake(110, 370, 100, 100)];
    [imageView2_ setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:imageView2_];
    [imageView2_ release];
        
    progressData_2 = [[UILabel alloc]initWithFrame:CGRectMake(10, 40, 80, 20)];
    progressData_2.textColor = ColorWithRGBA(163, 87, 211, 1);
    [imageView2_ addSubview:progressData_2];
    progressData_2.backgroundColor = ColorClear;
    progressData_2.font = [UIFont systemFontOfSize:10.0];
    [progressData_2 release];
        
    progressIndicator2_ = [[UIProgressView alloc]initWithFrame:CGRectMake(110, 360, 100, 10)];
    [self.view addSubview:progressIndicator2_];
    [progressIndicator2_ setProgressTintColor:ColorWithRGBA(163, 87, 211, 1)];
    [progressIndicator2_ release];
    }
    
    {
    imageView3_ = [[UIImageView alloc]initWithFrame:CGRectMake(215, 370, 100, 100)];
    [imageView3_ setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:imageView3_];
    [imageView3_ release];
        
    progressData_3 = [[UILabel alloc]initWithFrame:CGRectMake(10, 40, 80, 20)];
    progressData_3.textColor = ColorWithRGBA(89, 151, 0, 1);
    [imageView3_ addSubview:progressData_3];
    progressData_3.backgroundColor = ColorClear;
    progressData_3.font = [UIFont systemFontOfSize:10.0];
    [progressData_3 release];
        
    progressIndicator3_ = [[UIProgressView alloc]initWithFrame:CGRectMake(215, 360, 100, 10)];
    [self.view addSubview:progressIndicator3_];
    [progressIndicator3_ setProgressTintColor:ColorWithRGBA(89, 151, 0, 1)];
    [progressIndicator3_ release];
    } 
}
//队列请求按钮1响应事件
- (void)queueetworkRequest:(id)sender
{
    [self OperationQueueNetWordRequest];
}
//NSOperationQueue队列请求网络
- (void)OperationQueueNetWordRequest
{
    if(![self queue]){
        [self setQueue:[[[NSOperationQueue alloc] init] autorelease]];
    }
    NSURL*url=[NSURL URLWithString:@"http://allseeing-i.com"];
    ASIHTTPRequest*request =[ASIHTTPRequest requestWithURL:url];
    request.tag = 1;
    [request setDelegate:self];
    [request setDidFinishSelector:@selector(requestDone:)];
    [request setDidFailSelector:@selector(requestWentWrong:)];
    [[self queue] addOperation:request];
    
    url=[NSURL URLWithString:@"http://www.baidu.com"];
    request =[ASIHTTPRequest requestWithURL:url];
    request.tag = 2;
    [request setDelegate:self];
    [request setDidFinishSelector:@selector(requestDone:)];
    [request setDidFailSelector:@selector(requestWentWrong:)];
    [[self queue] addOperation:request];
    
    url=[NSURL URLWithString:@"http://wow.163.com"];
    request =[ASIHTTPRequest requestWithURL:url];
    request.tag = 3;
    [request setDelegate:self];
    [request setDidFinishSelector:@selector(requestDone:)];
    [request setDidFailSelector:@selector(requestWentWrong:)];
    [[self queue] addOperation:request];
}

//网络请求1回调完成
- (void)requestDone:(ASIHTTPRequest*)request {
    switch (request.tag) {
        case 1:
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
            break;
       case 2:
        {
            // 获得文本数据
            NSString*responseString =[request responseString];
            NSLog(@"(((%@)))",responseString);
            textview_.text = responseString;
            textview_.backgroundColor = [UIColor redColor];
            // 获得二进制数据
            NSData*responseData =[request responseData];
            [responseData class];
        }
            break;
        case 3:
        {
            // 获得文本数据
            NSString*responseString =[request responseString];
            NSLog(@"(((%@)))",responseString);
            textview_.text = responseString;
            textview_.backgroundColor = [UIColor yellowColor];
            // 获得二进制数据
            NSData*responseData =[request responseData];
            [responseData class];
        }
            break;
        default:
            break;
    }
}

- (void)requestWentWrong:(ASIHTTPRequest*)request {
    NSError*error =[request error];
    if (error) {
        NSLog(@"error = %@",error);
    }
}

//队列请求按钮1响应事件
- (void)queuee2tworkRequest:(id)sender
{
    [self OperationQueue2NetWordRequest];
}

- (void)OperationQueue2NetWordRequest
{
    [imageView1_ setImage:nil];
    [imageView2_ setImage:nil];
    [imageView3_ setImage:nil];
    if (![self networkqueue]) {
        [self setNetworkqueue:[[ASINetworkQueue alloc] init]];
	}
	[networkqueue_ reset];
	[networkqueue_ setDownloadProgressDelegate:progressIndicator_];
    networkqueue_.showAccurateProgress = YES;
	[networkqueue_ setRequestDidFinishSelector:@selector(imageFetchComplete:)];
	[networkqueue_ setRequestDidFailSelector:@selector(imageFetchFailed:)];
//	[networkqueue_ setShowAccurateProgress:[accurateProgress isOn]];
	[networkqueue_ setDelegate:self];
    ASIHTTPRequest *request;
	request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:@"http://allseeing-i.com/ASIHTTPRequest/tests/images/small-image.jpg"]];
	[request setDownloadDestinationPath:[[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"a.png"]];
    [request setDownloadProgressDelegate:progressIndicator1_];
    [request setDelegate:self];
    [request setUserInfo:[NSDictionary dictionaryWithObject:@"request1" forKey:@"name"]];
	[networkqueue_ addOperation:request];
	
	request = [[[ASIHTTPRequest alloc] initWithURL:[NSURL URLWithString:@"http://allseeing-i.com/ASIHTTPRequest/tests/images/medium-image.jpg"]] autorelease];
	[request setDownloadDestinationPath:[[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"b.png"]];
    [request setDownloadProgressDelegate:progressIndicator2_];
    [request setUserInfo:[NSDictionary dictionaryWithObject:@"request2" forKey:@"name"]];
	[networkqueue_ addOperation:request];
	
	request = [[[ASIHTTPRequest alloc] initWithURL:[NSURL URLWithString:@"http://allseeing-i.com/ASIHTTPRequest/tests/images/large-image.jpg"]] autorelease];
	[request setDownloadDestinationPath:[[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"c.png"]];
    [request setDownloadProgressDelegate:progressIndicator3_];
    [request setUserInfo:[NSDictionary dictionaryWithObject:@"request3" forKey:@"name"]];
	[networkqueue_ addOperation:request];
	
	[networkqueue_ go];
    
}

- (void)imageFetchComplete:(ASIHTTPRequest *)request
{
	UIImage *img = [UIImage imageWithContentsOfFile:[request downloadDestinationPath]];
	if (img) {
		if ([imageView1_ image]) {
			if ([imageView2_ image]) {
				[imageView3_ setImage:img];
                progressData_3.hidden = YES;
			} else {
				[imageView2_ setImage:img];
                progressData_2.hidden = YES;
			}
		} else {
			[imageView1_ setImage:img];
            progressData_1.hidden = YES;
		}
	}
}

- (void)imageFetchFailed:(ASIHTTPRequest *)request
{
		if ([[request error] domain] != NetworkRequestErrorDomain || [[request error] code] != ASIRequestCancelledErrorType) {
			UIAlertView *alertView = [[[UIAlertView alloc] initWithTitle:@"Download failed" message:@"Failed to download images" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease];
			[alertView show];
		}
}

//返回上一步
- (void)backAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"netword%@",self);
    }];
}

-(void)textViewDidBeginEditing:(UITextView *)textView
{
    [textview_ resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [queue_ release];
    [networkqueue_ release];
    [super dealloc];
}

@end
