//
//  Array
//  HelloWorld
//
//  Source generated by Haxe Objective-C target
//

#import "Array.h"

@implementation NSMutableArray ( Array )

- (id)hx_objectAtIndex:(int)index {
	
	if (index >= [self count]) while ([self count] <= index) [self addObject:[NSNull null]];
	id obj = [self objectAtIndex:index];
	if ([obj isKindOfClass:[NSNull class]]) obj = nil;
	return obj;
}
- (void)hx_replaceObjectAtIndex:(int)index withObject:(id)withObject {
	
	if (index >= [self count]) while ([self count] <= index) [self addObject:[NSNull null]];
	[self replaceObjectAtIndex:index withObject:(withObject==nil?[NSNull null]:withObject)];
}
- (NSMutableArray *)filter:(id)f {
	
	return nil;
}
- (NSMutableArray *)map:(id)f {
	
	return nil;
}
- (id)iterator {
	
	
	HxIterator  *it = [[HxIterator alloc] init];
	it.arr = self;
	it.len = self.length;
	return it;
}
- (NSMutableArray *)splice:(int)pos len:(int)len {
	
	NSArray *newArray = [self subarrayWithRange:NSMakeRange(pos, len)];
	[self removeObjectsInArray:newArray];
	return [NSMutableArray arrayWithArray:newArray];
}
- (void)sort:(id)f {
	
}
- (NSMutableArray *)slice:(int)pos end:(int)end {
	
	// Optional arguments
	if (!end) end = nil;
	
	return [self splice:pos len:end - pos];
}
- (id)shift {
	
	if (self.length > 0)  {
		
		id obj = [self objectAtIndex:0];
		[self removeObjectAtIndex:0];
		return obj;
	}
	return nil;
}
- (void)reverse {
	
	id reverseArray = [[self reverseObjectEnumerator] allObjects];
}
- (BOOL)remove:(id)x {
	
	BOOL containsObject = [self containsObject:x];
	if (containsObject)  {
		[self removeObject:x];
	}
	return containsObject;
}
- (void)unshift:(id)x {
	
	[self insertObject:(x!=nil?x:[NSNull null]) atIndex:0];
}
- (int)push:(id)x {
	
	[self addObject:(x!=nil?x:[NSNull null])];
	return [self count];
}
- (id)pop {
	
	if ([self count] == 0)  {
		return nil;
	}
	id theLastObject = [self lastObject];
	if ([theLastObject isKindOfClass:[NSNull class]]) theLastObject = nil;
	[self removeLastObject];
	return theLastObject;
}
- (NSString *)toString {
	
	return [NSMutableString stringWithString:[self description]];
}
- (NSString *)join:(NSString *)sep {
	
	return [NSMutableString stringWithString:[self componentsJoinedByString:sep]];
}
- (int)lastIndexOf:(id)x fromIndex:(int)fromIndex {
	
	// Optional arguments
	if (!fromIndex) fromIndex = nil;
	
	return 0;
}
- (int)indexOf:(id)x fromIndex:(int)fromIndex {
	
	// Optional arguments
	if (!fromIndex) fromIndex = nil;
	
	return 0;
}
- (void)insert:(int)pos x:(id)x {
	
	[self insertObject:(x!=nil?x:[NSNull null]) atIndex:pos];
}
- (NSMutableArray *)copy {
	
	return [NSMutableArray arrayWithArray:self];
}
- (NSMutableArray *)concat:(NSMutableArray *)a {
	
	
	NSMutableArray  *b = [[NSMutableArray alloc] init];
	[b addObjectsFromArray:self];
	[b addObjectsFromArray:a];
	return b;
}
// Getters/setters for property: length
- (int)length { return [self count]; }
- (void) setLength:(int)val { nil; }

- (id)init {
	
	self = [super init];
	return self;
}

@end