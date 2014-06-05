package swift.foundation;

typedef NSObject = swift.foundation.NSObject;

import swift.foundation.NSObjCRuntime;
import swift.foundation.NSData;
import swift.foundation.NSURL;
import swift.foundation.NSThread;

/*typedef NSObjCRuntime = swift.foundation.NSObjCRuntime;

typedef Array<> = swift.foundation.Array<>;
typedef NSAutoreleasePool = swift.foundation.NSAutoreleasePool;
typedef NSBundle = swift.foundation.NSBundle;
typedef NSByteOrder = swift.foundation.NSByteOrder;
typedef NSCalendar = swift.foundation.NSCalendar;
typedef NSCharacterSet = swift.foundation.NSCharacterSet;
typedef NSCoder = swift.foundation.NSCoder;
typedef NSData = swift.foundation.NSData;
typedef NSDate = swift.foundation.NSDate;
typedef NSDateFormatter = swift.foundation.NSDateFormatter;
typedef NSDecimal = swift.foundation.NSDecimal;
typedef NSDecimalNumber = swift.foundation.NSDecimalNumber;
typedef NSDictionary = swift.foundation.NSDictionary;
typedef NSEnumerator = swift.foundation.NSEnumerator;
typedef NSError = swift.foundation.NSError;
typedef NSException = swift.foundation.NSException;
typedef NSFileHandle = swift.foundation.NSFileHandle;
typedef NSFileManager = swift.foundation.NSFileManager;
typedef NSFormatter = swift.foundation.NSFormatter;
typedef NSHashTable = swift.foundation.NSHashTable;
typedef NSHTTPCookie = swift.foundation.NSHTTPCookie;
typedef NSHTTPCookieStorage = swift.foundation.NSHTTPCookieStorage;
typedef NSIndexPath = swift.foundation.NSIndexPath;
typedef NSIndexSet = swift.foundation.NSIndexSet;
typedef NSInvocation = swift.foundation.NSInvocation;
typedef NSJSONSerialization = swift.foundation.NSJSONSerialization;
typedef NSKeyValueCoding = swift.foundation.NSKeyValueCoding;
typedef NSKeyValueObserving = swift.foundation.NSKeyValueObserving;
typedef NSKeyedArchiver = swift.foundation.NSKeyedArchiver;
typedef NSLocale = swift.foundation.NSLocale;
typedef NSLock = swift.foundation.NSLock;
typedef NSMapTable = swift.foundation.NSMapTable;
typedef NSMethodSignature = swift.foundation.NSMethodSignature;
typedef NSNotification = swift.foundation.NSNotification;
typedef NSNotificationQueue = swift.foundation.NSNotificationQueue;
typedef NSNull = swift.foundation.NSNull;
typedef NSNumberFormatter = swift.foundation.NSNumberFormatter;
typedef NSObject = swift.foundation.NSObject;
typedef NSOperation = swift.foundation.NSOperation;
typedef NSOrderedSet = swift.foundation.NSOrderedSet;
typedef NSOrthography = swift.foundation.NSOrthography;
typedef NSPathUtilities = swift.foundation.NSPathUtilities;
typedef NSPointerArray = swift.foundation.NSPointerArray;
typedef NSPointerFunctions = swift.foundation.NSPointerFunctions;
typedef NSPort = swift.foundation.NSPort;
typedef NSProcessInfo = swift.foundation.NSProcessInfo;
typedef NSPropertyList = swift.foundation.NSPropertyList;
typedef NSProxy = swift.foundation.NSProxy;
typedef NSRange = swift.foundation.NSRange;
typedef NSRegularExpression = swift.foundation.NSRegularExpression;
typedef NSRunLoop = swift.foundation.NSRunLoop;
typedef NSScanner = swift.foundation.NSScanner;
typedef NSSet = swift.foundation.NSSet;
typedef NSSortDescriptor = swift.foundation.NSSortDescriptor;
typedef NSStream = swift.foundation.NSStream;
typedef NSString = swift.foundation.NSString;
typedef NSTextCheckingResult = swift.foundation.NSTextCheckingResult;
typedef NSThread = swift.foundation.NSThread;
typedef NSTimeZone = swift.foundation.NSTimeZone;
typedef NSTimer = swift.foundation.NSTimer;
typedef NSURL = swift.foundation.NSURL;
typedef NSURLAuthenticationChallenge = swift.foundation.NSURLAuthenticationChallenge;
typedef NSURLCache = swift.foundation.NSURLCache;
typedef NSURLConnection = swift.foundation.NSURLConnection;
typedef NSURLCredential = swift.foundation.NSURLCredential;
typedef NSURLCredentialStorage = swift.foundation.NSURLCredentialStorage;
typedef NSURLError = swift.foundation.NSURLError;
typedef NSURLProtectionSpace = swift.foundation.NSURLProtectionSpace;
typedef NSURLProtocol = swift.foundation.NSURLProtocol;
typedef NSURLRequest = swift.foundation.NSURLRequest;
typedef NSURLResponse = swift.foundation.NSURLResponse;
typedef NSUserDefaults = swift.foundation.NSUserDefaults;
typedef NSValue = swift.foundation.NSValue;
typedef NSValueTransformer = swift.foundation.NSValueTransformer;
typedef NSXMLParser = swift.foundation.NSXMLParser;
typedef NSZone = swift.foundation.NSZone;

typedef FoundationErrors = swift.foundation.FoundationErrors;*/

/*#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)) || (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)

typedef NSAttributedString = swift.foundation.NSAttributedString;
typedef NSByteCountFormatter = swift.foundation.NSByteCountFormatter;
typedef NSCache = swift.foundation.NSCache;
typedef NSComparisonPredicate = swift.foundation.NSComparisonPredicate;
typedef NSCompoundPredicate = swift.foundation.NSCompoundPredicate;
typedef NSExpression = swift.foundation.NSExpression;
typedef NSFileCoordinator = swift.foundation.NSFileCoordinator;
typedef NSFilePresenter = swift.foundation.NSFilePresenter;
typedef NSFileVersion = swift.foundation.NSFileVersion;
typedef NSFileWrapper = swift.foundation.NSFileWrapper;
typedef NSLinguisticTagger = swift.foundation.NSLinguisticTagger;
typedef NSMetadata = swift.foundation.NSMetadata;
typedef NSNetServices = swift.foundation.NSNetServices;
typedef NSPredicate = swift.foundation.NSPredicate;
typedef NSUbiquitousKeyValueStore = swift.foundation.NSUbiquitousKeyValueStore;
typedef NSUndoManager = swift.foundation.NSUndoManager;
typedef NSUUID = swift.foundation.NSUUID;

#endif

#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)) || TARGET_OS_WIN32

typedef NSArchiver = swift.foundation.NSArchiver;
typedef NSCalendarDate = swift.foundation.NSCalendarDate;
typedef NSConnection = swift.foundation.NSConnection;
typedef NSDistantObject = swift.foundation.NSDistantObject;
typedef NSDistributedNotificationCenter = swift.foundation.NSDistributedNotificationCenter;
typedef NSGeometry = swift.foundation.NSGeometry;
typedef NSPortCoder = swift.foundation.NSPortCoder;
typedef NSPortMessage = swift.foundation.NSPortMessage;
typedef NSPortNameServer = swift.foundation.NSPortNameServer;
typedef NSProtocolChecker = swift.foundation.NSProtocolChecker;
typedef NSTask = swift.foundation.NSTask;
typedef NSXMLDTD = swift.foundation.NSXMLDTD;
typedef NSXMLDTDNode = swift.foundation.NSXMLDTDNode;
typedef NSXMLDocument = swift.foundation.NSXMLDocument;
typedef NSXMLElement = swift.foundation.NSXMLElement;
typedef NSXMLNode = swift.foundation.NSXMLNode;
typedef NSXMLNodeOptions = swift.foundation.NSXMLNodeOptions;
typedef NSURLDownload = swift.foundation.NSURLDownload;
typedef NSURLHandle = swift.foundation.NSURLHandle;

#endif

#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))

typedef NSAffineTransform = swift.foundation.NSAffineTransform;
typedef NSAppleEventDescriptor = swift.foundation.NSAppleEventDescriptor;
typedef NSAppleEventManager = swift.foundation.NSAppleEventManager;
typedef NSAppleScript = swift.foundation.NSAppleScript;
typedef NSClassDescription = swift.foundation.NSClassDescription;
typedef NSDistributedLock = swift.foundation.NSDistributedLock;
typedef NSGarbageCollector = swift.foundation.NSGarbageCollector;
typedef NSHFSFileTypes = swift.foundation.NSHFSFileTypes;
typedef NSHost = swift.foundation.NSHost;
typedef NSObjectScripting = swift.foundation.NSObjectScripting;
typedef NSScriptClassDescription = swift.foundation.NSScriptClassDescription;
typedef NSScriptCoercionHandler = swift.foundation.NSScriptCoercionHandler;
typedef NSScriptCommand = swift.foundation.NSScriptCommand;
typedef NSScriptCommandDescription = swift.foundation.NSScriptCommandDescription;
typedef NSScriptExecutionContext = swift.foundation.NSScriptExecutionContext;
typedef NSScriptKeyValueCoding = swift.foundation.NSScriptKeyValueCoding;
typedef NSScriptObjectSpecifiers = swift.foundation.NSScriptObjectSpecifiers;
typedef NSScriptStandardSuiteCommands = swift.foundation.NSScriptStandardSuiteCommands;
typedef NSScriptSuiteRegistry = swift.foundation.NSScriptSuiteRegistry;
typedef NSScriptWhoseTests = swift.foundation.NSScriptWhoseTests;
typedef NSSpellServer = swift.foundation.NSSpellServer;
typedef NSUserNotification = swift.foundation.NSUserNotification;
typedef NSUserScriptTask = swift.foundation.NSUserScriptTask;
typedef NSXPCConnection = swift.foundation.NSXPCConnection;

#endif
*/