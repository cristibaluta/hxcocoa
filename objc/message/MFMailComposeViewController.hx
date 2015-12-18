package objc.message;

import objc.foundation.UINavigationController;
import objc.foundation.NSData;


extern enum MFMailComposeResult {
    MFMailComposeResultCancelled;
    MFMailComposeResultSaved;
    MFMailComposeResultSent;
    MFMailComposeResultFailed;
}
//extern NSString *const MFMailComposeErrorDomain __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0);

extern enum MFMailComposeErrorCode {
    MFMailComposeErrorCodeSaveFailed;
    MFMailComposeErrorCodeSendFailed;
}


extern interface MFMailComposeViewControllerDelegate {
	public function mailComposeController (controller:MFMailComposeViewController, didFinishWithResult:MFMailComposeResult, error:NSError) :Void;
}

extern class MFMailComposeViewController extends UINavigationController {

	public static function canSendMail :Bool;

	public var mailComposeDelegate :MFMailComposeViewControllerDelegate;

	public function setSubject (subject:String) :Void;
	public function setToRecipients (toRecipients:Array<String>) :Void;
	public function setCcRecipients (ccRecipients:Array<String>) :Void;
	public function setBccRecipients (bccRecipients:Array<String>) :Void;
	public function setMessageBody (body:String, isHTML:Bool) :Void;
	public function addAttachmentData (attachment:NSData, mimeType:String, fileName:String) :Void;
}
