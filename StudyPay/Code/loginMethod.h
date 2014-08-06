//
//  loginMethod.h
//  StudyPay
//
//  Created by TopSageOSX on 14-8-5.
//  Copyright (c) 2014年 com.topsage. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface loginMethod : NSObject
/**
 *  提交前的基本信息判断
 * @return 0 格式正确 1 请输入用户名 2 用户名为6-32位字母数字 3 请输入密码 4 密码位数为6-32位字母数字
 */
+(int)checkUserName:(NSString *)userName andPassWord:(NSString *)passWord;
@end
