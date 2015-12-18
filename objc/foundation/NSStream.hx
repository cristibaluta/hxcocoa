package objc.foundation;


@:framework("Foundation")
extern class NSStream {

	//Constants

	//Static Methods
	public function outputStreamToMemory():Dynamic;
	public function outputStreamWithURL( url:NSURL,  shouldAppend:Bool):Dynamic;
	public function inputStreamWithFileAtPath( path:String):Dynamic;
	public function getStreamsToHost( host:NSHost,  port:Int,  inputStream:NSInputStream*,  outputStream:NSOutputStream*):Void;
	public function outputStreamToBuffer( buffer:uint8_t,  capacity:Int):Dynamic;
	public function outputStreamToFileAtPath( path:String,  shouldAppend:Bool):Dynamic;
	public function inputStreamWithURL( url:NSURL):Dynamic;
	public function inputStreamWithData( data:NSData):Dynamic;

	//Properties

	//Methods
	public function streamStatus():NSStreamStatus;
	public function hasBytesAvailable():Bool;
	public function initWithFileAtPath( path:String):Dynamic;
	public function initToFileAtPath( path:String,  shouldAppend:Bool):Dynamic;
	public function stream( aStream:NSStream,  eventCode:NSStreamEvent):Void;
	public function scheduleInRunLoop( aRunLoop:NSRunLoop,  mode:String):Void;
	public function close():Void;
	public function streamError():NSError;
	public function propertyForKey( key:String):Dynamic;
	public function setProperty( property:Dynamic,  key:String):Bool;
	public function hasSpaceAvailable():Bool;
	public function open():Void;
	public function initWithData( data:NSData):Dynamic;
	public function delegate():id<NSStreamDelegate>;
	public function setDelegate( delegate:id<NSStreamDelegate>):Void;
	public function removeFromRunLoop( aRunLoop:NSRunLoop,  mode:String):Void;
	public function write( buffer:constuint8_t,  len:Int):Int;
	public function initToBuffer( buffer:uint8_t,  capacity:Int):Dynamic;
	public function read( buffer:uint8_t,  len:Int):Int;
	public function getBuffer( buffer:uint8_t*,  len:Int):Bool;
	public function initToMemory():Dynamic;
	public function initWithURL( url:NSURL):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public function initWithURL1( url:NSURL,  shouldAppend:Bool):Dynamic;
}

extern enum NSStreamStatus
{
	NSStreamStatusNotOpen;
	NSStreamStatusOpening;
	NSStreamStatusOpen;
	NSStreamStatusReading;
	NSStreamStatusWriting;
	NSStreamStatusAtEnd;
	NSStreamStatusClosed;
	NSStreamStatusError;
}

extern enum NSStreamEvent
{
	NSStreamEventNone;
	NSStreamEventOpenCompleted;
	NSStreamEventHasBytesAvailable;
	NSStreamEventHasSpaceAvailable;
	NSStreamEventErrorOccurred;
	NSStreamEventEndEncountered;
}

/*	NSStream.h
        Copyright (c) 2003-2012, Apple Inc. All rights reserved
*/

package objc.foundation;

@class NSData, NSDictionary, NSError, NSHost, NSInputStream, NSOutputStream, NSRunLoop, NSString, NSURL;
@protocol NSStreamDelegate;

typedef NS_ENUM(NSUInteger, NSStreamStatus) {
    NSStreamStatusNotOpen = 0,
    NSStreamStatusOpening = 1,
    NSStreamStatusOpen = 2,
    NSStreamStatusReading = 3,
    NSStreamStatusWriting = 4,
    NSStreamStatusAtEnd = 5,
    NSStreamStatusClosed = 6,
    NSStreamStatusError = 7
};

typedef NS_OPTIONS(NSUInteger, NSStreamEvent) {
    NSStreamEventNone = 0,
    NSStreamEventOpenCompleted = 1UL << 0,
    NSStreamEventHasBytesAvailable = 1UL << 1,
    NSStreamEventHasSpaceAvailable = 1UL << 2,
    NSStreamEventErrorOccurred = 1UL << 3,
    NSStreamEventEndEncountered = 1UL << 4
};

// NSStream is an abstract class encapsulating the common API to NSInputStream and NSOutputStream.
// Subclassers of NSInputStream and NSOutputStream must also implement these methods.
extern class NSStream extends NSObject
public function open;
public function close;

- (id <NSStreamDelegate>)delegate;
public function setDelegate:(id <NSStreamDelegate>)delegate;
    // By default, a stream is its own delegate, and subclassers of NSInputStream and NSOutputStream must maintain this contract. [someStream setDelegate:nil] must restore this behavior. As usual, delegates are not retained.

- (id)propertyForKey:(NSString *)key;
- (Bool)setProperty:(id)property forKey:(NSString *)key;

public function scheduleInRunLoop:(NSRunLoop *)aRunLoop forMode:(NSString *)mode;
public function removeFromRunLoop:(NSRunLoop *)aRunLoop forMode:(NSString *)mode;

- (NSStreamStatus)streamStatus;
- (NSError *)streamError;
}

// NSInputStream is an abstract class representing the base functionality of a read stream.
// Subclassers are required to implement these methods.
extern class NSInputStream extends NSStream
- (Int)read:(uint8_t *)buffer maxLength:(NSUInteger)len;
    // reads up to length bytes into the supplied buffer, which must be at least of size len. Returns the actual number of bytes read.

- (Bool)getBuffer:(uint8_t **)buffer length:(NSUInteger *)len;
    // returns in O(1) a pointer to the buffer in 'buffer' and by reference in 'len' how many bytes are available. This buffer is only valid until the next stream operation. Subclassers may return NO for this if it is not appropriate for the stream type. This may return NO if the buffer is not available.

- (Bool)hasBytesAvailable;
    // returns YES if the stream has bytes available or if it impossible to tell without actually doing the read.
}

// NSOutputStream is an abstract class representing the base functionality of a write stream.
// Subclassers are required to implement these methods.
extern class NSOutputStream extends NSStream
- (Int)write:(const uint8_t *)buffer maxLength:(NSUInteger)len;
    // writes the bytes from the specified buffer to the stream up to len bytes. Returns the number of bytes actually written.

- (Bool)hasSpaceAvailable;
    // returns YES if the stream can be written to or if it is impossible to tell without actually doing the write.
}

#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))
extern class NSStream (NSSocketStreamCreationExtensions)
+ (void)getStreamsToHost:(NSHost *)host port:(Int)port inputStream:(NSInputStream **)inputStream outputStream:(NSOutputStream **)outputStream;
}
#endif

// The NSInputStreamExtensions category contains additional initializers and convenience routines for dealing with NSInputStreams.
extern class NSInputStream (NSInputStreamExtensions)
- (id)initWithData:(NSData *)data;
- (id)initWithFileAtPath:(NSString *)path;
- (id)initWithURL:(NSURL *)url NS_AVAILABLE(10_6, 4_0);

+ (id)inputStreamWithData:(NSData *)data;
+ (id)inputStreamWithFileAtPath:(NSString *)path;
+ (id)inputStreamWithURL:(NSURL *)url NS_AVAILABLE(10_6, 4_0);
}

// The NSOutputStreamExtensions category contains additional initializers and convenience routines for dealing with NSOutputStreams.
extern class NSOutputStream (NSOutputStreamExtensions)
- (id)initToMemory;
- (id)initToBuffer:(uint8_t *)buffer capacity:(NSUInteger)capacity;
- (id)initToFileAtPath:(NSString *)path append:(Bool)shouldAppend;
- (id)initWithURL:(NSURL *)url append:(Bool)shouldAppend NS_AVAILABLE(10_6, 4_0);

+ (id)outputStreamToMemory;
+ (id)outputStreamToBuffer:(uint8_t *)buffer capacity:(NSUInteger)capacity;
+ (id)outputStreamToFileAtPath:(NSString *)path append:(Bool)shouldAppend;
+ (id)outputStreamWithURL:(NSURL *)url append:(Bool)shouldAppend NS_AVAILABLE(10_6, 4_0);
}

@protocol NSStreamDelegate <NSObject>
@optional
public function stream:(NSStream *)aStream handleEvent:(NSStreamEvent)eventCode;
}

// NSString constants for the propertyForKey/setProperty:forKey: API
// String constants for the setting of the socket security level.
FOUNDATION_EXPORT NSString * const NSStreamSocketSecurityLevelKey		NS_AVAILABLE(10_3, 2_0);	// use this as the key for setting one of the following values for the security level of the target stream.

FOUNDATION_EXPORT NSString * const NSStreamSocketSecurityLevelNone		NS_AVAILABLE(10_3, 2_0);
FOUNDATION_EXPORT NSString * const NSStreamSocketSecurityLevelSSLv2		NS_AVAILABLE(10_3, 2_0);
FOUNDATION_EXPORT NSString * const NSStreamSocketSecurityLevelSSLv3		NS_AVAILABLE(10_3, 2_0);
FOUNDATION_EXPORT NSString * const NSStreamSocketSecurityLevelTLSv1		NS_AVAILABLE(10_3, 2_0);
FOUNDATION_EXPORT NSString * const NSStreamSocketSecurityLevelNegotiatedSSL	NS_AVAILABLE(10_3, 2_0);

FOUNDATION_EXPORT NSString * const NSStreamSOCKSProxyConfigurationKey		NS_AVAILABLE(10_3, 2_0);	// Value is an NSDictionary containing the key/value pairs below. The dictionary returned from SystemConfiguration for SOCKS proxies will work without alteration.

FOUNDATION_EXPORT NSString * const NSStreamSOCKSProxyHostKey			NS_AVAILABLE(10_3, 2_0);
    // Value is an NSString
FOUNDATION_EXPORT NSString * const NSStreamSOCKSProxyPortKey			NS_AVAILABLE(10_3, 2_0);
    // Value is an NSNumber
FOUNDATION_EXPORT NSString * const NSStreamSOCKSProxyVersionKey		NS_AVAILABLE(10_3, 2_0);
    // Value is one of NSStreamSOCKSProxyVersion4 or NSStreamSOCKSProxyVersion5
FOUNDATION_EXPORT NSString * const NSStreamSOCKSProxyUserKey			NS_AVAILABLE(10_3, 2_0);
    // Value is an NSString
FOUNDATION_EXPORT NSString * const NSStreamSOCKSProxyPasswordKey		NS_AVAILABLE(10_3, 2_0);
    // Value is an NSString

FOUNDATION_EXPORT NSString * const NSStreamSOCKSProxyVersion4			NS_AVAILABLE(10_3, 2_0);
    // Value for NSStreamSOCKProxyVersionKey
FOUNDATION_EXPORT NSString * const NSStreamSOCKSProxyVersion5			NS_AVAILABLE(10_3, 2_0);
    // Value for NSStreamSOCKProxyVersionKey

FOUNDATION_EXPORT NSString * const NSStreamDataWrittenToMemoryStreamKey	NS_AVAILABLE(10_3, 2_0);
    // Key for obtaining the data written to a memory stream.

FOUNDATION_EXPORT NSString * const NSStreamFileCurrentOffsetKey		NS_AVAILABLE(10_3, 2_0);
    // Value is an NSNumber representing the current absolute offset of the stream.

// NSString constants for error domains.
FOUNDATION_EXPORT NSString * const NSStreamSocketSSLErrorDomain			NS_AVAILABLE(10_3, 2_0);
    // SSL errors are to be interpreted via <Security/SecureTransport.h>
FOUNDATION_EXPORT NSString * const NSStreamSOCKSErrorDomain			NS_AVAILABLE(10_3, 2_0);

// Property key to specify the type of service for the stream.  This
// allows the system to properly handle the request with respect to
// routing, suspension behavior and other networking related attributes
// appropriate for the given service type.  The service types supported
// are documented below.
FOUNDATION_EXPORT NSString * const NSStreamNetworkServiceType		    NS_AVAILABLE(10_7, 4_0);
// Supported network service types:
FOUNDATION_EXPORT NSString * const NSStreamNetworkServiceTypeVoIP	    NS_AVAILABLE(10_7, 4_0);
FOUNDATION_EXPORT NSString * const NSStreamNetworkServiceTypeVideo	    NS_AVAILABLE(10_7, 5_0);
FOUNDATION_EXPORT NSString * const NSStreamNetworkServiceTypeBackground	    NS_AVAILABLE(10_7, 5_0);
FOUNDATION_EXPORT NSString * const NSStreamNetworkServiceTypeVoice	    NS_AVAILABLE(10_7, 5_0);

