//
//  UserDataManager.h
//  keychain
//
//  Created by 茅矛 on 15-4-7.
//  Copyright (c) 2015年 tfwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDataManager : NSObject

+ (void)savePassword:(NSString *)password;
+ (id)readPassword;
+ (void)deletePassword;

@end
