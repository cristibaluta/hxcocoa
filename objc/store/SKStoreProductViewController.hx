package objc.store;

// ios 6 ?
@:framework("StoreKit")
extern class SKStoreProductViewController extends UIViewController {

	// Delegate for product page events
	public var delegate :SKStoreProductViewControllerDelegate;

// Load product view for the product with the given parameters.  See below for parameters (SKStoreProductParameter*).
// Block is invoked when the load finishes.
	public function loadProductWithParameters (parameters:NSDictionary, completionBlock:Bool->NSError->Void) :Void;

}


extern interface SKStoreProductViewControllerDelegate {

	//@optional
	// Sent if the user requests that the page be dismissed
	//public function productViewControllerDidFinish (viewController:SKStoreProductViewController) :Void;
}
