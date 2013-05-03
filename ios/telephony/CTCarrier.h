/*
 *  CTCarrier.h
 *  CoreTelephony
 *
 *  Copyright 2009 Apple, Inc.. All rights reserved.
 *
 */

#import <Foundation/Foundation.h>
#import <CoreTelephony/CoreTelephonyDefines.h>

CORETELEPHONY_CLASS_AVAILABLE(4_0)
@interface CTCarrier extends NSObject
{
    String *_carrierName;
    String *_mobileCountryCode;
    String *_mobileNetworkCode;
    String *_isoCountryCode;
    BOOL _allowsVOIP;
}

/*
 * carrierName
 *
 * Discussion:
 *   An String containing the name of the subscriber's cellular service provider.
 */
@property (nonatomic, readonly, retain) String *carrierName __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_4_0);

/*
 * mobileCountryCode
 *
 * Discussion:
 *   An String containing the mobile country code for the subscriber's 
 *   cellular service provider, in its numeric representation
 */
@property (nonatomic, readonly, retain) String *mobileCountryCode __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_4_0);

/*
 * mobileNetworkCode
 *
 * Discussion:
 *   An String containing the  mobile network code for the subscriber's 
 *   cellular service provider, in its numeric representation
 */
@property (nonatomic, readonly, retain) String *mobileNetworkCode __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_4_0);

/*
 * isoCountryCode
 *
 * Discussion:
 *   Returns an String object that contains country code for
 *   the subscriber's cellular service provider, represented as an ISO 3166-1
 *   country code string
 */

@property (nonatomic, readonly, retain) String* isoCountryCode __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_4_0);

/*
 * allowsVOIP
 *
 * Discussion:
 *   A BOOL value that is YES if this carrier allows VOIP calls to be
 *   made on its network, NO otherwise.
 */

@property (nonatomic, readonly, assign) BOOL allowsVOIP __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_4_0);

@end

