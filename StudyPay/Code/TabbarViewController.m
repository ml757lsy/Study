//
//  TabbarViewController.m
//  StudyPay
//
//  Created by TopSageOSX on 14-8-4.
//  Copyright (c) 2014年 com.topsage. All rights reserved.
//

#import "TabbarViewController.h"
#import "RootViewController.h"
@interface TabbarViewController ()

@end

@implementation TabbarViewController

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
    [self creatMainView];
}
//创建主界面(一般)
-(void)creatMainView{
    FreeViewController *freeView = [[FreeViewController alloc]init];
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:freeView];
    freeView.view.backgroundColor = [UIColor cyanColor];
    [nav1.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"图标11"] withFinishedUnselectedImage:[UIImage imageNamed:@"图标1"]];
    
    InterviewViewController *interView = [[InterviewViewController alloc]init];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:interView];
    [nav2.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"图标12"] withFinishedUnselectedImage:[UIImage imageNamed:@"图标2"]];
    
    CourseViewController *courseView = [[CourseViewController alloc]init];
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:courseView];
    [nav3.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"图标13"] withFinishedUnselectedImage:[UIImage imageNamed:@"图标3"]];
    
    SettingViewController *settingView = [[SettingViewController alloc]init];
    UINavigationController *nav4 = [[UINavigationController alloc]initWithRootViewController:settingView];
    [nav4.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"图标14"] withFinishedUnselectedImage:[UIImage imageNamed:@"图标4"]];
    
    self.viewControllers = @[nav1,nav2,nav3,nav4];
    self.tabBar.backgroundColor = [UIColor whiteColor];
    
}
//创建主界面（plist法）
-(void)creatMainViewWithPlist{
    //获取plist路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Controllers" ofType:@"plist"];
    //将plist中的信息读到数组中
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *controllers = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        NSString *title = [dic objectForKey:@"title"];
        NSString *imageName = [dic objectForKey:@"iconName"];
        NSString *selectImageName = [imageName stringByAppendingString:@"_press"];
        NSString *className = [dic objectForKey:@"className"];
        //根据类名，得到类
        Class class = NSClassFromString(className);
        RootViewController *root = [[class alloc] init];
        root.title = title;
        //设置tabbarItem处于选中状态和非选中状态下的图片
        [root.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:selectImageName] withFinishedUnselectedImage:[UIImage imageNamed:imageName]];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:root];
        [controllers addObject:nav];
    }
    self.viewControllers = controllers;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
