//
//  UINib.h
package ios.ui;
import objc.foundation.NSObject;
import objc.foundation.NSBundle;
import objc.foundation.NSData;
import objc.foundation.NSDictionary;

@:framework("UIKit")
extern class UINib extends NSObject {

// If the bundle parameter is nil, the main bundle is used.
// Releases resources in response to memory pressure (e.g. memory warning), reloading from the bundle when necessary.
	public static function nibWithNibName (name:String, bundle:NSBundle) :UINib;

// If the bundle parameter is nil, the main bundle is used.
	public static function nibWithData (data:NSData, bundle:NSBundle) :UINib;

// Returns an array containing the top-level objects from the NIB.
// The owner and options parameters may both be nil.
// If the owner parameter is nil, connections to File's Owner are not permitted.
// Options are identical to the options specified with -[NSBundle loadNibNamed:owner:options:]
	public function instantiateWithOwner (ownerOrNil:Dynamic, options:NSDictionary) :Array<Dynamic>;
}
