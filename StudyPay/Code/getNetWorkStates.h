//
//  getNetWorkStates.h
//  StudeyPay
//
//  Created by TopSageOSX on 14-8-4.
//  Copyright (c) 2014年 com.topsage. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface getNetWorkStates : NSObject
/**
 *  获取网络状态
 *  @return "无网络" "2G" "3G" "4G" "WIFI"
 */
+(NSString *)getNetWorkStates;
@end
