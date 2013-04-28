//
//  UIAppearance.h
package ios.ui;


@:framework("UIKit")
extern interface UIAppearance {

	//public static function appearance () :Bool;

/* To customize the appearances for instances of a class contained within an instance of a container class, or instances in a hierarchy, use +appearanceWhenContainedIn: for the appropriate appearance proxy. For example:
 
 [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil] setTintColor:myNavBarColor];
 [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], [UIPopoverController class], nil] setTintColor:myPopoverNavBarColor];
 [[UIBarButtonItem appearanceWhenContainedIn:[UIToolbar class], nil] setTintColor:myToolbarColor];
 [[UIBarButtonItem appearanceWhenContainedIn:[UIToolbar class], [UIPopoverController class], nil] setTintColor:myPopoverToolbarColor];
 
 In any given view hierarchy the outermost appearance proxy wins. Specificity (depth of the chain) is the tie-breaker.
 
 In other words, the containment statement is treated as a partial ordering. Given a concrete ordering (actual subview hierarchy), we select the partial ordering that is the first unique match when reading the actual hierarchy from the window down.

 This method will throw an exception for anything in the var-args list that is not a Class <UIAppearanceContainer>.
*/
//+ (id)appearanceWhenContainedIn:(Class <UIAppearanceContainer>)ContainerClass, ... NS_REQUIRES_NIL_TERMINATION;

}
