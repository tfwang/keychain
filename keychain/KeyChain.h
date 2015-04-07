//
//  KeyChain.h
//  keychain
//
//  Created by 茅矛 on 15-4-7.
//  Copyright (c) 2015年 tfwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Security/Security.h>

@interface KeyChain : NSObject

+ (void)save:(NSString *)service data:(id)data;
+ (NSMutableDictionary *)query:(NSString *)service;
+ (id)load:(NSString *)service;
+ (void)delete:(NSString *)service;

@end
