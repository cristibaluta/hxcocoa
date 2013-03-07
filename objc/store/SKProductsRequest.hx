package objc.store;
import objc.store.SKRequest;

interface SKProductsRequestDelegate extends SKRequestDelegate {

//@required
// Sent immediately before -requestDidFinish:
	public function productsRequest (request:SKProductsRequest, didReceiveResponse:SKProductsResponse) :Void;

}


// request information about products for your application
@:framework("StoreKit")
extern class SKProductsRequest extends SKRequest {

	// Set of string product identifiers
	public function initWithProductIdentifiers (productIdentifiers:NSSet) :SKProductsRequest;

	public var delegate :SKProductsRequestDelegate;

}

@:framework("StoreKit")
extern class SKProductsResponse extends NSObject {

	public var products (default, null) :Array<SKProduct>;
	public var invalidProductIdentifiers (default, null) :Array<String>;

}
