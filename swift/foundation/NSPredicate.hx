package swift.foundation;


extern class NSPredicate implements NSCoding implements NSCopying
{

	//Constants

	//Static Methods
	public function predicateWithValue( value:Bool):NSPredicate;
	public function predicateWithFormat( predicateFormat:String,  arguments:Array<>):NSPredicate;
	//@:overload !!NEED CUSTOM META DATA !!
	public function predicateWithFormat1( predicateFormat:String):NSPredicate;
	//@:overload !!NEED CUSTOM META DATA !!
	public function predicateWithFormat2( predicateFormat:String,  argList:va_list):NSPredicate;
	public function predicateWithBlock( block:Dynamic):NSPredicate;

	//Properties

	//Methods
	public function filteredSetUsingPredicate( predicate:NSPredicate):NSSet;
	public function evaluateWithObject( object:Dynamic):Bool;
	//@:overload !!NEED CUSTOM META DATA !!
	public function evaluateWithObject1( object:Dynamic,  bindings:NSDictionary):Bool;
	public function filteredArrayUsingPredicate( predicate:NSPredicate):Array<>;
	public function filterUsingPredicate( predicate:NSPredicate):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public function filterUsingPredicate1( predicate:NSPredicate):Void;
	public function predicateFormat():String;
	public function predicateWithSubstitutionVariables( variables:NSDictionary):NSPredicate;
}

/*	NSPredicate.h
	Copyright (c) 2004-2012, Apple Inc. All rights reserved.
*/

package swift.foundation;
#import <Foundation/Array<>.h>
#import <Foundation/NSSet.h>

// Predicates wrap some combination of expressions and operators and when evaluated return a Bool.

NS_CLASS_AVAILABLE(10_4, 3_0)
extern class NSPredicate extends NSObject implements NSObject, NSCopying> {
    void *_reserved;
}

// Parse predicateFormat and return an appropriate predicate
+ (NSPredicate *)predicateWithFormat:(NSString *)predicateFormat argumentArray:(Array<> *)arguments;
+ (NSPredicate *)predicateWithFormat:(NSString *)predicateFormat, ...;
+ (NSPredicate *)predicateWithFormat:(NSString *)predicateFormat arguments:(va_list)argList;

+ (NSPredicate *)predicateWithValue:(Bool)value;    // return predicates that always evaluate to true/false

#if NS_BLOCKS_AVAILABLE
+ (NSPredicate*)predicateWithBlock:(Bool (^)(id evaluatedObject, NSDictionary *bindings))block NS_AVAILABLE(10_6, 4_0); 
#endif

- (NSString *)predicateFormat;    // returns the format string of the predicate

- (NSPredicate *)predicateWithSubstitutionVariables:(NSDictionary *)variables;    // substitute constant values for variables

- (Bool)evaluateWithObject:(id)object;    // evaluate a predicate against a single object

- (Bool)evaluateWithObject:(id)object substitutionVariables:(NSDictionary *)bindings NS_AVAILABLE(10_5, 3_0); // single pass evaluation substituting variables from the bindings dictionary for any variable expressions encountered

}

extern class Array<> (NSPredicateSupport)
- (Array<> *)filteredArrayUsingPredicate:(NSPredicate *)predicate;    // evaluate a predicate against an array of objects and return a filtered array
}

extern class NSMutableArray (NSPredicateSupport)
public function filterUsingPredicate:(NSPredicate *)predicate;    // evaluate a predicate against an array of objects and filter the mutable array directly
}


extern class NSSet (NSPredicateSupport)
- (NSSet *)filteredSetUsingPredicate:(NSPredicate *)predicate NS_AVAILABLE(10_5, 3_0);    // evaluate a predicate against a set of objects and return a filtered set
}

extern class NSMutableSet (NSPredicateSupport)
public function filterUsingPredicate:(NSPredicate *)predicate NS_AVAILABLE(10_5, 3_0);    // evaluate a predicate against a set of objects and filter the mutable set directly
}

