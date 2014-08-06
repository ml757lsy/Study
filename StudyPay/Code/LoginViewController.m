//
//  LoginViewController.m
//  StudyPay
//
//  Created by TopSageOSX on 14-8-4.
//  Copyright (c) 2014年 com.topsage. All rights reserved.
//

#import "LoginViewController.h"
#import "getDreviceStates.h"
#import "getNetWorkStates.h"
#import "UIView+Shake.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

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
    //获取网络状态
    NSLog(@"%@",[getNetWorkStates getNetWorkStates]);
    //获取设备型号
    NSLog(@"%@",[getDreviceStates getDrevicesState]);
    //设置状态栏的样式
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    //加载视图
    [self creatLoginView];
}

//创建视图
- (void)creatLoginView{
    _loginView = [[LoginView alloc]initWithFrame:self.view.bounds];
    _loginView.loginViewDelegate = self;
    //自动填充用户名密码
    if ([[NSUserDefaults standardUserDefaults]valueForKey:@"remember_userName"]) {
        //存在就自动填充
        _loginView.userNameTextFiled.text = [[NSUserDefaults standardUserDefaults]valueForKey:@"remember_userName"];
        _loginView.passWordTextFiled.text = [[NSUserDefaults standardUserDefaults]valueForKey:@"remember_passWord"];
    }
    [self.view addSubview:_loginView];
}
//代理方法
-(void)loginView:(UIView *)view withButtonTag:(NSInteger)tag{
    switch (tag) {
        case 200:
        {
            //登录钮
            [self login];
        }
            break;
        case 201:
        {
            //不登陆钮
        }
            break;
        case 202:
        {
            //注册钮
        }
            break;
        case 203:
        {
            //忘记钮
        }
            break;
            
        default:
            break;
    }
}
//登录方法
- (void)login{
    //获取用户名密码
    NSString *userName = _loginView.userNameTextFiled.text;
    NSString *passWord = _loginView.passWordTextFiled.text;
    //自动保存密码
    if (1) {
        //后续加判断
        [[NSUserDefaults standardUserDefaults]setValue:userName forKey:@"remember_userName"];
        [[NSUserDefaults standardUserDefaults]setValue:passWord forKey:@"remember_passWord"];
        [[NSUserDefaults standardUserDefaults]synchronize];
    }
    switch ([loginMethod checkUserName:userName andPassWord:passWord]) {
        case 0:
        {
            //正确
            TabbarViewController *tabbar = [[TabbarViewController alloc]init];

            [self presentViewController:tabbar animated:YES completion:nil];
        }
            break;
        case 1:
        {
            //
            _loginView.msgLabel.text = @"请输入用户名";
            [self shakeWithView:_loginView.userNameTextFiled];
        }
            break;
        case 2:
        {
            //
            _loginView.msgLabel.text = @"用户名为6-32位字符";
            [self shakeWithView:_loginView.userNameTextFiled];
        }
            break;
        case 3:
        {
            //
            _loginView.msgLabel.text = @"请输入密码";
            [self shakeWithView:_loginView.passWordTextFiled];
        }
            break;
        case 4:
        {
            //
            _loginView.msgLabel.text = @"密码为6-32位字符";
            [self shakeWithView:_loginView.passWordTextFiled];
        }
            break;
            
        default:
            break;
    }
    
}

//控件抖动特效
-(void)shake{
    [self.view shake:5 withDelta:4 andSpeed:0.04 shakeDirection:ShakeDirectionHorizontal];
}
//
-(void)shakeWithView:(UIView *)view{
    [view shake:5 withDelta:4 andSpeed:0.04 shakeDirection:ShakeDirectionHorizontal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
