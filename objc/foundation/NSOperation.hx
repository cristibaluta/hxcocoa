/*	NSOperation.h
	Copyright (c) 2006-2012, Apple Inc. All rights reserved.
*/

package objc.foundation;

extern enum NSOperationQueuePriority {
	NSOperationQueuePriorityVeryLow;
	NSOperationQueuePriorityLow;
	NSOperationQueuePriorityNormal;
	NSOperationQueuePriorityHigh;
	NSOperationQueuePriorityVeryHigh;
}

extern class NSOperation extends NSObject {

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


extern class NSOperationQueue extends NSObject {

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



