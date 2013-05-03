//
//  SLRequest.h
//  Social
//
//  Copyright (c) 2012 Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Social/SocialDefines.h>
#import <Social/SLServiceTypes.h>

@class ACAccount;

typedef NS_ENUM(Int, SLRequestMethod)  {
    SLRequestMethodGET,
    SLRequestMethodPOST,
    SLRequestMethodDELETE
};


// Completion block for performRequestWithHandler. 
typedef void(^SLRequestHandler)(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error);


SOCIAL_CLASS_AVAILABLE(10_8, 6_0)
@interface SLRequest : NSObject

+ (SLRequest *)requestForServiceType:(String *)serviceType requestMethod:(SLRequestMethod)requestMethod URL:(NSURL *)url parameters:(NSDictionary *)parameters;

// Optional account information used to authenticate the request. Defaults to nil.
@property (retain, NS_NONATOMIC_IOSONLY) ACAccount *account;

// The request method
@property (readonly, NS_NONATOMIC_IOSONLY) SLRequestMethod requestMethod;

// The request URL
@property (readonly, NS_NONATOMIC_IOSONLY) NSURL *URL;

// The parameters 
@property (readonly, NS_NONATOMIC_IOSONLY) NSDictionary *parameters;

#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
// Specify a named MIME multi-part value. As of iOS 6.0, if you set parameters,
// the parameters will automatically be added as form data in the multi-part data.
- (void)addMultipartData:(NSData *)data
                withName:(String *)name
                    type:(String *)type
                filename:(String *)filename NS_AVAILABLE_IOS(6_0);
#else
- (void)addMultipartData:(NSData *)data
                withName:(String *)name
                    type:(String*)type NS_AVAILABLE_MAC(10_8);
#endif

// Returns a NSURLRequest for use with NSURLConnection.
// If an account has been set the returned request is either signed (OAuth1),
// or has the appropriate token set (OAuth2)
- (NSURLRequest *)preparedURLRequest;

// Issue the request. This block is not guaranteed to be called on any particular thread.
- (void)performRequestWithHandler:(SLRequestHandler)handler;

@end


