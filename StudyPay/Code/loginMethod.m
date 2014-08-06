//
//  loginMethod.m
//  StudyPay
//
//  Created by TopSageOSX on 14-8-5.
//  Copyright (c) 2014年 com.topsage. All rights reserved.
//

#import "loginMethod.h"

@implementation loginMethod
+(int)checkUserName:(NSString *)userName andPassWord:(NSString *)passWord{
    if (0 == userName.length) {
        //没输入
        return 1;
    }else if(32 < userName.length){
        //太长
        return 2;
    }else if(0 == passWord.length){
        //没输入
        return 3;
    }else if(6 > passWord.length||32 < passWord.length){
        //位数不符合
        return 4;
    }else{
        return 0;
    }
}
@end
