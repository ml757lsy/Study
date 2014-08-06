//
//  FreeViewController.m
//  StudyPay
//
//  Created by TopSageOSX on 14-8-5.
//  Copyright (c) 2014年 com.topsage. All rights reserved.
//

#import "FreeViewController.h"

@interface FreeViewController ()

@end

@implementation FreeViewController{
    UITableView *tableView;
    NSMutableArray *dataArray;
}

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
    // Do any additional setup after loading the view.
    [self refresh];
}

-(void)refresh{
    
    NSString *timeString = [NSString stringWithFormat:@"%@", [self getTime]];
    NSString *string1 = [NSString stringWithFormat:@"/OpenCourse/videoList/key/0b6f2f666ddfd0e56e4d566f12a0f353/time/%@", timeString];
    NSString *MD5string = [md5 md5:string1];
    NSString *url1 = [NSString stringWithFormat:@"http://www.studypay.com/MAPI/index.php/OpenCourse/videoList/hash/%@/appid/1", MD5string];
}
/**
 *  获取时间
 *  @return NSString精确到秒
 */
-(NSString *)getTime{
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
    long long int date = (long long int)time;
    NSString *timeString = [NSString stringWithFormat:@"%lld", date];
    return timeString;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}



@end
