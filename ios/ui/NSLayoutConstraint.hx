package ios.ui;

import objc.foundation.NSObject;
import objc.foundation.NSDictionary;
import objc.graphics.CGGeometry;

extern enum NSLayoutRelation {
    NSLayoutRelationLessThanOrEqual;
    NSLayoutRelationEqual;
    NSLayoutRelationGreaterThanOrEqual;
}
extern enum NSLayoutAttribute {
    NSLayoutAttributeLeft;
    NSLayoutAttributeRight;
    NSLayoutAttributeTop;
    NSLayoutAttributeBottom;
    NSLayoutAttributeLeading;
    NSLayoutAttributeTrailing;
    NSLayoutAttributeWidth;
    NSLayoutAttributeHeight;
    NSLayoutAttributeCenterX;
    NSLayoutAttributeCenterY;
    NSLayoutAttributeBaseline;
    
    NSLayoutAttributeNotAnAttribute;
}
extern enum NSLayoutFormatOptions {
    NSLayoutFormatAlignAllLeft;
    NSLayoutFormatAlignAllRight;
    NSLayoutFormatAlignAllTop;
    NSLayoutFormatAlignAllBottom;
    NSLayoutFormatAlignAllLeading;
    NSLayoutFormatAlignAllTrailing;
    NSLayoutFormatAlignAllCenterX;
    NSLayoutFormatAlignAllCenterY;
    NSLayoutFormatAlignAllBaseline;
    
    NSLayoutFormatAlignmentMask;
    
	//choose only one of these three
    NSLayoutFormatDirectionLeadingToTrailing;
    NSLayoutFormatDirectionLeftToRight;
    NSLayoutFormatDirectionRightToLeft; 
    
    NSLayoutFormatDirectionMask; 
}
extern enum UILayoutPriority {
    UILayoutPriorityRequired; // a required constraint.  Do not exceed this.
    UILayoutPriorityDefaultHigh; // this is the priority level with which a button resists compressing its content.
    UILayoutPriorityDefaultLow; // this is the priority level at which a button hugs its contents horizontally.  
    UILayoutPriorityFittingSizeLevel;
}
	

@:framework("UIKit")
@:require(ios6)
extern class NSLayoutConstraint extends NSObject {
	
	public static function constraintsWithVisualFormat (format:String, options:NSLayoutFormatOptions, metrics:NSDictionary, views:NSDictionary) :Array<NSLayoutConstraint>;
	public static function constraintWithItem (view1:Dynamic, attribute:NSLayoutAttribute, relatedBy:NSLayoutRelation, toItem:Dynamic, attribute:NSLayoutAttribute, multiplier:Float, constant:Float) :NSLayoutConstraint;

	public var priority :UILayoutPriority;

	public var shouldBeArchived :Bool;

	public var firstItem (default, null) :Dynamic;
	public var firstAttribute (default, null) :NSLayoutAttribute;
	public var relation (default, null) :NSLayoutRelation;
	public var secondItem (default, null) :Dynamic;
	public var secondAttribute (default, null) :NSLayoutAttribute;
	public var multiplier (default, null) :Float;

	public var constant :Float;

}

