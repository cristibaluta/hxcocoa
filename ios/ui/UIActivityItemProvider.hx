//
//  UIActivityItemProvider.h
package ios.ui;
import swift.foundation.NSOperation;

@:framework("UIKit")
extern interface UIActivityItemSource {

	public function activityViewControllerPlaceholderItem (activityViewController:UIActivityViewController) :UIActivityItemSource;
	public function activityViewController (activityViewController:UIActivityViewController, itemForActivityType:String) :UIActivityItemSource;	// called to fetch data

}

@:framework("UIKit")
@:require(6_0)
extern class UIActivityItemProvider extends NSOperation {

	public function initWithPlaceholderItem (placeholderItem:Dynamic) :UIActivityItemProvider;

	public var placeholderItem (default, null) :Dynamic;  // return item from init
	public var activityType (default, null) :String;      // Activity type available when -item is called. nil at other times.

	public function item () :Dynamic;// called by -main when data is needed. default returns nil. Subclass to override and call status/progress. called on secondary thread
}
