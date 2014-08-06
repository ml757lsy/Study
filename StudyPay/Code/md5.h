//
//  md5.h
//  StudyPay
//
//  Created by TopSageOSX on 14-8-5.
//  Copyright (c) 2014年 com.topsage. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
@interface md5 : NSObject
+ (NSString *)md5:(NSString *)str;
@end
