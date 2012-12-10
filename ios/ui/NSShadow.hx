//
//  NSShadow.h
package ios.ui;

import objc.foundation.Foundation;
import objc.graphics.CGGeometry;

/*
 NSShadow stores the properties of a drop shadow for drawing text.
 To set a shadow on an NSAttributedString use it as a value for NSShadowAttributeName.
 */

@:require(ios_6_0) extern class NSShadow extends NSObject, implements NSCopying, implements NSCoding {

	public var shadowOffset :CGSize; // offset in user space of the shadow from the original drawing
	public var shadowBlurRadius :Float; // blur radius of the shadow in default user space units
	public var shadowColor :Dynamic; // color used for the shadow (default is black with an alpha value of 1/3)

}
