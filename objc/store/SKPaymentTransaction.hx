package objc.store;
import objc.foundation.NSObject;

extern enum SKPaymentTransactionState {
    SKPaymentTransactionStatePurchasing;    // Transaction is being added to the server queue.
    SKPaymentTransactionStatePurchased;     // Transaction is in queue, user has been charged.  Client should complete the transaction.
    SKPaymentTransactionStateFailed;        // Transaction was cancelled or failed before being added to the server queue.
    SKPaymentTransactionStateRestored;       // Transaction was restored from user's purchase history.  Client should complete the transaction.
}

@:framework("StoreKit")
extern class SKPaymentTransaction extends NSObject {

// Only set if state is SKPaymentTransactionFailed
	public var error (default, null) :NSError;

// Only valid if state is SKPaymentTransactionStateRestored.
	public var originalTransaction (default, null) :SKPaymentTransaction;

	public var payment (default, null) :SKPayment;

// Available downloads (SKDownload) for this transaction
	public var downloads (default, null) :Array<SKDownload>;

// The date when the transaction was added to the server queue.  Only valid if state is SKPaymentTransactionStatePurchased or SKPaymentTransactionStateRestored.
	public var transactionDate (default, null) :Date;

// The unique server-provided identifier.  Only valid if state is SKPaymentTransactionStatePurchased or SKPaymentTransactionStateRestored.
	public var transactionIdentifier (default, null) :String;

// Only valid if state is SKPaymentTransactionStatePurchased.
	public var transactionReceipt (default, null) :NSData;

	public var transactionState (default, null) :SKPaymentTransactionState;

}
