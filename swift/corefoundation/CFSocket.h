/*	CFSocket.h
	Copyright (c) 1999-2012, Apple Inc.  All rights reserved.
*/

#if !defined(__COREFOUNDATION_CFSOCKET__)
#define __COREFOUNDATION_CFSOCKET__ 1

#include <CoreFoundation/CFRunLoop.h>
#include <CoreFoundation/CFData.h>

CF_EXTERN_C_BEGIN

typedef struct __CFSocket * CFSocketRef;

/* A CFSocket contains a native socket within a structure that can 
be used to read from the socket in the background and make the data
thus read available using a runloop source.  The callback used for
this may be of three types, as specified by the callBackTypes
argument when creating the CFSocket.

If kCFSocketReadCallBack is used, then data will not be
automatically read, but the callback will be called when data
is available to be read, or a new child socket is waiting to be
accepted.
    
If kCFSocketAcceptCallBack is used, then new child sockets will be
accepted and passed to the callback, with the data argument being
a pointer to a CFSocketNativeHandle.  This is usable only with
connection rendezvous sockets.

If kCFSocketDataCallBack is used, then data will be read in chunks
in the background and passed to the callback, with the data argument
being a CFDataRef.

These three types are mutually exclusive, but any one of them may
have kCFSocketConnectCallBack added to it, if the socket will be
used to connect in the background.  Connect in the background occurs
if CFSocketConnectToAddress is called with a negative timeout
value, in which case the call returns immediately, and a
kCFSocketConnectCallBack is generated when the connect finishes.
In this case the data argument is either NULL, or a pointer to
an SInt32 error code if the connect failed.  kCFSocketConnectCallBack
will never be sent more than once for a given socket.

The callback types may also have kCFSocketWriteCallBack added to
them, if large amounts of data are to be sent rapidly over the 
socket and notification is desired when there is space in the
kernel buffers so that the socket is writable again.  

With a connection-oriented socket, if the connection is broken from the
other end, then one final kCFSocketReadCallBack or kCFSocketDataCallBack 
will occur.  In the case of kCFSocketReadCallBack, the underlying socket 
will have 0 bytes available to read.  In the case of kCFSocketDataCallBack,
the data argument will be a CFDataRef of length 0.

There are socket flags that may be set to control whether callbacks of 
a given type are automatically reenabled after they are triggered, and 
whether the underlying native socket will be closed when the CFSocket
is invalidated.  By default read, accept, and data callbacks are 
automatically reenabled; write callbacks are not, and connect callbacks
may not be, since they are sent once only.  Be careful about automatically
reenabling read and write callbacks, since this implies that the 
callbacks will be sent repeatedly if the socket remains readable or
writable respectively.  Be sure to set these flags only for callbacks
that your CFSocket actually possesses; the result of setting them for
other callback types is undefined.

Individual callbacks may also be enabled and disabled manually, whether 
they are automatically reenabled or not.  If they are not automatically 
reenabled, then they will need to be manually reenabled when the callback 
is ready to be received again (and not sooner).  Even if they are 
automatically reenabled, there may be occasions when it will be useful
to be able to manually disable them temporarily and then reenable them.
Be sure to enable and disable only callbacks that your CFSocket actually
possesses; the result of enabling and disabling other callback types is
undefined.

By default the underlying native socket will be closed when the CFSocket 
is invalidated, but it will not be if kCFSocketCloseOnInvalidate is 
turned off.  This can be useful in order to destroy a CFSocket but 
continue to use the underlying native socket.  The CFSocket must 
still be invalidated when it will no longer be used.  Do not in 
either case close the underlying native socket without invalidating 
the CFSocket.

Addresses are stored as CFDatas containing a struct sockaddr
appropriate for the protocol family; make sure that all fields are
filled in properly when passing in an address.  

*/

/* Values for CFSocketError */
typedef CF_ENUM(CFIndex, CFSocketError) {
    kCFSocketSuccess = 0,
    kCFSocketError = -1L,
    kCFSocketTimeout = -2L
};

typedef struct {
    SInt32	protocolFamily;
    SInt32	socketType;
    SInt32	protocol;
    CFDataRef	address;
} CFSocketSignature;

/* Values for CFSocketCallBackType */
typedef CF_OPTIONS(CFOptionFlags, CFSocketCallBackType) {
    kCFSocketNoCallBack = 0,
    kCFSocketReadCallBack = 1,
    kCFSocketAcceptCallBack = 2,
    kCFSocketDataCallBack = 3,
    kCFSocketConnectCallBack = 4,
    kCFSocketWriteCallBack = 8
};

/* Socket flags */
enum {
    kCFSocketAutomaticallyReenableReadCallBack = 1,
    kCFSocketAutomaticallyReenableAcceptCallBack = 2,
    kCFSocketAutomaticallyReenableDataCallBack = 3,
    kCFSocketAutomaticallyReenableWriteCallBack = 8,
    kCFSocketLeaveErrors CF_ENUM_AVAILABLE(10_5, 2_0) = 64,
    kCFSocketCloseOnInvalidate = 128
};

typedef void (*CFSocketCallBack)(CFSocketRef s, CFSocketCallBackType type, CFDataRef address, const void *data, void *info);
/* If the callback wishes to keep hold of address or data after the point that it returns, then it must copy them. */

typedef struct {
    CFIndex	version;
    void *	info;
    const void *(*retain)(const void *info);
    void	(*release)(const void *info);
    CFStringRef	(*copyDescription)(const void *info);
} CFSocketContext;

#if TARGET_OS_WIN32
typedef uintptr_t CFSocketNativeHandle;
#else
typedef int CFSocketNativeHandle;
#endif

	@:c public static function  CFTypeID	CFSocketGetTypeID(void);

	@:c public static function  CFSocketRef	CFSocketCreate(CFAllocatorRef allocator, SInt32 protocolFamily, SInt32 socketType, SInt32 protocol, CFOptionFlags callBackTypes, CFSocketCallBack callout, const CFSocketContext *context);
	@:c public static function  CFSocketRef	CFSocketCreateWithNative(CFAllocatorRef allocator, CFSocketNativeHandle sock, CFOptionFlags callBackTypes, CFSocketCallBack callout, const CFSocketContext *context);
	@:c public static function  CFSocketRef	CFSocketCreateWithSocketSignature(CFAllocatorRef allocator, const CFSocketSignature *signature, CFOptionFlags callBackTypes, CFSocketCallBack callout, const CFSocketContext *context);
/* CFSocketCreateWithSocketSignature() creates a socket of the requested type and binds its address (using CFSocketSetAddress()) to the requested address.  If this fails, it returns NULL. */
	@:c public static function  CFSocketRef	CFSocketCreateConnectedToSocketSignature(CFAllocatorRef allocator, const CFSocketSignature *signature, CFOptionFlags callBackTypes, CFSocketCallBack callout, const CFSocketContext *context, CFTimeInterval timeout);
/* CFSocketCreateConnectedToSocketSignature() creates a socket suitable for connecting to the requested type and address, and connects it (using CFSocketConnectToAddress()).  If this fails, it returns NULL. */

	@:c public static function  CFSocketError	CFSocketSetAddress(CFSocketRef s, CFDataRef address);
	@:c public static function  CFSocketError	CFSocketConnectToAddress(CFSocketRef s, CFDataRef address, CFTimeInterval timeout);
	@:c public static function  void		CFSocketInvalidate(CFSocketRef s);

	@:c public static function  Boolean	CFSocketIsValid(CFSocketRef s);
	@:c public static function  CFDataRef	CFSocketCopyAddress(CFSocketRef s);
	@:c public static function  CFDataRef	CFSocketCopyPeerAddress(CFSocketRef s);
	@:c public static function  void		CFSocketGetContext(CFSocketRef s, CFSocketContext *context);
	@:c public static function  CFSocketNativeHandle	CFSocketGetNative(CFSocketRef s);

	@:c public static function  CFRunLoopSourceRef	CFSocketCreateRunLoopSource(CFAllocatorRef allocator, CFSocketRef s, CFIndex order);

	@:c public static function  CFOptionFlags	CFSocketGetSocketFlags(CFSocketRef s);
	@:c public static function  void		CFSocketSetSocketFlags(CFSocketRef s, CFOptionFlags flags);
	@:c public static function  void		CFSocketDisableCallBacks(CFSocketRef s, CFOptionFlags callBackTypes);
	@:c public static function  void		CFSocketEnableCallBacks(CFSocketRef s, CFOptionFlags callBackTypes);


/* For convenience, a function is provided to send data using the socket with a timeout.  The timeout will be used only if the specified value is positive.  The address should be left NULL if the socket is already connected. */
	@:c public static function  CFSocketError	CFSocketSendData(CFSocketRef s, CFDataRef address, CFDataRef data, CFTimeInterval timeout);

/* Generic name registry functionality (CFSocketRegisterValue, 
CFSocketCopyRegisteredValue) allows the registration of any property
list type.  Functions specific to CFSockets (CFSocketRegisterSocketData,
CFSocketCopyRegisteredSocketData) register a CFData containing the
components of a socket signature (protocol family, socket type,
protocol, and address).  In each function the nameServerSignature
may be NULL, or any component of it may be 0, to use default values
(TCP, INADDR_LOOPBACK, port as set).  Name registration servers might
not allow registration with other than TCP and INADDR_LOOPBACK.
The actual address of the server responding to a query may be obtained
by using the nameServerAddress argument.  This address, the address
returned by CFSocketCopyRegisteredSocketSignature, and the value
returned by CFSocketCopyRegisteredValue must (if non-null) be released
by the caller.  CFSocketUnregister removes any registration associated
with the specified name.
*/

	@:c public static function  CFSocketError	CFSocketRegisterValue(const CFSocketSignature *nameServerSignature, CFTimeInterval timeout, CFStringRef name, CFPropertyListRef value);
	@:c public static function  CFSocketError	CFSocketCopyRegisteredValue(const CFSocketSignature *nameServerSignature, CFTimeInterval timeout, CFStringRef name, CFPropertyListRef *value, CFDataRef *nameServerAddress);

	@:c public static function  CFSocketError	CFSocketRegisterSocketSignature(const CFSocketSignature *nameServerSignature, CFTimeInterval timeout, CFStringRef name, const CFSocketSignature *signature);
	@:c public static function  CFSocketError	CFSocketCopyRegisteredSocketSignature(const CFSocketSignature *nameServerSignature, CFTimeInterval timeout, CFStringRef name, CFSocketSignature *signature, CFDataRef *nameServerAddress);

	@:c public static function  CFSocketError	CFSocketUnregister(const CFSocketSignature *nameServerSignature, CFTimeInterval timeout, CFStringRef name);

	@:c public static function  void		CFSocketSetDefaultNameRegistryPortNumber(UInt16 port);
	@:c public static function  UInt16	CFSocketGetDefaultNameRegistryPortNumber(void);

/* Constants used in name registry server communications */
	@:c public static function  const CFStringRef kCFSocketCommandKey;
	@:c public static function  const CFStringRef kCFSocketNameKey;
	@:c public static function  const CFStringRef kCFSocketValueKey;
	@:c public static function  const CFStringRef kCFSocketResultKey;
	@:c public static function  const CFStringRef kCFSocketErrorKey;
	@:c public static function  const CFStringRef kCFSocketRegisterCommand;
	@:c public static function  const CFStringRef kCFSocketRetrieveCommand;

CF_EXTERN_C_END

#endif /* ! __COREFOUNDATION_CFSOCKET__ */

