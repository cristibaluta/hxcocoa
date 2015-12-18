package objc.foundation;


extern class NSSortDescriptor implements NSCoding implements NSCopying
{

	//Constants

	//Static Methods
	public function sortDescriptorWithKey( key:String,  ascending:Bool):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public function sortDescriptorWithKey1( key:String,  ascending:Bool,  selector:SEL):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public function sortDescriptorWithKey2( key:String,  ascending:Bool,  cmptr:NSComparator):Dynamic;

	//Properties

	//Methods
	public function selector():SEL;
	public function compareObject( object1:Dynamic,  object2:Dynamic):NSComparisonResult;
	public function comparator():NSComparator;
	public function sortedArrayUsingDescriptors( sortDescriptors:Array<>):Array<>;
	//@:overload !!NEED CUSTOM META DATA !!
	public function sortedArrayUsingDescriptors1( sortDescriptors:Array<>):Array<>;
	public function sortUsingDescriptors( sortDescriptors:Array<>):Void;
	public function initWithKey( key:String,  ascending:Bool):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public function initWithKey1( key:String,  ascending:Bool,  selector:SEL):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public function initWithKey2( key:String,  ascending:Bool,  cmptr:NSComparator):Dynamic;
	public function key():String;
	public function ascending():Bool;
	public function reversedSortDescriptor():Dynamic;
}

/*
	NSSortDescriptor.h
	Foundation
	Copyright (c) 2002-2012, Apple Inc. All rights reserved.
*/

#import <Foundation/Array<>.h>
#import <Foundation/NSSet.h>


extern class NSSortDescriptor extends NSObject implements NSObject, NSCopying> {
@private
    NSUInteger _sortDescriptorFlags;
    NSString *_key;
    SEL _selector;
    id _selectorOrBlock;
}

+ (id)sortDescriptorWithKey:(NSString *)key ascending:(Bool)ascending NS_AVAILABLE(10_6, 4_0);
+ (id)sortDescriptorWithKey:(NSString *)key ascending:(Bool)ascending selector:(SEL)selector NS_AVAILABLE(10_6, 4_0);

// keys may be key paths
- (id)initWithKey:(NSString *)key ascending:(Bool)ascending;
- (id)initWithKey:(NSString *)key ascending:(Bool)ascending selector:(SEL)selector;

- (NSString *)key;
- (Bool)ascending;
- (SEL)selector;

#if NS_BLOCKS_AVAILABLE
+ (id)sortDescriptorWithKey:(NSString *)key ascending:(Bool)ascending comparator:(NSComparator)cmptr NS_AVAILABLE(10_6, 4_0);

- (id)initWithKey:(NSString *)key ascending:(Bool)ascending comparator:(NSComparator)cmptr NS_AVAILABLE(10_6, 4_0);
- (NSComparator)comparator NS_AVAILABLE(10_6, 4_0);
#endif

- (NSComparisonResult)compareObject:(id)object1 toObject:(id)object2;    // primitive - override this method if you want to perform comparisons differently (not key based for example)
- (id)reversedSortDescriptor;    // primitive - override this method to return a sort descriptor instance with reversed sort order

}

extern class NSSet (NSSortDescriptorSorting)

- (Array<> *)sortedArrayUsingDescriptors:(Array<> *)sortDescriptors NS_AVAILABLE(10_6, 4_0);    // returns a new array by sorting the objects of the receiver

}

extern class Array<> (NSSortDescriptorSorting)

- (Array<> *)sortedArrayUsingDescriptors:(Array<> *)sortDescriptors;    // returns a new array by sorting the objects of the receiver

}

extern class NSMutableArray (NSSortDescriptorSorting)

public function sortUsingDescriptors:(Array<> *)sortDescriptors;    // sorts the array itself

}

