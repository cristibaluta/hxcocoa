package objc.foundation;
import objc.foundation.NSObject;

private typedef NSEnumerationOptions = Dynamic;
private typedef NSSortOptions = Dynamic;
private typedef NSComparator = Dynamic;

extern class NSSet extends NSObject implements NSCopying implements NSMutableCopying implements NSSecureCoding {

//extern class NSSet (NSExtendedSet)

	public function allObjects () :Array<Dynamic>;
	public function anyObject () :Dynamic;
	public function containsObject (anObject:Dynamic) :Bool;
	public function description () :String;
	public function descriptionWithLocale (locale:Dynamic) :String;
	public function intersectsSet (otherSet:NSSet) :Bool;
	public function isEqualToSet (otherSet:NSSet) :Bool;
	public function isSubsetOfSet (otherSet:NSSet) :Bool;

	@:overload(function(aSelector:SEL, withObject:Dynamic) :Void {})
	public function makeObjectsPerformSelector (aSelector:SEL) :Void;

	public function setByAddingObject (anObject:Dynamic) :NSSet;
	public function setByAddingObjectsFromSet (other:NSSet) :NSSet;
	public function setByAddingObjectsFromArray (other:Array<Dynamic>) :NSSet;

#if NS_BLOCKS_AVAILABLE
- (void)enumerateObjectsUsingBlock:(void (^)(id obj, Bool *stop))block NS_AVAILABLE(10_6, 4_0);
- (void)enumerateObjectsWithOptions:(NSEnumerationOptions)opts usingBlock:(void (^)(id obj, Bool *stop))block NS_AVAILABLE(10_6, 4_0);

- (NSSet *)objectsPassingTest:(Bool (^)(id obj, Bool *stop))predicate NS_AVAILABLE(10_6, 4_0);
- (NSSet *)objectsWithOptions:(NSEnumerationOptions)opts passingTest:(Bool (^)(id obj, Bool *stop))predicate NS_AVAILABLE(10_6, 4_0);
#end

//extern class NSSet (NSSetCreation)

	public static function set () :NSSet;
	public static function setWithObject (object:Dynamic) :NSSet;
	//public static function setWithObjects (const id [])objects count:(NSUInteger)cnt;
	//public static function setWithObjects (id)firstObj, ... NS_REQUIRES_NIL_TERMINATION;
	public static function setWithSet (set:NSSet) :NSSet;
	public static function setWithArray (array:Array<Dynamic>) :NSSet;

	//public function initWithObjects:(const id [])objects count:(NSUInteger)cnt;
	//public function initWithObjects:(id)firstObj, ... NS_REQUIRES_NIL_TERMINATION;
	@:overload(function(set:NSSet, copyItems:Bool) :NSSet{})
	public function initWithSet (set:NSSet) :NSSet;
	public function initWithArray (objs:Array<Dynamic>) :NSSet;

}

extern class NSMutableSet extends NSSet {

	public function addObject (object:Dynamic) :Void;
	public function removeObject (object:Dynamic) :Void;

//extern class NSMutableSet (NSExtendedMutableSet)

	public function addObjectsFromArray (array:Array<Dynamic>) :Void;
	public function intersectSet (otherSet:NSSet) :Void;
	public function minusSet (otherSet:NSSet) :Void;
	public function removeAllObjects () :Void;
	public function unionSet (otherSet:NSSet) :Void;

	public function setSet (otherSet:NSSet) :Void;

//extern class NSMutableSet (NSMutableSetCreation)

//+ (id)setWithCapacity:(NSUInteger)numItems;
//- (id)initWithCapacity:(NSUInteger)numItems;
    
}


extern class NSCountedSet extends NSMutableSet {

/*- (id)initWithCapacity:(NSUInteger)numItems; // designated initializer

- (id)initWithArray:(Array<> *)array;
- (id)initWithSet:(NSSet *)set;

- (NSUInteger)countForObject:(id)object;

- (NSEnumerator *)objectEnumerator;*/
	override public function addObject (object:Dynamic) :Void;
	override public function removeObject (object:Dynamic) :Void;

}
