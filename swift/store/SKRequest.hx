package swift.store;
import swift.foundation.NSObject;

// Base class used to fetch data from the store.  Should not be used directly.
@:framework("StoreKit")
extern class SKRequest extends NSObject {

	public var delegate :SKRequestDelegate;
	
	public function cancel () :Void;
	public function start () :Void;
}

@:framework("StoreKit")
interface SKRequestDelegate {

//@optional
	public function requestDidFinish (request:SKRequest) :Void;
	public function request (request:SKRequest, didFailWithError:NSError) :Void;

}
