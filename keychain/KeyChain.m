//
//  KeyChain.m
//  keychain
//
//  Created by 茅矛 on 15-4-7.
//  Copyright (c) 2015年 tfwang. All rights reserved.
//

#import "KeyChain.h"

@implementation KeyChain

+ (NSMutableDictionary *)query:(NSString *)service {
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (__bridge_transfer id)kSecClassGenericPassword, (__bridge_transfer id)kSecClass,
            service, (__bridge_transfer id)kSecAttrService, service, (__bridge_transfer id)kSecAttrAccount,
            (__bridge_transfer id)kSecAttrAccessibleAfterFirstUnlock, (__bridge_transfer id)kSecAttrAccessible,
            nil];
}

+ (void)save:(NSString *)service data:(id)data {
    NSMutableDictionary *keyChainQuery = [self query:service];
    SecItemDelete((__bridge_retained CFDictionaryRef)keyChainQuery);
    [keyChainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(__bridge_transfer id)kSecValueData];
    SecItemAdd((__bridge_retained CFDictionaryRef)keyChainQuery, NULL);
}

+ (id)load:(NSString *)service {
    id ret = nil;
    NSMutableDictionary *keyChainQuery = [self query:service];
    [keyChainQuery setObject:(id)kCFBooleanTrue forKey:(__bridge_transfer id)kSecReturnData];
    [keyChainQuery setObject:(__bridge_transfer id)kSecMatchLimitOne forKey:(__bridge_transfer id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((__bridge_retained CFDictionaryRef)keyChainQuery, (CFTypeRef *)&keyData) == noErr) {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge_transfer NSData *)keyData];
        }
        @catch (NSException *exception) {
            NSLog(@"Unarchiver of %@ failed: %@", service, exception);
        }
        @finally {
        }
    }
    return ret;
}

+ (void)delete:(NSString *)service {
    NSMutableDictionary *keyChainQuery = [self query:service];
    SecItemDelete((__bridge_retained CFDictionaryRef)keyChainQuery);
}

@end
