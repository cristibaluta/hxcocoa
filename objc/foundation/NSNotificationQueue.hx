package objc.foundation;


extern class NSNotificationQueue extends NSObject {

	//Constants
	inline public static var NSPostWhenIdle = 1;
	inline public static var NSPostASAP = 2;
	inline public static var NSPostNow = 3;

	inline public static var NSNotificationNoCoalescing = 0;
	inline public static var NSNotificationCoalescingOnName = 1;
	inline public static var NSNotificationCoalescingOnSender = 2;
	
	//Static Methods
	public static function defaultQueue():NSNotificationQueue;

	//Properties

	//Methods
	public  function enqueueNotification(notification:NSNotification, postingStyle:NSPostingStyle) :Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function enqueueNotification1( notification:NSNotification, postingStyle:NSPostingStyle, coalesceMask:Int, forModes:Array<>) :Void;
	public  function dequeueNotificationsMatching(notification:NSNotification, coalesceMask:Int) :Void;
	
	public  function initWithNotificationCenter(notificationCenter:NSNotificationCenter) :NSNotificationQueue;
}
