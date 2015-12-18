package objc.message;

import objc.foundation.NSObject;
import objc.foundation.NSData;


@:framework("StoreKit")
extern class SKPayment extends NSObject implements NSCopying/*, NSMutableCopying>*/ {

	public static function paymentWithProduct (product:SKProduct) :SKPayment;

	public var productIdentifier :String;
	public var requestData :NSData;
	public var quantity :Int;

}


@:framework("StoreKit")
extern class SKMutablePayment extends SKPayment {

	public var productIdentifier :String;
	public var quantity :Int;
	public var requestData :NSData;

}
