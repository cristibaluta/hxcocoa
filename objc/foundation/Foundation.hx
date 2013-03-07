package objc.foundation;

typedef NSObjCRuntime = objc.foundation.NSObjCRuntime;

typedef Array<> = objc.foundation.Array<>;
typedef NSAutoreleasePool = objc.foundation.NSAutoreleasePool;
typedef NSBundle = objc.foundation.NSBundle;
typedef NSByteOrder = objc.foundation.NSByteOrder;
typedef NSCalendar = objc.foundation.NSCalendar;
typedef NSCharacterSet = objc.foundation.NSCharacterSet;
typedef NSCoder = objc.foundation.NSCoder;
typedef NSData = objc.foundation.NSData;
typedef NSDate = objc.foundation.NSDate;
typedef NSDateFormatter = objc.foundation.NSDateFormatter;
typedef NSDecimal = objc.foundation.NSDecimal;
typedef NSDecimalNumber = objc.foundation.NSDecimalNumber;
typedef NSDictionary = objc.foundation.NSDictionary;
typedef NSEnumerator = objc.foundation.NSEnumerator;
typedef NSError = objc.foundation.NSError;
typedef NSException = objc.foundation.NSException;
typedef NSFileHandle = objc.foundation.NSFileHandle;
typedef NSFileManager = objc.foundation.NSFileManager;
typedef NSFormatter = objc.foundation.NSFormatter;
typedef NSHashTable = objc.foundation.NSHashTable;
typedef NSHTTPCookie = objc.foundation.NSHTTPCookie;
typedef NSHTTPCookieStorage = objc.foundation.NSHTTPCookieStorage;
typedef NSIndexPath = objc.foundation.NSIndexPath;
typedef NSIndexSet = objc.foundation.NSIndexSet;
typedef NSInvocation = objc.foundation.NSInvocation;
typedef NSJSONSerialization = objc.foundation.NSJSONSerialization;
typedef NSKeyValueCoding = objc.foundation.NSKeyValueCoding;
typedef NSKeyValueObserving = objc.foundation.NSKeyValueObserving;
typedef NSKeyedArchiver = objc.foundation.NSKeyedArchiver;
typedef NSLocale = objc.foundation.NSLocale;
typedef NSLock = objc.foundation.NSLock;
typedef NSMapTable = objc.foundation.NSMapTable;
typedef NSMethodSignature = objc.foundation.NSMethodSignature;
typedef NSNotification = objc.foundation.NSNotification;
typedef NSNotificationQueue = objc.foundation.NSNotificationQueue;
typedef NSNull = objc.foundation.NSNull;
typedef NSNumberFormatter = objc.foundation.NSNumberFormatter;
typedef NSObject = objc.foundation.NSObject;
typedef NSOperation = objc.foundation.NSOperation;
typedef NSOrderedSet = objc.foundation.NSOrderedSet;
typedef NSOrthography = objc.foundation.NSOrthography;
typedef NSPathUtilities = objc.foundation.NSPathUtilities;
typedef NSPointerArray = objc.foundation.NSPointerArray;
typedef NSPointerFunctions = objc.foundation.NSPointerFunctions;
typedef NSPort = objc.foundation.NSPort;
typedef NSProcessInfo = objc.foundation.NSProcessInfo;
typedef NSPropertyList = objc.foundation.NSPropertyList;
typedef NSProxy = objc.foundation.NSProxy;
typedef NSRange = objc.foundation.NSRange;
typedef NSRegularExpression = objc.foundation.NSRegularExpression;
typedef NSRunLoop = objc.foundation.NSRunLoop;
typedef NSScanner = objc.foundation.NSScanner;
typedef NSSet = objc.foundation.NSSet;
typedef NSSortDescriptor = objc.foundation.NSSortDescriptor;
typedef NSStream = objc.foundation.NSStream;
typedef NSString = objc.foundation.NSString;
typedef NSTextCheckingResult = objc.foundation.NSTextCheckingResult;
typedef NSThread = objc.foundation.NSThread;
typedef NSTimeZone = objc.foundation.NSTimeZone;
typedef NSTimer = objc.foundation.NSTimer;
typedef NSURL = objc.foundation.NSURL;
typedef NSURLAuthenticationChallenge = objc.foundation.NSURLAuthenticationChallenge;
typedef NSURLCache = objc.foundation.NSURLCache;
typedef NSURLConnection = objc.foundation.NSURLConnection;
typedef NSURLCredential = objc.foundation.NSURLCredential;
typedef NSURLCredentialStorage = objc.foundation.NSURLCredentialStorage;
typedef NSURLError = objc.foundation.NSURLError;
typedef NSURLProtectionSpace = objc.foundation.NSURLProtectionSpace;
typedef NSURLProtocol = objc.foundation.NSURLProtocol;
typedef NSURLRequest = objc.foundation.NSURLRequest;
typedef NSURLResponse = objc.foundation.NSURLResponse;
typedef NSUserDefaults = objc.foundation.NSUserDefaults;
typedef NSValue = objc.foundation.NSValue;
typedef NSValueTransformer = objc.foundation.NSValueTransformer;
typedef NSXMLParser = objc.foundation.NSXMLParser;
typedef NSZone = objc.foundation.NSZone;

typedef FoundationErrors = objc.foundation.FoundationErrors;

/*#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)) || (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)

typedef NSAttributedString = objc.foundation.NSAttributedString;
typedef NSByteCountFormatter = objc.foundation.NSByteCountFormatter;
typedef NSCache = objc.foundation.NSCache;
typedef NSComparisonPredicate = objc.foundation.NSComparisonPredicate;
typedef NSCompoundPredicate = objc.foundation.NSCompoundPredicate;
typedef NSExpression = objc.foundation.NSExpression;
typedef NSFileCoordinator = objc.foundation.NSFileCoordinator;
typedef NSFilePresenter = objc.foundation.NSFilePresenter;
typedef NSFileVersion = objc.foundation.NSFileVersion;
typedef NSFileWrapper = objc.foundation.NSFileWrapper;
typedef NSLinguisticTagger = objc.foundation.NSLinguisticTagger;
typedef NSMetadata = objc.foundation.NSMetadata;
typedef NSNetServices = objc.foundation.NSNetServices;
typedef NSPredicate = objc.foundation.NSPredicate;
typedef NSUbiquitousKeyValueStore = objc.foundation.NSUbiquitousKeyValueStore;
typedef NSUndoManager = objc.foundation.NSUndoManager;
typedef NSUUID = objc.foundation.NSUUID;

#endif

#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)) || TARGET_OS_WIN32

typedef NSArchiver = objc.foundation.NSArchiver;
typedef NSCalendarDate = objc.foundation.NSCalendarDate;
typedef NSConnection = objc.foundation.NSConnection;
typedef NSDistantObject = objc.foundation.NSDistantObject;
typedef NSDistributedNotificationCenter = objc.foundation.NSDistributedNotificationCenter;
typedef NSGeometry = objc.foundation.NSGeometry;
typedef NSPortCoder = objc.foundation.NSPortCoder;
typedef NSPortMessage = objc.foundation.NSPortMessage;
typedef NSPortNameServer = objc.foundation.NSPortNameServer;
typedef NSProtocolChecker = objc.foundation.NSProtocolChecker;
typedef NSTask = objc.foundation.NSTask;
typedef NSXMLDTD = objc.foundation.NSXMLDTD;
typedef NSXMLDTDNode = objc.foundation.NSXMLDTDNode;
typedef NSXMLDocument = objc.foundation.NSXMLDocument;
typedef NSXMLElement = objc.foundation.NSXMLElement;
typedef NSXMLNode = objc.foundation.NSXMLNode;
typedef NSXMLNodeOptions = objc.foundation.NSXMLNodeOptions;
typedef NSURLDownload = objc.foundation.NSURLDownload;
typedef NSURLHandle = objc.foundation.NSURLHandle;

#endif

#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))

typedef NSAffineTransform = objc.foundation.NSAffineTransform;
typedef NSAppleEventDescriptor = objc.foundation.NSAppleEventDescriptor;
typedef NSAppleEventManager = objc.foundation.NSAppleEventManager;
typedef NSAppleScript = objc.foundation.NSAppleScript;
typedef NSClassDescription = objc.foundation.NSClassDescription;
typedef NSDistributedLock = objc.foundation.NSDistributedLock;
typedef NSGarbageCollector = objc.foundation.NSGarbageCollector;
typedef NSHFSFileTypes = objc.foundation.NSHFSFileTypes;
typedef NSHost = objc.foundation.NSHost;
typedef NSObjectScripting = objc.foundation.NSObjectScripting;
typedef NSScriptClassDescription = objc.foundation.NSScriptClassDescription;
typedef NSScriptCoercionHandler = objc.foundation.NSScriptCoercionHandler;
typedef NSScriptCommand = objc.foundation.NSScriptCommand;
typedef NSScriptCommandDescription = objc.foundation.NSScriptCommandDescription;
typedef NSScriptExecutionContext = objc.foundation.NSScriptExecutionContext;
typedef NSScriptKeyValueCoding = objc.foundation.NSScriptKeyValueCoding;
typedef NSScriptObjectSpecifiers = objc.foundation.NSScriptObjectSpecifiers;
typedef NSScriptStandardSuiteCommands = objc.foundation.NSScriptStandardSuiteCommands;
typedef NSScriptSuiteRegistry = objc.foundation.NSScriptSuiteRegistry;
typedef NSScriptWhoseTests = objc.foundation.NSScriptWhoseTests;
typedef NSSpellServer = objc.foundation.NSSpellServer;
typedef NSUserNotification = objc.foundation.NSUserNotification;
typedef NSUserScriptTask = objc.foundation.NSUserScriptTask;
typedef NSXPCConnection = objc.foundation.NSXPCConnection;

#endif
*/