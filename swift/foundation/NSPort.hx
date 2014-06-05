package swift.foundation;


extern class NSPort implements NSCopying implements NSCoding
{

	//Constants

	//Static Methods
	public function port():NSPort;
	public function portWithMachPort( machPort:uint32_t):NSPort;
	//@:overload !!NEED CUSTOM META DATA !!
	public function portWithMachPort1( machPort:uint32_t,  f:Int):NSPort;

	//Properties

	//Methods
	public function reservedSpaceLength():Int;
	public function handlePortMessage( message:NSPortMessage):Void;
	public function machPort():uint32_t;
	public function initWithProtocolFamily( family:Int,  type:Int,  protocol:Int,  address:NSData):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public function initWithProtocolFamily1( family:Int,  type:Int,  protocol:Int,  sock:NSSocketNativeHandle):Dynamic;
	public function socket():NSSocketNativeHandle;
	public function removeConnection( conn:NSConnection,  runLoop:NSRunLoop,  mode:String):Void;
	public function scheduleInRunLoop( runLoop:NSRunLoop,  mode:String):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public function scheduleInRunLoop1( runLoop:NSRunLoop,  mode:String):Void;
	public function sendBeforeDate( limitDate:Date,  components:NSMutableArray,  receivePort:NSPort,  headerSpaceReserved:Int):Bool;
	//@:overload !!NEED CUSTOM META DATA !!
	public function sendBeforeDate1( limitDate:Date,  msgID:Int,  components:NSMutableArray,  receivePort:NSPort,  headerSpaceReserved:Int):Bool;
	public function initWithTCPPort( port:unsignedshort):Dynamic;
	public function initRemoteWithTCPPort( port:unsignedshort,  hostName:String):Dynamic;
	public function protocolFamily():Int;
	public function invalidate():Void;
	public function protocol():Int;
	public function setDelegate( anObject:id<NSPortDelegate>):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public function setDelegate1( anObject:id<NSMachPortDelegate>):Void;
	public function delegate():id<NSPortDelegate>;
	//@:overload !!NEED CUSTOM META DATA !!
	public function delegate1():id<NSMachPortDelegate>;
	public function removeFromRunLoop( runLoop:NSRunLoop,  mode:String):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public function removeFromRunLoop1( runLoop:NSRunLoop,  mode:String):Void;
	public function initRemoteWithProtocolFamily( family:Int,  type:Int,  protocol:Int,  address:NSData):Dynamic;
	public function socketType():Int;
	public function handleMachMessage( msg:Dynamic):Void;
	public function addConnection( conn:NSConnection,  runLoop:NSRunLoop,  mode:String):Void;
	public function isValid():Bool;
	public function initWithMachPort( machPort:uint32_t):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public function initWithMachPort1( machPort:uint32_t,  f:Int):Dynamic;
	public function init():Dynamic;
	public function address():NSData;
}

/*	NSPort.h
	Copyright (c) 1994-2012, Apple Inc. All rights reserved.
*/

package swift.foundation;

typedef int NSSocketNativeHandle;

@class NSRunLoop, NSMutableArray, NSDate;
@class NSConnection, NSPortMessage;
@class NSData;
@protocol NSPortDelegate, NSMachPortDelegate;

FOUNDATION_EXPORT NSString * const NSPortDidBecomeInvalidNotification;

extern class NSPort extends NSObject implements NSCopying, NSCoding>

// For backwards compatibility on Mach, +allocWithZone: returns
// an instance of the NSMachPort class when sent to the NSPort
// class.  Otherwise, it returns an instance of a concrete
// subclass which can be used for messaging between threads
// or processes on the local machine.

+ (NSPort *)port;

public function invalidate;
- (Bool)isValid;

public function setDelegate:(id <NSPortDelegate>)anObject;
- (id <NSPortDelegate>)delegate;

// These two methods should be implemented by subclasses
// to setup monitoring of the port when added to a run loop,
// and stop monitoring if needed when removed;
// These methods should not be called directly!
public function scheduleInRunLoop:(NSRunLoop *)runLoop forMode:(NSString *)mode;
public function removeFromRunLoop:(NSRunLoop *)runLoop forMode:(NSString *)mode;

// DO Transport API; subclassers should implement these methods
- (NSUInteger)reservedSpaceLength;	// default is 0
- (Bool)sendBeforeDate:(NSDate *)limitDate components:(NSMutableArray *)components from:(NSPort *) receivePort reserved:(NSUInteger)headerSpaceReserved;
- (Bool)sendBeforeDate:(NSDate *)limitDate msgid:(NSUInteger)msgID components:(NSMutableArray *)components from:(NSPort *)receivePort reserved:(NSUInteger)headerSpaceReserved;
	// The components array consists of a series of instances
	// of some subclass of NSData, and instances of some
	// subclass of NSPort; since one subclass of NSPort does
	// not necessarily know how to transport an instance of
	// another subclass of NSPort (or could do it even if it
	// knew about the other subclass), all of the instances
	// of NSPort in the components array and the 'receivePort'
	// argument MUST be of the same subclass of NSPort that
	// receives this message.  If multiple DO transports are
	// being used in the same program, this requires some care.

#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)) || (TARGET_OS_WIN32)
public function addConnection:(NSConnection *)conn toRunLoop:(NSRunLoop *)runLoop forMode:(NSString *)mode;
public function removeConnection:(NSConnection *)conn fromRunLoop:(NSRunLoop *)runLoop forMode:(NSString *)mode;
	// The default implementation of these two methods is to
	// simply add the receiving port to the run loop in the
	// given mode.  Subclassers need not override these methods,
	// but can if they need to do extra work.
#endif

}

@protocol NSPortDelegate <NSObject>
@optional

public function handlePortMessage:(NSPortMessage *)message;
	// This is the delegate method that subclasses should send
	// to their delegates, unless the subclass has something
	// more specific that it wants to try to send first
}

#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)) || (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)

NS_AUTOMATED_REFCOUNT_WEAK_UNAVAILABLE 
extern class NSMachPort extends NSPort {
    @private
    id _delegate;
    NSUInteger _flags;
    uint32_t _machPort;
    NSUInteger _reserved;
}

+ (NSPort *)portWithMachPort:(uint32_t)machPort;
- (id)initWithMachPort:(uint32_t)machPort;	// designated initializer

public function setDelegate:(id <NSMachPortDelegate>)anObject;
- (id <NSMachPortDelegate>)delegate;

enum {
    NSMachPortDeallocateNone = 0,
    NSMachPortDeallocateSendRight = (1UL << 0),
    NSMachPortDeallocateReceiveRight = (1UL << 1)
} NS_ENUM_AVAILABLE(10_5, 2_0);

+ (NSPort *)portWithMachPort:(uint32_t)machPort options:(NSUInteger)f NS_AVAILABLE(10_5, 2_0);
- (id)initWithMachPort:(uint32_t)machPort options:(NSUInteger)f NS_AVAILABLE(10_5, 2_0);

- (uint32_t)machPort;

public function scheduleInRunLoop:(NSRunLoop *)runLoop forMode:(NSString *)mode;
public function removeFromRunLoop:(NSRunLoop *)runLoop forMode:(NSString *)mode;
	// If you subclass NSMachPort, you have to override these 2
	// methods from NSPort; since this is complicated, subclassing
	// NSMachPort is not recommended

}

@protocol NSMachPortDelegate <NSPortDelegate>
@optional

// Delegates are sent this if they respond, otherwise they
// are sent handlePortMessage:; argument is the raw Mach message
public function handleMachMessage:(void *)msg;

}

#endif

// A subclass of NSPort which can be used for local
// message sending on all platforms.
NS_AUTOMATED_REFCOUNT_WEAK_UNAVAILABLE 
extern class NSMessagePort extends NSPort {
    @private
    void * __strong _port;
    id _delegate;
}

}

#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)) || TARGET_OS_WIN32 || TARGET_IPHONE_SIMULATOR

// A subclass of NSPort which can be used for remote
// message sending on all platforms.

extern class NSSocketPort extends NSPort {
    @private
    void * __strong _receiver;
    id _connectors;
    void * __strong _loops;
    void * __strong _data;
    id _signature;
    id _delegate;
    id _lock;
    NSUInteger _maxSize;
    NSUInteger _useCount;
    NSUInteger _reserved;
}

- (id)init;
- (id)initWithTCPPort:(unsigned short)port;
- (id)initWithProtocolFamily:(int)family socketType:(int)type protocol:(int)protocol address:(NSData *)address;
- (id)initWithProtocolFamily:(int)family socketType:(int)type protocol:(int)protocol socket:(NSSocketNativeHandle)sock;
- (id)initRemoteWithTCPPort:(unsigned short)port host:(NSString *)hostName;
- (id)initRemoteWithProtocolFamily:(int)family socketType:(int)type protocol:(int)protocol address:(NSData *)address;
- (int)protocolFamily;
- (int)socketType;
- (int)protocol;
- (NSData *)address;
- (NSSocketNativeHandle)socket;

}

#endif


