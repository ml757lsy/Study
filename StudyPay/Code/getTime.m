//
//  getTime.m
//  StudyPay
//
//  Created by TopSageOSX on 14-8-5.
//  Copyright (c) 2014年 com.topsage. All rights reserved.
//

#import "getTime.h"

@implementation getTime

+(NSString *)getTime{
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
    long long int date = (long long int)time;
    NSString *timeString = [NSString stringWithFormat:@"%lld", date];
    return timeString;
}
@end
