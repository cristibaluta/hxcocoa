/*	CFRunLoop.h
	Copyright (c) 1998-2012, Apple Inc. All rights reserved.
*/

#if !defined(__COREFOUNDATION_CFRUNLOOP__)
#define __COREFOUNDATION_CFRUNLOOP__ 1

#include <CoreFoundation/CFBase.h>
#include <CoreFoundation/CFArray.h>
#include <CoreFoundation/CFDate.h>
#include <CoreFoundation/CFString.h>
#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)) || (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)
#include <mach/port.h>
#endif

CF_EXTERN_C_BEGIN

typedef struct __CFRunLoop * CFRunLoopRef;

typedef struct __CFRunLoopSource * CFRunLoopSourceRef;

typedef struct __CFRunLoopObserver * CFRunLoopObserverRef;

typedef struct __CFRunLoopTimer * CFRunLoopTimerRef;

/* Reasons for CFRunLoopRunInMode() to Return */
enum {
    kCFRunLoopRunFinished = 1,
    kCFRunLoopRunStopped = 2,
    kCFRunLoopRunTimedOut = 3,
    kCFRunLoopRunHandledSource = 4
};

/* Run Loop Observer Activities */
typedef CF_OPTIONS(CFOptionFlags, CFRunLoopActivity) {
    kCFRunLoopEntry = (1UL << 0),
    kCFRunLoopBeforeTimers = (1UL << 1),
    kCFRunLoopBeforeSources = (1UL << 2),
    kCFRunLoopBeforeWaiting = (1UL << 5),
    kCFRunLoopAfterWaiting = (1UL << 6),
    kCFRunLoopExit = (1UL << 7),
    kCFRunLoopAllActivities = 0x0FFFFFFFU
};

	@:c public static function  const CFStringRef kCFRunLoopDefaultMode;
	@:c public static function  const CFStringRef kCFRunLoopCommonModes;

	@:c public static function  CFTypeID CFRunLoopGetTypeID(void);

	@:c public static function  CFRunLoopRef CFRunLoopGetCurrent(void);
	@:c public static function  CFRunLoopRef CFRunLoopGetMain(void);

	@:c public static function  CFStringRef CFRunLoopCopyCurrentMode(CFRunLoopRef rl);

	@:c public static function  CFArrayRef CFRunLoopCopyAllModes(CFRunLoopRef rl);

	@:c public static function  void CFRunLoopAddCommonMode(CFRunLoopRef rl, CFStringRef mode);

	@:c public static function  CFAbsoluteTime CFRunLoopGetNextTimerFireDate(CFRunLoopRef rl, CFStringRef mode);

	@:c public static function  void CFRunLoopRun(void);
	@:c public static function  SInt32 CFRunLoopRunInMode(CFStringRef mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled);
	@:c public static function  Boolean CFRunLoopIsWaiting(CFRunLoopRef rl);
	@:c public static function  void CFRunLoopWakeUp(CFRunLoopRef rl);
	@:c public static function  void CFRunLoopStop(CFRunLoopRef rl);

#if __BLOCKS__
	@:c public static function  void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void (^block)(void)) CF_AVAILABLE(10_6, 4_0); 
#endif

	@:c public static function  Boolean CFRunLoopContainsSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFStringRef mode);
	@:c public static function  void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFStringRef mode);
	@:c public static function  void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFStringRef mode);

	@:c public static function  Boolean CFRunLoopContainsObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFStringRef mode);
	@:c public static function  void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFStringRef mode);
	@:c public static function  void CFRunLoopRemoveObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFStringRef mode);

	@:c public static function  Boolean CFRunLoopContainsTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFStringRef mode);
	@:c public static function  void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFStringRef mode);
	@:c public static function  void CFRunLoopRemoveTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFStringRef mode);

typedef struct {
    CFIndex	version;
    void *	info;
    const void *(*retain)(const void *info);
    void	(*release)(const void *info);
    CFStringRef	(*copyDescription)(const void *info);
    Boolean	(*equal)(const void *info1, const void *info2);
    CFHashCode	(*hash)(const void *info);
    void	(*schedule)(void *info, CFRunLoopRef rl, CFStringRef mode);
    void	(*cancel)(void *info, CFRunLoopRef rl, CFStringRef mode);
    void	(*perform)(void *info);
} CFRunLoopSourceContext;

typedef struct {
    CFIndex	version;
    void *	info;
    const void *(*retain)(const void *info);
    void	(*release)(const void *info);
    CFStringRef	(*copyDescription)(const void *info);
    Boolean	(*equal)(const void *info1, const void *info2);
    CFHashCode	(*hash)(const void *info);
#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)) || (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)
    mach_port_t	(*getPort)(void *info);
    void *	(*perform)(void *msg, CFIndex size, CFAllocatorRef allocator, void *info);
#else
    void *	(*getPort)(void *info);
    void	(*perform)(void *info);
#endif
} CFRunLoopSourceContext1;

	@:c public static function  CFTypeID CFRunLoopSourceGetTypeID(void);

	@:c public static function  CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context);

	@:c public static function  CFIndex CFRunLoopSourceGetOrder(CFRunLoopSourceRef source);
	@:c public static function  void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source);
	@:c public static function  Boolean CFRunLoopSourceIsValid(CFRunLoopSourceRef source);
	@:c public static function  void CFRunLoopSourceGetContext(CFRunLoopSourceRef source, CFRunLoopSourceContext *context);
	@:c public static function  void CFRunLoopSourceSignal(CFRunLoopSourceRef source);

typedef struct {
    CFIndex	version;
    void *	info;
    const void *(*retain)(const void *info);
    void	(*release)(const void *info);
    CFStringRef	(*copyDescription)(const void *info);
} CFRunLoopObserverContext;

typedef void (*CFRunLoopObserverCallBack)(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info);

	@:c public static function  CFTypeID CFRunLoopObserverGetTypeID(void);

	@:c public static function  CFRunLoopObserverRef CFRunLoopObserverCreate(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, CFRunLoopObserverCallBack callout, CFRunLoopObserverContext *context);
#if __BLOCKS__
	@:c public static function  CFRunLoopObserverRef CFRunLoopObserverCreateWithHandler(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, void (^block) (CFRunLoopObserverRef observer, CFRunLoopActivity activity)) CF_AVAILABLE(10_7, 5_0);
#endif

	@:c public static function  CFOptionFlags CFRunLoopObserverGetActivities(CFRunLoopObserverRef observer);
	@:c public static function  Boolean CFRunLoopObserverDoesRepeat(CFRunLoopObserverRef observer);
	@:c public static function  CFIndex CFRunLoopObserverGetOrder(CFRunLoopObserverRef observer);
	@:c public static function  void CFRunLoopObserverInvalidate(CFRunLoopObserverRef observer);
	@:c public static function  Boolean CFRunLoopObserverIsValid(CFRunLoopObserverRef observer);
	@:c public static function  void CFRunLoopObserverGetContext(CFRunLoopObserverRef observer, CFRunLoopObserverContext *context);

typedef struct {
    CFIndex	version;
    void *	info;
    const void *(*retain)(const void *info);
    void	(*release)(const void *info);
    CFStringRef	(*copyDescription)(const void *info);
} CFRunLoopTimerContext;

typedef void (*CFRunLoopTimerCallBack)(CFRunLoopTimerRef timer, void *info);

	@:c public static function  CFTypeID CFRunLoopTimerGetTypeID(void);

	@:c public static function  CFRunLoopTimerRef CFRunLoopTimerCreate(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, CFRunLoopTimerCallBack callout, CFRunLoopTimerContext *context);
#if __BLOCKS__
	@:c public static function  CFRunLoopTimerRef CFRunLoopTimerCreateWithHandler(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, void (^block) (CFRunLoopTimerRef timer)) CF_AVAILABLE(10_7, 5_0);
#endif

	@:c public static function  CFAbsoluteTime CFRunLoopTimerGetNextFireDate(CFRunLoopTimerRef timer);
	@:c public static function  void CFRunLoopTimerSetNextFireDate(CFRunLoopTimerRef timer, CFAbsoluteTime fireDate);
	@:c public static function  CFTimeInterval CFRunLoopTimerGetInterval(CFRunLoopTimerRef timer);
	@:c public static function  Boolean CFRunLoopTimerDoesRepeat(CFRunLoopTimerRef timer);
	@:c public static function  CFIndex CFRunLoopTimerGetOrder(CFRunLoopTimerRef timer);
	@:c public static function  void CFRunLoopTimerInvalidate(CFRunLoopTimerRef timer);
	@:c public static function  Boolean CFRunLoopTimerIsValid(CFRunLoopTimerRef timer);
	@:c public static function  void CFRunLoopTimerGetContext(CFRunLoopTimerRef timer, CFRunLoopTimerContext *context);

CF_EXTERN_C_END

#endif /* ! __COREFOUNDATION_CFRUNLOOP__ */

