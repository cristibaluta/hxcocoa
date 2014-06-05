package swift.foundation;


extern class NSUbiquitousKeyValueStore
{

	//Constants

	//Static Methods
	public function defaultStore():NSUbiquitousKeyValueStore;

	//Properties

	//Methods
	public function objectForKey( aKey:String):Dynamic;
	public function stringForKey( aKey:String):String;
	public function dictionaryRepresentation():NSDictionary;
	public function dictionaryForKey( aKey:String):NSDictionary;
	public function setLongLong( value:longlong,  aKey:String):Void;
	public function setBool( value:Bool,  aKey:String):Void;
	public function setArray( anArray:Array<>,  aKey:String):Void;
	public function synchronize():Bool;
	public function setObject( anObject:Dynamic,  aKey:String):Void;
	public function setString( aString:String,  aKey:String):Void;
	public function setData( aData:NSData,  aKey:String):Void;
	public function boolForKey( aKey:String):Bool;
	public function removeObjectForKey( aKey:String):Void;
	public function doubleForKey( aKey:String):Float;
	public function dataForKey( aKey:String):NSData;
	public function setDictionary( aDictionary:NSDictionary,  aKey:String):Void;
	public function arrayForKey( aKey:String):Array<>;
	public function setDouble( value:Float,  aKey:String):Void;
	public function longLongForKey( aKey:String):longlong;
}

extern enum null
{
}

/*	NSUbiquitousKeyValueStore.h
	Copyright (c) 2011-2012, Apple Inc. All rights reserved.
*/

package swift.foundation;

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
public function setObject:(id)anObject forKey:(NSString *)aKey;
public function removeObjectForKey:(NSString *)aKey;

- (NSString *)stringForKey:(NSString *)aKey;
- (Array<> *)arrayForKey:(NSString *)aKey;
- (NSDictionary *)dictionaryForKey:(NSString *)aKey;
- (NSData *)dataForKey:(NSString *)aKey;
- (long long)longLongForKey:(NSString *)aKey;
- (double)doubleForKey:(NSString *)aKey;
- (Bool)boolForKey:(NSString *)aKey;

public function setString:(NSString *)aString forKey:(NSString *)aKey;
public function setData:(NSData *)aData forKey:(NSString *)aKey;
public function setArray:(Array<> *)anArray forKey:(NSString *)aKey;
public function setDictionary:(NSDictionary *)aDictionary forKey:(NSString *)aKey;
public function setLongLong:(long long)value forKey:(NSString *)aKey;
public function setDouble:(double)value forKey:(NSString *)aKey;
public function setBool:(Bool)value forKey:(NSString *)aKey;

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

