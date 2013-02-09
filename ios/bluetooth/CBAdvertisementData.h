/*
 *	@file CBAdvertisementData.h
 *	@framework CoreBluetooth
 *
 *	@copyright 2012 Apple, Inc. All rights reserved.
 */

#import <CoreBluetooth/CBDefines.h>
#import <Foundation/Foundation.h>

/*!
 *  @constant CBAdvertisementDataServiceUUIDsKey
 *
 *  @discussion A list of one or more <code>CBUUID</code> objects, representing <code>CBService</code> UUIDs.
 *
 */
CB_EXTERN NSString * const CBAdvertisementDataServiceUUIDsKey;

/*!
 *  @constant CBAdvertisementDataOverflowServiceUUIDsKey
 *
 *  @discussion A list of one or more <code>CBUUID</code> objects, representing <code>CBService</code> UUIDs that were
 *              found in the "overflow" area of the advertising data. Due to the nature of the data stored in this area,
 *              UUIDs listed here are "best effort" and may not always be accurate.
 *
 *  @see        startAdvertising:
 *
 */
CB_EXTERN NSString * const CBAdvertisementDataOverflowServiceUUIDsKey NS_AVAILABLE(NA, 6_0);

/*!
 *  @constant CBAdvertisementDataLocalNameKey
 *
 *  @discussion A <code>NSString</code> containing the local name of a peripheral.
 *
 */
CB_EXTERN NSString * const CBAdvertisementDataLocalNameKey;

/*!
 *  @constant CBAdvertisementDataTxPowerLevelKey
 *
 *  @discussion A <code>NSNumber</code> containing the transmit power of a peripheral.
 *
 */
CB_EXTERN NSString * const CBAdvertisementDataTxPowerLevelKey;

/*!
 *  @constant CBAdvertisementDataManufacturerDataKey
 *
 *  @discussion A <code>NSData</code> object containing the manufacturer data of a peripheral.
 *
 */
CB_EXTERN NSString * const CBAdvertisementDataManufacturerDataKey;

/*!
 *  @constant CBAdvertisementDataServiceDataKey
 *
 *  @discussion A dictionary containing service-specific advertisement data. Keys are <code>CBUUID</code> objects, representing
 *              <code>CBService</code> UUIDs. Values are <code>NSData</code> objects.
 *
 */
CB_EXTERN NSString * const CBAdvertisementDataServiceDataKey;
