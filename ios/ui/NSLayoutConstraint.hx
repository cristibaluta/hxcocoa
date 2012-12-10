package ios.ui;
import objc.foundation.NSObject;
import objc.foundation.NSDictionary;
import objc.graphics.CGGeometry;

typedef NSLayoutRelation = Int;
/*    NSLayoutRelationLessThanOrEqual = -1,
    NSLayoutRelationEqual = 0,
    NSLayoutRelationGreaterThanOrEqual = 1,
};
*/
typedef NSLayoutAttribute = Int;
/*    NSLayoutAttributeLeft = 1,
    NSLayoutAttributeRight,
    NSLayoutAttributeTop,
    NSLayoutAttributeBottom,
    NSLayoutAttributeLeading,
    NSLayoutAttributeTrailing,
    NSLayoutAttributeWidth,
    NSLayoutAttributeHeight,
    NSLayoutAttributeCenterX,
    NSLayoutAttributeCenterY,
    NSLayoutAttributeBaseline,
    
    NSLayoutAttributeNotAnAttribute = 0
};
*/
typedef NSLayoutFormatOptions = Int;
/*    NSLayoutFormatAlignAllLeft = (1 << NSLayoutAttributeLeft),
    NSLayoutFormatAlignAllRight = (1 << NSLayoutAttributeRight),
    NSLayoutFormatAlignAllTop = (1 << NSLayoutAttributeTop),
    NSLayoutFormatAlignAllBottom = (1 << NSLayoutAttributeBottom),
    NSLayoutFormatAlignAllLeading = (1 << NSLayoutAttributeLeading),
    NSLayoutFormatAlignAllTrailing = (1 << NSLayoutAttributeTrailing),
    NSLayoutFormatAlignAllCenterX = (1 << NSLayoutAttributeCenterX),
    NSLayoutFormatAlignAllCenterY = (1 << NSLayoutAttributeCenterY),
    NSLayoutFormatAlignAllBaseline = (1 << NSLayoutAttributeBaseline),
    
    NSLayoutFormatAlignmentMask = 0xFFFF,
    
		//choose only one of these three
    NSLayoutFormatDirectionLeadingToTrailing = 0 << 16, // default
    NSLayoutFormatDirectionLeftToRight = 1 << 16,
    NSLayoutFormatDirectionRightToLeft = 2 << 16,  
    
    NSLayoutFormatDirectionMask = 0x3 << 16,  
};

enum {
    UILayoutPriorityRequired = 1000, // a required constraint.  Do not exceed this.
    UILayoutPriorityDefaultHigh = 750, // this is the priority level with which a button resists compressing its content.
    UILayoutPriorityDefaultLow = 250, // this is the priority level at which a button hugs its contents horizontally.  
    UILayoutPriorityFittingSizeLevel = 50, 
};*/
typedef UILayoutPriority = Float;
	

@:require(ios_6_0)extern class NSLayoutConstraint extends NSObject {
	
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

