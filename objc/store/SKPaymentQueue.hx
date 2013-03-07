package objc.store;
import objc.foundation.NSObject;

@:framework("StoreKit")
extern class SKPaymentQueue extends NSObject {

	public static function defaultQueue () :SKPaymentQueue;
	public static function canMakePayments () :Bool;

// Asynchronous.  Add a payment to the server queue.  The payment is copied to add an SKPaymentTransaction to the transactions array.  The same payment can be added multiple times to create multiple transactions.
	public function addPayment (payment:SKPayment) :Void;

// Asynchronous.  Will add completed transactions for the current user back to the queue to be re-completed.  User will be asked to authenticate.  Observers will receive 0 or more -paymentQueue:updatedTransactions:, followed by either -paymentQueueRestoreCompletedTransactionsFinished: on success or -paymentQueue:restoreCompletedTransactionsFailedWithError: on failure.  In the case of partial success, some transactions may still be delivered.
	public function restoreCompletedTransactions () :Void;

// Asynchronous.  Remove a finished (i.e. failed or completed) transaction from the queue.  Attempting to finish a purchasing transaction will throw an exception.
	public function finishTransaction (transaction:SKPaymentTransaction) :Void;

// Asynchronous.  Start the given downloads (SKDownload).
	public function startDownloads (downloads:Array<SKDownload>) :Void;

// Asynchronous.  Pause/resume downloads (SKDownload).
	public function pauseDownloads (downloads:Array<SKDownload>) :Void;
	public function resumeDownloads (downloads:Array<SKDownload>) :Void;

// Asynchronous.  Cancel downloads (SKDownload)
	public function cancelDownloads (downloads:Array<SKDownload>) :Void;

// Observers are not retained.  The transactions array will only be synchronized with the server while the queue has observers.  This may require that the user authenticate.
	public function addTransactionObserver (observer:SKPaymentTransactionObserver) :Void;
	public function removeTransactionObserver (observer:SKPaymentTransactionObserver) :Void;

// Array of unfinished SKPaymentTransactions.  Only valid while the queue has observers.  Updated asynchronously.
	public var transactions (default, null) :Array<SKPaymentTransactions>;

}


extern interface SKPaymentTransactionObserver {
//@required
// Sent when the transaction array has changed (additions or state changes).  Client should check state of transactions and finish as appropriate.
	public function paymentQueue (queue:SKPaymentQueue, updatedTransactions:Array<SKPaymentTransactions>) :Void;

//@optional
// Sent when transactions are removed from the queue (via finishTransaction:).
//	public function paymentQueue (queue:SKPaymentQueue, removedTransactions:Array<SKPaymentTransactions>) :Void;

// Sent when an error is encountered while adding transactions from the user's purchase history back to the queue.
//	public function paymentQueue (queue:SKPaymentQueue, restoreCompletedTransactionsFailedWithError:NSError) :Void;

// Sent when all transactions from the user's purchase history have successfully been added back to the queue.
//	public function paymentQueueRestoreCompletedTransactionsFinished (queue:SKPaymentQueue) :Void;

// Sent when the download state has changed.
//	public function paymentQueue (queue:SKPaymentQueue, updatedDownloads:Array<SKDownload>) :Void;

}
