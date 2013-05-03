/*	CFMachPort.h
	Copyright (c) 1998-2012, Apple Inc. All rights reserved.
*/

#if !defined(__COREFOUNDATION_CFMACHPORT__)
#define __COREFOUNDATION_CFMACHPORT__ 1

#include <CoreFoundation/CFRunLoop.h>
#include <mach/port.h>

CF_EXTERN_C_BEGIN

typedef struct __CFMachPort * CFMachPortRef;

typedef struct {
    CFIndex	version;
    void *	info;
    const void *(*retain)(const void *info);
    void	(*release)(const void *info);
    CFStringRef	(*copyDescription)(const void *info);
} CFMachPortContext;

typedef void (*CFMachPortCallBack)(CFMachPortRef port, void *msg, CFIndex size, void *info);
typedef void (*CFMachPortInvalidationCallBack)(CFMachPortRef port, void *info);

	@:c public static function  CFTypeID	CFMachPortGetTypeID(void);

	@:c public static function  CFMachPortRef	CFMachPortCreate(CFAllocatorRef allocator, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo);
	@:c public static function  CFMachPortRef	CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo);

	@:c public static function  mach_port_t	CFMachPortGetPort(CFMachPortRef port);
	@:c public static function  void		CFMachPortGetContext(CFMachPortRef port, CFMachPortContext *context);
	@:c public static function  void		CFMachPortInvalidate(CFMachPortRef port);
	@:c public static function  Boolean	CFMachPortIsValid(CFMachPortRef port);
	@:c public static function  CFMachPortInvalidationCallBack CFMachPortGetInvalidationCallBack(CFMachPortRef port);
	@:c public static function  void		CFMachPortSetInvalidationCallBack(CFMachPortRef port, CFMachPortInvalidationCallBack callout);

	@:c public static function  CFRunLoopSourceRef	CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order);

CF_EXTERN_C_END

#endif /* ! __COREFOUNDATION_CFMACHPORT__ */

