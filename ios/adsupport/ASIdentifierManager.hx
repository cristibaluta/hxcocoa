package ios.adsupport;

@:framework("AdSupport")
@:require(ios6_0)
extern interface ASIdentifierManager {

	 public static function sharedManager () :ASIdentifierManager;

	 public var advertisingIdentifier (default, null) :NSUUID;
	 public var advertisingTrackingEnabled (default, null) :Bool;

}
