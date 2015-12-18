package objc.message;

enum MessageComposeResult {
    MessageComposeResultCancelled;
    MessageComposeResultSent;
    MessageComposeResultFailed;
}


//extern NSString *const MFMessageComposeViewControllerTextMessageAvailabilityDidChangeNotification __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_5_0);

//extern NSString *const MFMessageComposeViewControllerTextMessageAvailabilityKey __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_5_0);

extern class MFMessageComposeViewController extends UINavigationController {
	
	public static function canSendText () :Bool;

	public static var messageComposeDelegate :MFMessageComposeViewControllerDelegate;
	public static var recipients :Array<String>;
	public static var body :String;

}

extern interface MFMessageComposeViewControllerDelegate {
	public function messageComposeViewController (controller:MFMessageComposeViewController, didFinishWithResult:MessageComposeResult) :Void;
}
