//
//  UserDataManager.m
//  keychain
//
//  Created by 茅矛 on 15-4-7.
//  Copyright (c) 2015年 tfwang. All rights reserved.
//

#import "UserDataManager.h"
#import "KeyChain.h"

@implementation UserDataManager

static NSString *const KEY_INEYCHAIN = @"";
static NSString *const KEY_PASSWORD = @"";

+ (void)savePassword:(NSString *)password {
    NSMutableDictionary *usernamePasswordKVPairs = [NSMutableDictionary dictionary];
    [usernamePasswordKVPairs setObject:password forKey:KEY_PASSWORD];
    [KeyChain save:KEY_INEYCHAIN data:usernamePasswordKVPairs];
}

+ (id)readPassword {
    NSMutableDictionary *usernamePasswordKVPairs = (NSMutableDictionary *)[KeyChain load:KEY_INEYCHAIN];
    return [usernamePasswordKVPairs objectForKey:KEY_PASSWORD];
}

+ (void)deletePassword {
    [KeyChain delete:KEY_INEYCHAIN];
}

@end
