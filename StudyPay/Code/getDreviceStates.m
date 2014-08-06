//
//  getDreviceStates.m
//  StudeyPay
//
//  Created by TopSageOSX on 14-8-4.
//  Copyright (c) 2014年 com.topsage. All rights reserved.
//

#import "getDreviceStates.h"

@implementation getDreviceStates
+(NSString *)getDrevicesState{
    return [UIDevice currentDevice].model;
}
@end
