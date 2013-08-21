//
//  RequestViewController.m
//  MyHttpRequest
//
//  Created by Dong JiaLi on 12-12-26.
//  Copyright (c) 2012年 Dong JiaLi. All rights reserved.
//

#import "RequestViewController.h"
#import "MacrosClass.h"
#import "MyTableViewCell.h"
#import "NetworkRequestViewController.h"
#import "QueueNetworkRequestViewController.h"
@interface RequestViewController ()

@end

@implementation RequestViewController
@synthesize titleNameArray = titleNameArray_;
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
    NSArray *titleArray =[NSArray arrayWithObjects:@"网络请求",@"队列请求",
                          @"下载进度",@"上传进度", nil];
    self.titleNameArray = titleArray;
    UITableView *tableview = [[UITableView alloc]initWithFrame:
                              CGRectMake(0, 0, DeviceScreenWidth, DeviceScreenHeight)
                                                         style:UITableViewStyleGrouped];
    [tableview setDelegate:self];
    [tableview setDataSource:self];
    [self.view addSubview:tableview];
    [tableview release];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellreuseIdentifier = @"Cell";
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellreuseIdentifier];
    if (cell != nil) {
        [cell release];
    }
    cell = [[MyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellreuseIdentifier];
    cell.labelText = [titleNameArray_ objectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return titleNameArray_.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            NetworkRequestViewController *networkrequest = [[NetworkRequestViewController alloc]init];
            networkrequest.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
            [self presentViewController:networkrequest animated:YES completion:^{
                NSLog(@"RequstView = %@",self);
            }];
            [networkrequest release];
        }
            break;
        case 1:
        {
            QueueNetworkRequestViewController *queuenetworkrequest = [[QueueNetworkRequestViewController alloc]init];
            queuenetworkrequest.modalPresentationStyle = UIModalTransitionStyleCrossDissolve;
            [self presentViewController:queuenetworkrequest animated:YES completion:^{
                NSLog(@"queuenetworkrequest = %@",self);
            }];
        }
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [titleNameArray_ release];
    [super dealloc];
}

@end
