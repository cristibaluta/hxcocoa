package objc.foundation;

/*enum {
    NSURLBookmarkCreationPreferFileIDResolution = ( 1UL << 8 ), 
    NSURLBookmarkCreationMinimalBookmark = ( 1UL << 9 ),
    NSURLBookmarkCreationSuitableForBookmarkFile = ( 1UL << 10 ),
};

enum {
    NSURLBookmarkResolutionWithoutUI = ( 1UL << 8 ),
    NSURLBookmarkResolutionWithoutMounting = ( 1UL << 9 ),	
};*/

typedef NSURLBookmarkCreationOptions = Int;
typedef NSURLBookmarkResolutionOptions = Int;
typedef NSURLBookmarkFileCreationOptions = Int;

@:framework("Foundation")
extern class NSURL extends NSObject {
        
// Convenience initializers
	public function initWithScheme (scheme:String, host:String, path:String) :Dynamic;

	public function initFileURLWithPathIsDirectory (path:String, isDirectory:Bool) :Dynamic;
	public function initFileURLWithPath (path:String) :Dynamic;

	public static function fileURLWithPathIsDirectory (path:String, isDirectory:Bool) :Dynamic;
	public static function fileURLWithPath (path:String) :Dynamic;
/*
// These methods expect their string arguments to contain any percent escape codes that are necessary
- initWithString:(NSString *)URLString;
- initWithString:(NSString *)URLString relativeToURL:(NSURL *)baseURL; // It is an error for URLString to be nil
+ (id)URLWithString:(NSString *)URLString;
+ (id)URLWithString:(NSString *)URLString relativeToURL:(NSURL *)baseURL;

- (NSString *)absoluteString;
- (NSString *)relativeString; // The relative portion of a URL.  If baseURL is nil, or if the receiver is itself absolute, this is the same as absoluteString
- (NSURL *)baseURL; // may be nil.
- (NSURL *)absoluteURL; // if the receiver is itself absolute, this will return self.

// Any URL is composed of these two basic pieces.  The full URL would be the concatenation of [myURL scheme], ':', [myURL resourceSpecifier]
- (NSString *)scheme;
- (NSString *)resourceSpecifier;

- (NSString *)host;
- (NSNumber *)port;
- (NSString *)user;
- (NSString *)password;
- (NSString *)path;
- (NSString *)fragment;
- (NSString *)parameterString;
- (NSString *)query;
- (NSString *)relativePath; // The same as path if baseURL is nil

- (Bool)isFileURL; // Whether the scheme is file:; if [myURL isFileURL] is YES, then [myURL path] is suitable for input into NSFileManager or NSPathUtilities.

- (NSURL *)standardizedURL;



- (Bool)getResourceValue:(out id *)value forKey:(NSString *)key error:(out NSError **)error NS_AVAILABLE(10_6, 4_0);


- (NSDictionary *)resourceValuesForKeys:(Array<> *)keys error:(NSError **)error NS_AVAILABLE(10_6, 4_0);


- (Bool)setResourceValue:(id)value forKey:(NSString *)key error:(NSError **)error NS_AVAILABLE(10_6, 4_0);
- (Bool)setResourceValues:(NSDictionary *)keyedValues error:(NSError **)error NS_AVAILABLE(10_6, 4_0);

FOUNDATION_EXPORT NSString * const NSURLKeysOfUnsetValuesKey NS_AVAILABLE(10_7, 5_0); // If setResourceValues returns an error, this is key in the error's userInfo dictionary to the array of keys of unset values.


- (Bool)checkResourceIsReachableAndReturnError:(NSError **)error NS_AVAILABLE(10_6, 4_0);


- (Bool)isFileReferenceURL NS_AVAILABLE(10_6, 4_0);

- (NSURL *)fileReferenceURL NS_AVAILABLE(10_6, 4_0);

- (NSURL *)filePathURL NS_AVAILABLE(10_6, 4_0);

- (NSData *)bookmarkDataWithOptions:(NSURLBookmarkCreationOptions)options includingResourceValuesForKeys:(Array<> *)keys relativeToURL:(NSURL *)relativeURL error:(NSError **)error NS_AVAILABLE(10_6, 4_0);

- (id)initByResolvingBookmarkData:(NSData *)bookmarkData options:(NSURLBookmarkResolutionOptions)options relativeToURL:(NSURL *)relativeURL bookmarkDataIsStale:(Bool *)isStale error:(NSError **)error NS_AVAILABLE(10_6, 4_0);
+ (id)URLByResolvingBookmarkData:(NSData *)bookmarkData options:(NSURLBookmarkResolutionOptions)options relativeToURL:(NSURL *)relativeURL bookmarkDataIsStale:(Bool *)isStale error:(NSError **)error NS_AVAILABLE(10_6, 4_0);
+ (NSDictionary *)resourceValuesForKeys:(Array<> *)keys fromBookmarkData:(NSData *)bookmarkData NS_AVAILABLE(10_6, 4_0);

+ (Bool)writeBookmarkData:(NSData *)bookmarkData toURL:(NSURL *)bookmarkFileURL options:(NSURLBookmarkFileCreationOptions)options error:(NSError **)error NS_AVAILABLE(10_6, 4_0);

+ (NSData *)bookmarkDataWithContentsOfURL:(NSURL *)bookmarkFileURL error:(NSError **)error NS_AVAILABLE(10_6, 4_0);

}

extern class NSString (NSURLUtilities)

- (NSString *)stringByAddingPercentEscapesUsingEncoding:(NSStringEncoding)enc;
- (NSString *)stringByReplacingPercentEscapesUsingEncoding:(NSStringEncoding)enc;

}

#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))
// Client informal protocol for use with the deprecated loadResourceDataNotifyingClient: below.  
extern class NSObject(NSURLClient)
- (void)URL:(NSURL *)sender resourceDataDidBecomeAvailable:(NSData *)newBytes NS_DEPRECATED(10_0, 10_4, 2_0, 2_0);
- (void)URLResourceDidFinishLoading:(NSURL *)sender NS_DEPRECATED(10_0, 10_4, 2_0, 2_0);
- (void)URLResourceDidCancelLoading:(NSURL *)sender NS_DEPRECATED(10_0, 10_4, 2_0, 2_0);
- (void)URL:(NSURL *)sender resourceDidFailLoadingWithReason:(NSString *)reason NS_DEPRECATED(10_0, 10_4, 2_0, 2_0);
}

//  This entire protocol is deprecated; use NSURLConnection instead.
extern class NSURL (NSURLLoading)
- (NSData *)resourceDataUsingCache:(Bool)shouldUseCache NS_DEPRECATED(10_0, 10_4, 2_0, 2_0); // Blocks to load the data if necessary.  If shouldUseCache is YES, then if an equivalent URL has already been loaded and cached, its resource data will be returned immediately.  If shouldUseCache is NO, a new load will be started
- (void)loadResourceDataNotifyingClient:(id)client usingCache:(Bool)shouldUseCache NS_DEPRECATED(10_0, 10_4, 2_0, 2_0); // Starts an asynchronous load of the data, registering delegate to receive notification.  Only one such background load can proceed at a time.
- (id)propertyForKey:(NSString *)propertyKey NS_DEPRECATED(10_0, 10_4, 2_0, 2_0);

    // These attempt to write the given arguments for the resource specified by the URL; they return success or failure
- (Bool)setResourceData:(NSData *)data NS_DEPRECATED(10_0, 10_4, 2_0, 2_0);
- (Bool)setProperty:(id)property forKey:(NSString *)propertyKey NS_DEPRECATED(10_0, 10_4, 2_0, 2_0);

- (NSURLHandle *)URLHandleUsingCache:(Bool)shouldUseCache NS_DEPRECATED(10_0, 10_4, 2_0, 2_0); // Sophisticated clients will want to ask for this, then message the handle directly.  If shouldUseCache is NO, a newly instantiated handle is returned, even if an equivalent URL has been loaded

}
#endif

extern class NSURL(NSURLPathUtilities)
    
+ (NSURL *)fileURLWithPathComponents:(Array<> *)components NS_AVAILABLE(10_6, 4_0);
- (Array<> *)pathComponents NS_AVAILABLE(10_6, 4_0);
- (NSString *)lastPathComponent NS_AVAILABLE(10_6, 4_0);
- (NSString *)pathExtension NS_AVAILABLE(10_6, 4_0);
- (NSURL *)URLByAppendingPathComponent:(NSString *)pathComponent NS_AVAILABLE(10_6, 4_0);
- (NSURL *)URLByAppendingPathComponent:(NSString *)pathComponent isDirectory:(Bool)isDirectory NS_AVAILABLE(10_7, 5_0);
- (NSURL *)URLByDeletingLastPathComponent NS_AVAILABLE(10_6, 4_0);
- (NSURL *)URLByAppendingPathExtension:(NSString *)pathExtension NS_AVAILABLE(10_6, 4_0);
- (NSURL *)URLByDeletingPathExtension NS_AVAILABLE(10_6, 4_0);

- (NSURL *)URLByStandardizingPath NS_AVAILABLE(10_6, 4_0);
- (NSURL *)URLByResolvingSymlinksInPath NS_AVAILABLE(10_6, 4_0) ;
*/
}