package objc.foundation;


extern class NSOperation
{

	//Constants

	//Static Methods
	public function currentQueue():Dynamic;
	public function blockOperationWithBlock( block:Dynamic):Dynamic;
	public function mainQueue():Dynamic;

	//Properties

	//Methods
	public function setMaxConcurrentOperationCount( cnt:Int):Void;
	public function executionBlocks():Array<>;
	public function addOperation( op:NSOperation):Void;
	public function setQueuePriority( p:NSOperationQueuePriority):Void;
	public function setSuspended( b:Bool):Void;
	public function addOperations( ops:Array<>,  wait:Bool):Void;
	public function setName( n:String):Void;
	public function operations():Array<>;
	public function isCancelled():Bool;
	public function dependencies():Array<>;
	public function cancelAllOperations():Void;
	public function start():Void;
	public function initWithInvocation( inv:NSInvocation):Dynamic;
	public function initWithTarget( target:Dynamic,  sel:SEL,  arg:Dynamic):Dynamic;
	public function main():Void;
	public function threadPriority():Float;
	public function addExecutionBlock( block:Dynamic):Void;
	public function removeDependency( op:NSOperation):Void;
	public function name():String;
	public function (():Dynamic;
	public function setThreadPriority( p:Float):Void;
	public function invocation():NSInvocation;
	public function queuePriority():NSOperationQueuePriority;
	public function isExecuting():Bool;
	public function isFinished():Bool;
	public function addDependency( op:NSOperation):Void;
	public function result():Dynamic;
	public function isReady():Bool;
	public function isSuspended():Bool;
	public function isConcurrent():Bool;
	public function waitUntilFinished():Void;
	public function maxConcurrentOperationCount():Int;
	public function cancel():Void;
	public function waitUntilAllOperationsAreFinished():Void;
	public function setCompletionBlock( block:Dynamic):Void;
	public function addOperationWithBlock( block:Dynamic):Void;
	public function init():Dynamic;
	public function operationCount():Int;
}

extern enum NSOperationQueuePriority
{
	NSOperationQueuePriorityVeryLow;
	NSOperationQueuePriorityLow;
	NSOperationQueuePriorityNormal;
	NSOperationQueuePriorityHigh;
	NSOperationQueuePriorityVeryHigh;
}

/*	NSOperation.h
	Copyright (c) 2006-2012, Apple Inc. All rights reserved.
*/

package objc.foundation;


@class Array<>, NSSet;

NS_CLASS_AVAILABLE(10_5, 2_0)
extern class NSOperation extends NSObject {
@private
    id _private;
    int32_t _private1;
#if __LP64__
    int32_t _private1b;
#endif
}

- (id)init; // designated initializer

public function start;
public function main;

- (Bool)isCancelled;
public function cancel;

- (Bool)isExecuting;
- (Bool)isFinished;

- (Bool)isConcurrent;

- (Bool)isReady;

public function addDependency:(NSOperation *)op;
public function removeDependency:(NSOperation *)op;

- (Array<> *)dependencies;

typedef NS_ENUM(Int, NSOperationQueuePriority) {
	NSOperationQueuePriorityVeryLow = -8L,
	NSOperationQueuePriorityLow = -4L,
	NSOperationQueuePriorityNormal = 0,
	NSOperationQueuePriorityHigh = 4,
	NSOperationQueuePriorityVeryHigh = 8
};

- (NSOperationQueuePriority)queuePriority;
public function setQueuePriority:(NSOperationQueuePriority)p;

#if NS_BLOCKS_AVAILABLE
- (void (^)(void))completionBlock NS_AVAILABLE(10_6, 4_0);
public function setCompletionBlock:(void (^)(void))block NS_AVAILABLE(10_6, 4_0);
#endif

public function waitUntilFinished NS_AVAILABLE(10_6, 4_0);

- (double)threadPriority NS_AVAILABLE(10_6, 4_0);
public function setThreadPriority:(double)p NS_AVAILABLE(10_6, 4_0);

}



NS_CLASS_AVAILABLE(10_6, 4_0)
extern class NSBlockOperation extends NSOperation {
@private
    id _private2;
    void *_reserved2;
}

#if NS_BLOCKS_AVAILABLE
+ (id)blockOperationWithBlock:(void (^)(void))block;

public function addExecutionBlock:(void (^)(void))block;
- (Array<> *)executionBlocks;
#endif

}


NS_CLASS_AVAILABLE(10_5, 2_0)
extern class NSInvocationOperation extends NSOperation {
@private
    id _inv;
    id _exception;
    void *_reserved2;
}

- (id)initWithTarget:(id)target selector:(SEL)sel object:(id)arg;
- (id)initWithInvocation:(NSInvocation *)inv;		// designated initializer

- (NSInvocation *)invocation;

- (id)result;

}

FOUNDATION_EXPORT NSString * const NSInvocationOperationVoidResultException NS_AVAILABLE(10_5, 2_0);
FOUNDATION_EXPORT NSString * const NSInvocationOperationCancelledException NS_AVAILABLE(10_5, 2_0);

NS_CLASS_AVAILABLE(10_5, 2_0)
extern class NSOperationQueue extends NSObject {
@private
    id _private;
    void *_reserved;
}

public function addOperation:(NSOperation *)op;
public function addOperations:(Array<> *)ops waitUntilFinished:(Bool)wait NS_AVAILABLE(10_6, 4_0);

#if NS_BLOCKS_AVAILABLE
public function addOperationWithBlock:(void (^)(void))block NS_AVAILABLE(10_6, 4_0);
#endif

- (Array<> *)operations;
- (NSUInteger)operationCount NS_AVAILABLE(10_6, 4_0);

- (Int)maxConcurrentOperationCount;
public function setMaxConcurrentOperationCount:(Int)cnt;

enum {
    NSOperationQueueDefaultMaxConcurrentOperationCount = -1
};

public function setSuspended:(Bool)b;
- (Bool)isSuspended;

public function setName:(NSString *)n NS_AVAILABLE(10_6, 4_0);
- (NSString *)name NS_AVAILABLE(10_6, 4_0);

public function cancelAllOperations;

public function waitUntilAllOperationsAreFinished;

+ (id)currentQueue NS_AVAILABLE(10_6, 4_0);
+ (id)mainQueue NS_AVAILABLE(10_6, 4_0);

}



