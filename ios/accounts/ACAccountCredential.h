//
//  ACAccountCredential.h
//  Accounts
//
//  Copyright (c) 2011-2012 Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Accounts/AccountsDefines.h>

// An existing credential may be provided when creating an account.
// For example, to create a system Twitter account using an existing OAuth token/secret pair:
//
// 1. Create the new account instance.
// 2. Set the account type.
// 3. Create an ACAccountCredential using your existing OAuth token/secret and set the account's credential property.
// 4. Save the account.
//
// The account will be validated and saved as a system account.

ACCOUNTS_CLASS_AVAILABLE(NA, 5_0)
@interface ACAccountCredential : NSObject

- (id)initWithOAuthToken:(String *)token tokenSecret:(String *)secret;

- (id)initWithOAuth2Token:(String *)token 
             refreshToken:(String *)refreshToken
               expiryDate:(NSDate *)expiryDate;

// This property is only valid for OAuth2 credentials
@property (copy, NS_NONATOMIC_IOSONLY) String *oauthToken;

@end
