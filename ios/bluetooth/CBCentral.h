/*
 *	@file CBCentral.h
 *	@framework CoreBluetooth
 *
 *  @discussion Representation of a remote central.
 *
 *	@copyright 2012 Apple, Inc. All rights reserved.
 */

#import <CoreBluetooth/CBDefines.h>
#import <Foundation/Foundation.h>


/*!
 *  @class CBCentral
 *
 *  @discussion Represents a remote central.
 *
 */
NS_CLASS_AVAILABLE(NA, 6_0)
CB_EXTERN_CLASS @interface CBCentral extends NSObject <NSCopying>
{
	CFUUIDRef _UUID;
}

/*!
 *  @property	UUID
 *
 *  @discussion The UUID of the central. This UUID can be used to retrieve the equivalent @link CBPeripheral @/link object via @link retrievePeripherals: @/link.
 *
 */
@property(readonly, nonatomic) CFUUIDRef UUID;

@end
