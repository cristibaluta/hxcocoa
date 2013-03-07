/*	NSUbiquitousKeyValueStore.h
	Copyright (c) 2011-2012, Apple Inc. All rights reserved.
*/

#import <Foundation/NSObject.h>

@class Array<>, NSDictionary, NSData, NSString;

NS_CLASS_AVAILABLE(10_7, 5_0)
extern class NSUbiquitousKeyValueStore extends NSObject {
@private
    id _private1;
    id _private2;
    id _private3;
    void *_private4;
    void *_reserved[3];
}

+ (NSUbiquitousKeyValueStore *)defaultStore;

- (id)objectForKey:(NSString *)aKey;
- (void)setObject:(id)anObject forKey:(NSString *)aKey;
- (void)removeObjectForKey:(NSString *)aKey;

- (NSString *)stringForKey:(NSString *)aKey;
- (Array<> *)arrayForKey:(NSString *)aKey;
- (NSDictionary *)dictionaryForKey:(NSString *)aKey;
- (NSData *)dataForKey:(NSString *)aKey;
- (long long)longLongForKey:(NSString *)aKey;
- (double)doubleForKey:(NSString *)aKey;
- (Bool)boolForKey:(NSString *)aKey;

- (void)setString:(NSString *)aString forKey:(NSString *)aKey;
- (void)setData:(NSData *)aData forKey:(NSString *)aKey;
- (void)setArray:(Array<> *)anArray forKey:(NSString *)aKey;
- (void)setDictionary:(NSDictionary *)aDictionary forKey:(NSString *)aKey;
- (void)setLongLong:(long long)value forKey:(NSString *)aKey;
- (void)setDouble:(double)value forKey:(NSString *)aKey;
- (void)setBool:(Bool)value forKey:(NSString *)aKey;

- (NSDictionary *)dictionaryRepresentation;

- (Bool)synchronize;

}

FOUNDATION_EXPORT NSString * const NSUbiquitousKeyValueStoreDidChangeExternallyNotification NS_AVAILABLE(10_7, 5_0);
FOUNDATION_EXPORT NSString * const NSUbiquitousKeyValueStoreChangeReasonKey NS_AVAILABLE(10_7, 5_0);
FOUNDATION_EXPORT NSString * const NSUbiquitousKeyValueStoreChangedKeysKey NS_AVAILABLE(10_7, 5_0);

enum {
    NSUbiquitousKeyValueStoreServerChange NS_ENUM_AVAILABLE(10_7, 5_0),
    NSUbiquitousKeyValueStoreInitialSyncChange NS_ENUM_AVAILABLE(10_7, 5_0),
    NSUbiquitousKeyValueStoreQuotaViolationChange NS_ENUM_AVAILABLE(10_7, 5_0),
    NSUbiquitousKeyValueStoreAccountChange NS_ENUM_AVAILABLE(10_8, 6_0)
};

