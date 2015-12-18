/*	
    NSURLCache.h
    Copyright (c) 2003-2012, Apple Inc. All rights reserved.    
    
    Public header file.
*/

package objc.foundation;

/*!
    @enum NSURLCacheStoragePolicy
    
    @discussion The NSURLCacheStoragePolicy enum defines constants that
    can be used to specify the type of storage that is allowable for an
    NSCachedURLResponse object that is to be stored in an NSURLCache.
    
    @constant NSURLCacheStorageAllowed Specifies that storage in an
    NSURLCache is allowed without restriction.

    @constant NSURLCacheStorageAllowedInMemoryOnly Specifies that
    storage in an NSURLCache is allowed; however storage should be
    done in memory only, no disk storage should be done.

    @constant NSURLCacheStorageNotAllowed Specifies that storage in an
    NSURLCache is not allowed in any fashion, either in memory or on
    disk.
*/
enum
{
    NSURLCacheStorageAllowed,
    NSURLCacheStorageAllowedInMemoryOnly,
    NSURLCacheStorageNotAllowed,
};
typedef NSUInteger NSURLCacheStoragePolicy;


@class NSCachedURLResponseInternal;
@class NSData;
@class NSDictionary;
@class NSURLRequest;
@class NSURLResponse;

/*!
    @class NSCachedURLResponse
    NSCachedURLResponse is a class whose objects functions as a wrapper for
    objects that are stored in the framework's caching system. 
    It is used to maintain characteristics and attributes of a cached 
    object. 
*/
extern class NSCachedURLResponse extends NSObject implements NSObject, NSCopying>
{
    @private
    NSCachedURLResponseInternal *_internal;
}

/*! 
    @method initWithResponse:data
    @abstract Initializes an NSCachedURLResponse with the given
    response and data.
    @discussion A default NSURLCacheStoragePolicy is used for
    NSCachedURLResponse objects initialized with this method:
    NSURLCacheStorageAllowed.
    @param response a NSURLResponse object.
    @param data an NSData object representing the URL content
    corresponding to the given response.
    @result an initialized NSCachedURLResponse.
*/
- (id)initWithResponse:(NSURLResponse *)response data:(NSData *)data;

/*! 
    @method initWithResponse:data:userInfo:storagePolicy:
    @abstract Initializes an NSCachedURLResponse with the given
    response, data, user-info dictionary, and storage policy.
    @param response a NSURLResponse object.
    @param data an NSData object representing the URL content
    corresponding to the given response.
    @param userInfo a dictionary user-specified information to be
    stored with the NSCachedURLResponse.
    @param storagePolicy an NSURLCacheStoragePolicy constant.
    @result an initialized NSCachedURLResponse.
*/
- (id)initWithResponse:(NSURLResponse *)response data:(NSData *)data userInfo:(NSDictionary *)userInfo storagePolicy:(NSURLCacheStoragePolicy)storagePolicy;

/*! 
    @method response
    @abstract Returns the response wrapped by this instance. 
    @result The response wrapped by this instance. 
*/
- (NSURLResponse *)response;

/*! 
    @method data
    @abstract Returns the data of the receiver. 
    @result The data of the receiver. 
*/
- (NSData *)data;

/*! 
    @method userInfo
    @abstract Returns the userInfo dictionary of the receiver. 
    @result The userInfo dictionary of the receiver. 
*/
- (NSDictionary *)userInfo;

/*! 
    @method storagePolicy
    @abstract Returns the NSURLCacheStoragePolicy constant of the receiver. 
    @result The NSURLCacheStoragePolicy constant of the receiver. 
*/
- (NSURLCacheStoragePolicy)storagePolicy;

}


@class NSURLRequest;
@class NSURLCacheInternal;

extern class NSURLCache extends NSObject
{
    @private
    NSURLCacheInternal *_internal;
}

/*! 
    @method sharedURLCache
    @abstract Returns the shared NSURLCache instance.
    @discussion Unless set explicitly through a call to
    <tt>+setSharedURLCache:</tt>, this method returns an NSURLCache
    instance created with the following default values:
    <ul>
    <li>Memory capacity: 4 megabytes (4 * 1024 * 1024 bytes)
    <li>Disk capacity: 20 megabytes (20 * 1024 * 1024 bytes)
    <li>Disk path: <nobr>(user home directory)/Library/Caches/(current application name)</nobr> 
        <br>where:
        <br>user home directory is determined by calling
        <tt>NSHomeDirectory()</tt>
        <br>current application name is determined by calling
        <tt>[[NSProcessInfo processInfo] processName]</tt>
    </ul>
    <p>Users who do not have special caching requirements or
    constraints should find the default shared cache instance
    acceptable. If this default shared cache instance is not
    acceptable, <tt>+setSharedURLCache:</tt> can be called to set a
    different NSURLCache instance to be returned from this method.
    @result the shared NSURLCache instance.
*/
+ (NSURLCache *)sharedURLCache;

/*! 
    @method setSharedURLCache:
    @abstract Sets the NSURLCache instance shared by all clients of
    the current process. This will be the new object returned when
    calls to the <tt>sharedURLCache</tt> method are made.
    @discussion Callers should take care to ensure that this method is called
    at a time when no other caller has a reference to the previously-set shared
    URL cache. This is to prevent storing cache data from becoming 
    unexpectedly unretrievable.
    @param cache the new shared NSURLCache instance.
*/
+ (void)setSharedURLCache:(NSURLCache *)cache;

/*! 
    @method initWithMemoryCapacity:diskCapacity:diskPath:
    @abstract Initializes an NSURLCache with the given capacity and
    path.
    @discussion The returned NSURLCache is backed by disk, so
    developers can be more liberal with space when choosing the
    capacity for this kind of cache. A disk cache measured in the tens
    of megabytes should be acceptable in most cases.
    @param capacity the capacity, measured in bytes, for the cache.
    @param path the path on disk where the cache data is stored.
    @result an initialized NSURLCache, with the given capacity, backed
    by disk.
*/
- (id)initWithMemoryCapacity:(NSUInteger)memoryCapacity diskCapacity:(NSUInteger)diskCapacity diskPath:(NSString *)path;

/*! 
    @method cachedResponseForRequest:
    @abstract Returns the NSCachedURLResponse stored in the cache with
    the given request.
    @discussion The method returns nil if there is no
    NSCachedURLResponse stored using the given request.
    @param request the NSURLRequest to use as a key for the lookup.
    @result The NSCachedURLResponse stored in the cache with the given
    request, or nil if there is no NSCachedURLResponse stored with the
    given request.
*/
- (NSCachedURLResponse *)cachedResponseForRequest:(NSURLRequest *)request;

/*! 
    @method storeCachedResponse:forRequest:
    @abstract Stores the given NSCachedURLResponse in the cache using
    the given request.
    @param cachedResponse The cached response to store.
    @param request the NSURLRequest to use as a key for the storage.
*/
public function storeCachedResponse:(NSCachedURLResponse *)cachedResponse forRequest:(NSURLRequest *)request;

/*! 
    @method removeCachedResponseForRequest:
    @abstract Removes the NSCachedURLResponse from the cache that is
    stored using the given request. 
    @discussion No action is taken if there is no NSCachedURLResponse
    stored with the given request.
    @param request the NSURLRequest to use as a key for the lookup.
*/
public function removeCachedResponseForRequest:(NSURLRequest *)request;

/*! 
    @method removeAllCachedResponses
    @abstract Clears the given cache, removing all NSCachedURLResponse
    objects that it stores.
*/
public function removeAllCachedResponses;

/*! 
    @method memoryCapacity
    @abstract Returns the in-memory capacity of the receiver. 
    @result The in-memory capacity, measured in bytes, for the receiver. 
*/
- (NSUInteger)memoryCapacity;

/*! 
    @method diskCapacity
    @abstract Returns the on-disk capacity of the receiver. 
    @result The on-disk capacity, measured in bytes, for the receiver. 
*/
- (NSUInteger)diskCapacity;

/*! 
    @method setMemoryCapacity:
    @abstract Sets the in-memory capacity of the receiver. 
    @discussion At the time this call is made, the in-memory cache will
    truncate its contents to the size given, if necessary.
    @param memoryCapacity the new in-memory capacity, measured in
    bytes, for the receiver.
*/
public function setMemoryCapacity:(NSUInteger)memoryCapacity;

/*! 
    @method setDiskCapacity:
    @abstract Sets the on-disk capacity of the receiver. 
    @discussion At the time this call is made, the on-disk cache will
    truncate its contents to the size given, if necessary.
    @param diskCapacity the new on-disk capacity, measured in
    bytes, for the receiver.
*/
public function setDiskCapacity:(NSUInteger)diskCapacity;

/*! 
    @method currentMemoryUsage
    @abstract Returns the current amount of space consumed by the
    in-memory cache of the receiver.
    @discussion This size, measured in bytes, indicates the current
    usage of the in-memory cache. 
    @result the current usage of the in-memory cache of the receiver.
*/
- (NSUInteger)currentMemoryUsage;

/*! 
    @method currentDiskUsage
    @abstract Returns the current amount of space consumed by the
    on-disk cache of the receiver.
    @discussion This size, measured in bytes, indicates the current
    usage of the on-disk cache. 
    @result the current usage of the on-disk cache of the receiver.
*/
- (NSUInteger)currentDiskUsage;

}
