/*
 *  CLPlacemark.h
 *  CoreLocation
 *
 *  Copyright (c) 2010 Apple Inc. All rights reserved.
 */

#if ios

package objc.location;

import objc.foundation.NSObject;
import objc.foundation.NSDictionary;


/*
 *  CLPlacemark
 *  
 *  Discussion:
 *    Represents placemark data for a geographic location. Placemark data can be
 *    information such as the country, state, city, and street address.
 */

@:framework("CoreLocation")
extern class CLPlacemark extends NSObject implements NSCopying implements NSCoding {

/*
 * initWithPlacemark:
 *
 * Discussion:
 *   Initialize a newly allocated placemark from another placemark, copying its data.
 */
	public function initWithPlacemark (placemark:CLPlacemark) :CLPlacemark;

/*
 *  location
 *  
 *  Discussion:
 *    Returns the geographic location associated with the placemark.
 */
	public var location :CLLocation;

/*
 *  region
 *  
 *  Discussion:
 *    Returns the geographic region associated with the placemark.
 */
	public var region :CLRegion;

/*
 *  addressDictionary
 *  
 *  Discussion:
 *    This dictionary can be formatted as an address using ABCreateStringWithAddressDictionary,
 *    defined in the AddressBookUI framework.
 */
	public var addressDictionary :NSDictionary;

// address dictionary properties
	public var name :String; // eg. Apple Inc.
	public var thoroughfare :String; // street address, eg. 1 Infinite Loop
	public var subThoroughfare :String; // eg. 1
	public var locality :String; // city, eg. Cupertino
	public var subLocality :String; // neighborhood, common name, eg. Mission District
	public var administrativeArea :String; // state, eg. CA
	public var subAdministrativeArea :String; // county, eg. Santa Clara
	public var postalCode :String; // zip code, eg. 95014
	public var ISOcountryCode :String; // eg. US
	public var country :String; // eg. United States
	public var inlandWater :String; // eg. Lake Tahoe
	public var ocean :String; // eg. Pacific Ocean
	public var areasOfInterest :Array<String>; // eg. Golden Gate Park
}

#end
