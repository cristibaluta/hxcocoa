package ios.ui;
import ios.ui.UIActivityItemProvider;

@:framework("UIKit")
@:require(6_0)
extern class UIActivityViewController extends UIViewController {

public function initWithActivityItems (activityItems:Array<UIActivityItemSource>, applicationActivities:Array<UIActivityItemSource>) :UIActivityViewController;

public var completionHandler :String->Bool->Void;  // set to nil after call
public var excludedActivityTypes :Array<UIActivityItemSource>; // default is nil. activity types listed will not be displayed

}
