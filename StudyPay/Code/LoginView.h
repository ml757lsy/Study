//
//  LoginView.h
//  StudyPay
//
//  Created by TopSageOSX on 14-8-5.
//  Copyright (c) 2014年 com.topsage. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Shake.h"
/**
 *  登录代理协议
 */
@protocol loginViewDelegate <NSObject>

/**
 *  登录代理方法
 *  @param view->self tag->buttonTag
 */
- (void)loginView:(UIView *)view withButtonTag:(NSInteger)tag;

@end

@interface LoginView : UIView<UITextFieldDelegate>

/**
 *  用户名输入框
 */
@property (nonatomic,retain)UITextField *userNameTextFiled;
/**
 *  密码输入框
 */
@property (nonatomic,retain)UITextField *passWordTextFiled;
/**
 *  登录代理
 */
@property (nonatomic,assign)id<loginViewDelegate> loginViewDelegate;
/**
 *  提示标签
 */
@property (nonatomic,copy)UILabel *msgLabel;
@end
