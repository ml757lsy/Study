//
//  InterviewViewController.m
//  StudyPay
//
//  Created by TopSageOSX on 14-8-5.
//  Copyright (c) 2014年 com.topsage. All rights reserved.
//

#import "InterviewViewController.h"

@interface InterviewViewController ()

@end

@implementation InterviewViewController

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
    [self getAllInterView];
}

-(void)getAllInterView{
    
    /*
     /Interview/videoList/key/0b6f2f666ddfd0e56e4d566f12a0f353/time/
     1407239728
     1407239907
     9a4bdc3fed924d1bbaa9f2e54119b698
     9a4bdc3fed924d1bbaa9f2e54119b698

     */
    NSString *timeString = [NSString stringWithFormat:@"%@", [getTime getTime]];
    NSString *string1 = [NSString stringWithFormat:@"/Interview/videoDetail/key/0b6f2f666ddfd0e56e4d566f12a0f353/time/%@", timeString];
    NSString *MD5string = [md5 md5:string1];
    NSString *url = [NSString stringWithFormat:@"http://www.studypay.com/MAPI/index.php/Interview/videoDetail/hash/%@/appid/1", MD5string];
    NSLog(@"%@",timeString);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:timeString,@"time", nil];
    [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",[[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding]);
        //
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //
        NSLog(@"error!!!");
    }];
    
    AFHTTPRequestOperationManager *m = [AFHTTPRequestOperationManager manager];
    [m POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON%@",responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error%@",error.localizedDescription);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
