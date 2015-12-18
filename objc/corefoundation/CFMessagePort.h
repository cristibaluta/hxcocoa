/*	CFMessagePort.h
	Copyright (c) 1998-2012, Apple Inc. All rights reserved.
*/

#if !defined(__COREFOUNDATION_CFMESSAGEPORT__)
#define __COREFOUNDATION_CFMESSAGEPORT__ 1

#include <CoreFoundation/CFString.h>
#include <CoreFoundation/CFRunLoop.h>
#include <CoreFoundation/CFData.h>
#include <dispatch/dispatch.h>

CF_EXTERN_C_BEGIN

typedef struct __CFMessagePort * CFMessagePortRef;

enum {
    kCFMessagePortSuccess = 0,
    kCFMessagePortSendTimeout = -1,
    kCFMessagePortReceiveTimeout = -2,
    kCFMessagePortIsInvalid = -3,
    kCFMessagePortTransportError = -4,
    kCFMessagePortBecameInvalidError = -5
};

typedef struct {
    CFIndex	version;
    void *	info;
    const void *(*retain)(const void *info);
    void	(*release)(const void *info);
    CFStringRef	(*copyDescription)(const void *info);
} CFMessagePortContext;

typedef CFDataRef (*CFMessagePortCallBack)(CFMessagePortRef local, SInt32 msgid, CFDataRef data, void *info);
/* If callout wants to keep a hold of the data past the return of the callout, it must COPY the data. This includes the case where the data is given to some routine which _might_ keep a hold of it; System will release returned CFData. */
typedef void (*CFMessagePortInvalidationCallBack)(CFMessagePortRef ms, void *info);

	@:c public static function  CFTypeID	CFMessagePortGetTypeID(void);

	@:c public static function  CFMessagePortRef	CFMessagePortCreateLocal(CFAllocatorRef allocator, CFStringRef name, CFMessagePortCallBack callout, CFMessagePortContext *context, Boolean *shouldFreeInfo);
	@:c public static function  CFMessagePortRef	CFMessagePortCreateRemote(CFAllocatorRef allocator, CFStringRef name);

	@:c public static function  Boolean	CFMessagePortIsRemote(CFMessagePortRef ms);
	@:c public static function  CFStringRef	CFMessagePortGetName(CFMessagePortRef ms);
	@:c public static function  Boolean	CFMessagePortSetName(CFMessagePortRef ms, CFStringRef newName);
	@:c public static function  void		CFMessagePortGetContext(CFMessagePortRef ms, CFMessagePortContext *context);
	@:c public static function  void		CFMessagePortInvalidate(CFMessagePortRef ms);
	@:c public static function  Boolean	CFMessagePortIsValid(CFMessagePortRef ms);
	@:c public static function  CFMessagePortInvalidationCallBack CFMessagePortGetInvalidationCallBack(CFMessagePortRef ms);
	@:c public static function  void CFMessagePortSetInvalidationCallBack(CFMessagePortRef ms, CFMessagePortInvalidationCallBack callout);

/* NULL replyMode argument means no return value expected, dont wait for it */
	@:c public static function  SInt32	CFMessagePortSendRequest(CFMessagePortRef remote, SInt32 msgid, CFDataRef data, CFTimeInterval sendTimeout, CFTimeInterval rcvTimeout, CFStringRef replyMode, CFDataRef *returnData);

	@:c public static function  CFRunLoopSourceRef	CFMessagePortCreateRunLoopSource(CFAllocatorRef allocator, CFMessagePortRef local, CFIndex order);

	@:c public static function  void CFMessagePortSetDispatchQueue(CFMessagePortRef ms, dispatch_queue_t queue) CF_AVAILABLE(10_6, 4_0);

CF_EXTERN_C_END

#endif /* ! __COREFOUNDATION_CFMESSAGEPORT__ */

