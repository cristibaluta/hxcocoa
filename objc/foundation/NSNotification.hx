package objc.foundation;
import objc.foundation.NSObject;

extern class NSNotification extends NSObject implements NSCopying implements NSCoding {

	public function name () :String;
	public function object () :NSNotification;
	public function userInfo () :NSDictionary;

	public static function notificationWithName (aName:String, object:Dynamic) :NSNotification;
	//public static function notificationWithName (aName:String, object:Dynamic, userInfo:NSDictionary) :NSNotification;

}

/****************	Notification Center	****************/

extern class NSNotificationCenter extends NSObject {

	public static function defaultCenter () :NSNotificationCenter;
    
	public function addObserver (observer:Dynamic, selector:SEL, name:String, object:Dynamic) :Void;

	public function postNotification (notification:NSNotification) :Void;
	public function postNotificationName (aName:String, object:Dynamic) :Void;
	//public function postNotificationName (aName:String, object:Dynamic, userInfo:NSDictionary) :Void;

	public function removeObserver (observer:Dynamic) :Void;
	//public function removeObserver (observer:Dynamic, name:String, object:Dynamic) :Void;

//- (id)addObserverForName:(NSString *)name object:(id)obj queue:(NSOperationQueue *)queue usingBlock:(void (^)(NSNotification *note))block NS_AVAILABLE(10_6, 4_0);
}

