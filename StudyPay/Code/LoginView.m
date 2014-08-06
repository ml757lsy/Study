//
//  LoginView.m
//  StudyPay
//
//  Created by TopSageOSX on 14-8-5.
//  Copyright (c) 2014年 com.topsage. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView{
    //用户名图标
    UIImageView *userIcon;
    //密码图标
    UIImageView *pswIcon;
    
    //登录钮
    UIButton *loginBtn;
    //暂不登录钮
    UIButton *visitBtn;
    //注册钮
    UIButton *registerBtn;
    //忘记密码钮
    UIButton *forgetBtn;
    
    //底部白线
    UILabel *userLine;
    UILabel *pswLine;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 创建视图
        [self creatLoginView];
        [self creatGesture];
    }
    return self;
}
//创建视图
- (void)creatLoginView{
    //设置背景图片
    UIImageView *backGroundImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [backGroundImageView setImage:[UIImage imageNamed:@"loding"]];
    [self addSubview:backGroundImageView];
    
    //放置登录框等的基本信息
    CGRect frame,user_icon_frame,pass_icon_frame;
    CGRect user_txt_frame,pass_txt_frame;
    CGRect user_line_frame,pass_line_frame;
    CGRect msglable_frame;
    CGRect login_frame,visit_frame;
    CGRect register_frame,forgot_frame;
    if (isPad) {
        //iPad端的适应
        //基本框架
        frame = CGRectMake(80,180,160,160);
    }else{
        //iPhone端的适应
        if (SCREEN_HEIGHT/SCREEN_WIDTH) {
            //根据高宽比来确定版面
        }
        if (IOS7_OR_LATER) {
            //系统版本是7和之后的
            frame = CGRectMake(80, 80, 160, 160);
            user_icon_frame=CGRectMake(80, 160, 25, 25);
            pass_icon_frame=CGRectMake(82, 190, 20, 25);
            
            user_txt_frame=CGRectMake(110, 160, 130, 25);
            pass_txt_frame=CGRectMake(110, 190, 130, 25);
            
            user_line_frame = CGRectMake(80, 185, 160, 1);
            pass_line_frame = CGRectMake(80, 215, 160, 1);
            
            msglable_frame = CGRectMake(100, 220, 120, 15);
            
            login_frame=CGRectMake(80,  250, 160, 40);
            visit_frame=CGRectMake(80, 300, 160, 40);
            
            register_frame=CGRectMake(40, 350, 80, 30);
            forgot_frame=CGRectMake(200, 350, 80, 30);
        }else{
            //系统版本是7之前
            frame = CGRectMake(80, 80, 160, 160);
            
            user_icon_frame=CGRectMake(80, 160, 25, 25);
            pass_icon_frame=CGRectMake(82, 190, 20, 25);
            
            user_txt_frame=CGRectMake(110, 160, 130, 25);
            pass_txt_frame=CGRectMake(110, 190, 130, 25);
            
            user_line_frame = CGRectMake(80, 185, 160, 1);
            pass_line_frame = CGRectMake(80, 215, 160, 1);
            
            msglable_frame = CGRectMake(100, 220, 120, 15);
            
            login_frame=CGRectMake(80,  250, 160, 40);
            visit_frame=CGRectMake(80, 300, 160, 40);
            
            register_frame=CGRectMake(40, 350, 80, 30);
            forgot_frame=CGRectMake(200, 350, 80, 30);
        }
    }
    //根据框架摆放控件
    userIcon = [[UIImageView alloc]initWithFrame:user_icon_frame];
    pswIcon = [[UIImageView alloc]initWithFrame:pass_icon_frame];
    
    _userNameTextFiled = [[UITextField alloc]initWithFrame:user_txt_frame];
    _passWordTextFiled = [[UITextField alloc]initWithFrame:pass_txt_frame];
    
    userLine = [[UILabel alloc]initWithFrame:user_line_frame];
    pswLine = [[UILabel alloc]initWithFrame:pass_line_frame];
    
    _msgLabel = [[UILabel alloc]initWithFrame:msglable_frame];
    
    loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginBtn setFrame:login_frame];
    visitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [visitBtn setFrame:visit_frame];
    
    registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [registerBtn setFrame:register_frame];
    forgetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [forgetBtn setFrame:forgot_frame];
    //设置tag值 图1-- 钮2-- 字3--
    userIcon.tag = 100;
    pswIcon.tag = 101;
    loginBtn.tag = 200;
    visitBtn.tag = 201;
    registerBtn.tag = 202;
    forgetBtn.tag = 203;
    _userNameTextFiled.tag = 300;
    _passWordTextFiled.tag = 301;
    userLine.tag = 302;
    userLine.tag = 303;
    _msgLabel.tag = 304;
    //设置基本属性
    userIcon.image = [UIImage imageNamed:@"username"];
    pswIcon.image = [UIImage imageNamed:@"parssword"];
    
    _userNameTextFiled.textColor = [UIColor whiteColor];
    _userNameTextFiled.placeholder = @"TopSage";
    _userNameTextFiled.delegate = self;
    _passWordTextFiled.textColor = [UIColor whiteColor];
    _passWordTextFiled.placeholder = @"PassWord";
    _passWordTextFiled.secureTextEntry = YES;
    _passWordTextFiled.delegate = self;
    
    userLine.backgroundColor = [UIColor whiteColor];
    pswLine.backgroundColor = [UIColor whiteColor];
    
    _msgLabel.textColor = [UIColor orangeColor];
    _msgLabel.alpha = 0.7;
    _msgLabel.textAlignment = NSTextAlignmentCenter;
    _msgLabel.backgroundColor = [UIColor clearColor];
    _msgLabel.font = [UIFont systemFontOfSize:13];
    
    loginBtn.backgroundColor = [UIColor orangeColor];
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"login"] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    visitBtn.backgroundColor = [UIColor lightGrayColor];
    [visitBtn setBackgroundImage:[UIImage imageNamed:@"nologin"] forState:UIControlStateNormal];
    [visitBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    registerBtn.backgroundColor = [UIColor clearColor];
    [registerBtn setTitle:@"注册账号" forState:UIControlStateNormal];
    [registerBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    forgetBtn.backgroundColor = [UIColor clearColor];
    [forgetBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    [forgetBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [forgetBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    //添加
    [self addSubview:userIcon];
    [self addSubview:pswIcon];
    
    [self addSubview:_userNameTextFiled];
    [self addSubview:_passWordTextFiled];
    
    [self addSubview:userLine];
    [self addSubview:pswLine];
    
    [self addSubview:_msgLabel];
    
    [self addSubview:loginBtn];
    [self addSubview:visitBtn];
    
    [self addSubview:registerBtn];
    [self addSubview:forgetBtn];
}
//创建手势
- (void)creatGesture{
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(resigntKeyboard)];
    [self addGestureRecognizer:tap];
}
//回车换行收键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField==_userNameTextFiled) {
        [_passWordTextFiled becomeFirstResponder];
    }else
        [textField resignFirstResponder];
	return YES;
}
//键入清除提示
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    _msgLabel.text = @"";
    return YES;
}
//点击收键盘
- (void)resigntKeyboard{
    [_userNameTextFiled resignFirstResponder];
    [_passWordTextFiled resignFirstResponder];
}
//按钮点击
- (void)btnClick:(UIButton *)btn{
    [self.loginViewDelegate loginView:self withButtonTag:btn.tag];
}
@end
