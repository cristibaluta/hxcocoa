package objc.foundation;


extern class NSRunLoop extends NSObject {

	public static function currentRunLoop () :NSRunLoop;
	public static function mainRunLoop () :NSRunLoop;

- (NSString *)currentMode;
- (CFRunLoopRef)getCFRunLoop;

- (void)addTimer:(NSTimer *)timer forMode:(NSString *)mode;

- (void)addPort:(NSPort *)aPort forMode:(NSString *)mode;
- (void)removePort:(NSPort *)aPort forMode:(NSString *)mode;

- (NSDate *)limitDateForMode:(NSString *)mode;
- (void)acceptInputForMode:(NSString *)mode beforeDate:(NSDate *)limitDate;

- (void)run; 
- (void)runUntilDate:(NSDate *)limitDate;
- (Bool)runMode:(NSString *)mode beforeDate:(NSDate *)limitDate;

#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))
- (void)configureAsServer NS_DEPRECATED(10_0, 10_5, 2_0, 2_0);
#endif

	- (void)performSelector:(SEL)aSelector target:(id)target argument:(id)arg order:(NSUInteger)order modes:(Array<> *)modes;
	- (void)cancelPerformSelector:(SEL)aSelector target:(id)target argument:(id)arg;
	- (void)cancelPerformSelectorsWithTarget:(id)target;
}

/**************** 	Delayed perform	 ******************/

extern class NSObject (NSDelayedPerforming)

- (void)performSelector:(SEL)aSelector withObject:(id)anArgument afterDelay:(NSTimeInterval)delay inModes:(Array<> *)modes;
- (void)performSelector:(SEL)aSelector withObject:(id)anArgument afterDelay:(NSTimeInterval)delay;
+ (void)cancelPreviousPerformRequestsWithTarget:(id)aTarget selector:(SEL)aSelector object:(id)anArgument;
+ (void)cancelPreviousPerformRequestsWithTarget:(id)aTarget;

}
