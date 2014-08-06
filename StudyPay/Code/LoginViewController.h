//
//  LoginViewController.h
//  StudyPay
//
//  Created by TopSageOSX on 14-8-4.
//  Copyright (c) 2014年 com.topsage. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginView.h"
#import "loginMethod.h"
#import "UIView+Shake.h"
#import "TabbarViewController.h"
@interface LoginViewController : UIViewController<loginViewDelegate>
/**
 *  登录视图
 */
@property (nonatomic,retain)LoginView *loginView;
@end
