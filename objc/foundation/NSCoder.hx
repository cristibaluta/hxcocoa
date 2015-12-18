package objc.foundation;

@:framework("Foundation")
extern class NSCoder extends NSObject
{

	//Constants

	//Static Methods

	//Properties

	//Methods
	public function encodeBycopyObject( anObject:Dynamic):Void;
	public function encodeInt64( intv:Int,  key:String):Void;
	public function decodeDataObject():NSData;
	public function decodeObjectForKey( key:String):Dynamic;
	public function decodePropertyListForKey( key:String):Dynamic;
	//public function encodeArrayOfObjCType( type:constchar,  count:Int,  array:constvoid):Void;
	public function containsValueForKey( key:String):Bool;
	public function decodeInt32ForKey( key:String):Int;
	public function encodeByrefObject( anObject:Dynamic):Void;
	//public function encodeBytes( byteaddr:constvoid,  length:Int):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	//public function encodeBytes1( bytesp:constuint8_t,  lenv:Int,  key:String):Void;
	public function decodeInt64ForKey( key:String):Int;
	public function encodeNXObject( object:Dynamic):Void;
	//public function decodeArrayOfObjCType( itemType:constchar,  count:Int,  array:Dynamic):Void;
	public function decodeDoubleForKey( key:String):Float;
	public function decodeObjectOfClasses( classes:NSSet,  key:String):Dynamic;
	public function encodeRootObject( rootObject:Dynamic):Void;
/*	public function setObjectZone( zone:NSZone):Void;*/
	public function systemVersion():Int;
	public function decodeNXObject():Dynamic;
	//public function encodeValueOfObjCType( type:constchar,  addr:constvoid):Void;
	public function encodePropertyList( aPropertyList:Dynamic):Void;
	public function decodeIntForKey( key:String):Int;
	//public function encodeValuesOfObjCTypes( types:constchar):Void;
	public function encodeFloat( realv:Float,  key:String):Void;
	public function decodeBoolForKey( key:String):Bool;
	//public function decodeValueOfObjCType( type:constchar,  data:Dynamic):Void;
	public function encodeConditionalObject( object:Dynamic):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public function encodeConditionalObject1( objv:Dynamic,  key:String):Void;
	public function decodePropertyList():Dynamic;
	//public function decodeValuesOfObjCTypes( types:constchar):Void;
	public function allowsKeyedCoding():Bool;
	public function encodeInt( intv:Int,  key:String):Void;
	public function encodeDouble( realv:Float,  key:String):Void;
	public function encodeBool( boolv:Bool,  key:String):Void;
	public function decodeFloatForKey( key:String):Float;
	public function encodeInteger( intv:Int,  key:String):Void;
	//public function decodeObjectOfClass( aClass:Class,  key:String):Dynamic;
	public function encodeObject( object:Dynamic):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public function encodeObject1( objv:Dynamic,  key:String):Void;
	//public function decodeBytesForKey( key:String,  lengthp:Int):constuint8_t;
	public function decodeIntegerForKey( key:String):Int;
	public function allowedClasses():NSSet;
	public function requiresSecureCoding():Bool;
	public function decodeObject():Dynamic;
	public function versionForClassName( className:String):Int;
	public function encodeDataObject( data:NSData):Void;
/*	public function objectZone():NSZone;*/
	public function decodeBytesWithReturnedLength( lengthp:Int):Dynamic;
	public function encodeInt32( intv:Int,  key:String):Void;
}

/*	NSCoder.h
	Copyright (c) 1993-2012, Apple Inc. All rights reserved.
*/
		/*
import objc.foundation.NSObject;

@class NSString, NSData, NSSet;

extern class NSCoder extends NSObject

public function encodeValueOfObjCType:(const char *)type at:(const void *)addr;
public function encodeDataObject:(NSData *)data;
public function decodeValueOfObjCType:(const char *)type at:(void *)data;
- (NSData *)decodeDataObject;
- (Int)versionForClassName:(NSString *)className;

}

extern class NSCoder (NSExtendedCoder)
    
public function encodeObject:(id)object;
public function encodeRootObject:(id)rootObject;
public function encodeBycopyObject:(id)anObject;
public function encodeByrefObject:(id)anObject;
public function encodeConditionalObject:(id)object;
public function encodeValuesOfObjCTypes:(const char *)types, ...;
public function encodeArrayOfObjCType:(const char *)type count:(NSUInteger)count at:(const void *)array;
public function encodeBytes:(const void *)byteaddr length:(NSUInteger)length;

- (id)decodeObject;
public function decodeValuesOfObjCTypes:(const char *)types, ...;
public function decodeArrayOfObjCType:(const char *)itemType count:(NSUInteger)count at:(void *)array;
- (void *)decodeBytesWithReturnedLength:(NSUInteger *)lengthp NS_RETURNS_INNER_POINTER;

#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))
public function encodePropertyList:(id)aPropertyList;
- (id)decodePropertyList;
#endif

public function setObjectZone:(NSZone *)zone NS_AUTOMATED_REFCOUNT_UNAVAILABLE;
- (NSZone *)objectZone NS_AUTOMATED_REFCOUNT_UNAVAILABLE;

- (unsigned)systemVersion;

- (Bool)allowsKeyedCoding;

public function encodeObject:(id)objv forKey:(NSString *)key;
public function encodeConditionalObject:(id)objv forKey:(NSString *)key;
public function encodeBool:(Bool)boolv forKey:(NSString *)key;
public function encodeInt:(int)intv forKey:(NSString *)key;
public function encodeInt32:(int32_t)intv forKey:(NSString *)key;
public function encodeInt64:(int64_t)intv forKey:(NSString *)key;
public function encodeFloat:(float)realv forKey:(NSString *)key;
public function encodeDouble:(double)realv forKey:(NSString *)key;
public function encodeBytes:(const uint8_t *)bytesp length:(NSUInteger)lenv forKey:(NSString *)key;

- (Bool)containsValueForKey:(NSString *)key;
- (id)decodeObjectForKey:(NSString *)key;
- (Bool)decodeBoolForKey:(NSString *)key;
- (int)decodeIntForKey:(NSString *)key;
- (int32_t)decodeInt32ForKey:(NSString *)key;
- (int64_t)decodeInt64ForKey:(NSString *)key;
- (float)decodeFloatForKey:(NSString *)key;
- (double)decodeDoubleForKey:(NSString *)key;
- (const uint8_t *)decodeBytesForKey:(NSString *)key returnedLength:(NSUInteger *)lengthp NS_RETURNS_INNER_POINTER;   // returned bytes immutable!

public function encodeInteger:(Int)intv forKey:(NSString *)key NS_AVAILABLE(10_5, 2_0);
- (Int)decodeIntegerForKey:(NSString *)key NS_AVAILABLE(10_5, 2_0);

// Returns YES if this coder requires secure coding. Secure coders check a list of allowed classes before decoding objects, and all objects must implement NSSecureCoding.
- (Bool)requiresSecureCoding NS_AVAILABLE(10_8, 6_0);

// Specify what the expected class of the allocated object is. If the coder responds YES to -requiresSecureCoding, then an exception will be thrown if the class to be decoded does not implement NSSecureCoding or is not isKindOfClass: of the argument. If the coder responds NO to -requiresSecureCoding, then the class argument is ignored and no check of the class of the decoded object is performed, exactly as if decodeObjectForKey: had been called.
- (id)decodeObjectOfClass:(Class)aClass forKey:(NSString *)key NS_AVAILABLE(10_8, 6_0);

// The class of the object may be any class in the provided NSSet, or a subclass of any class in the set. Otherwise, the behavior is the same as -decodeObjectOfClass:forKey:.
- (id)decodeObjectOfClasses:(NSSet *)classes forKey:(NSString *)key NS_AVAILABLE(10_8, 6_0);

// Calls -decodeObjectOfClasses:forKey: with a set allowing only property list types.
- (id)decodePropertyListForKey:(NSString *)key NS_AVAILABLE(10_8, 6_0);

// Get the current set of allowed classes.
- (NSSet *)allowedClasses NS_AVAILABLE(10_8, 6_0);

}
			
(UIGeometryKeyedCoding)

	public function encodeCGPoint:(CGPoint)point forKey:(NSString *)key;
	public function encodeCGSize:(CGSize)size forKey:(NSString *)key;
	public function encodeCGRect:(CGRect)rect forKey:(NSString *)key;
	public function encodeCGAffineTransform:(CGAffineTransform)transform forKey:(NSString *)key;
	public function encodeUIEdgeInsets:(UIEdgeInsets)insets forKey:(NSString *)key;
	public function encodeUIOffset:(UIOffset)offset forKey:(NSString *)key NS_AVAILABLE_IOS(5_0);

- (CGPoint)decodeCGPointForKey:(NSString *)key;
- (CGSize)decodeCGSizeForKey:(NSString *)key;
- (CGRect)decodeCGRectForKey:(NSString *)key;
- (CGAffineTransform)decodeCGAffineTransformForKey:(NSString *)key;
- (UIEdgeInsets)decodeUIEdgeInsetsForKey:(NSString *)key;
- (UIOffset)decodeUIOffsetForKey:(NSString *)key NS_AVAILABLE_IOS(5_0);

*/

