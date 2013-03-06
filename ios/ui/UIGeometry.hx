package ios.ui;


@:framework("UIKit")
extern class UIEdgeInsets {
	public var top :Float;
	public var left :Float;
	public var bottom :Float;
	public var right :Float;
    public function new (top:Float, left:Float, bottom:Float, right:Float) :Void;
}

@:framework("UIKit")
extern class UIOffset {
	public var horizontal :Float;
	public var vertical :Float;
	public function new (horizontal:Float, vertical:Float) :Void;
}

/*UIKIT_STATIC_INLINE UIEdgeInsets UIEdgeInsetsMake(Float top, Float left, Float bottom, Float right) {
    UIEdgeInsets insets = {top, left, bottom, right};
    return insets;
}

UIKIT_STATIC_INLINE CGRect UIEdgeInsetsInsetRect(CGRect rect, UIEdgeInsets insets) {
    rect.origin.x    += insets.left;
    rect.origin.y    += insets.top;
    rect.size.width  -= (insets.left + insets.right);
    rect.size.height -= (insets.top  + insets.bottom);
    return rect;
}

UIKIT_STATIC_INLINE UIOffset UIOffsetMake(Float horizontal, Float vertical) {
    UIOffset offset = {horizontal, vertical};
    return offset;
}

UIKIT_STATIC_INLINE BOOL UIEdgeInsetsEqualToEdgeInsets(UIEdgeInsets insets1, UIEdgeInsets insets2) {
    return insets1.left == insets2.left && insets1.top == insets2.top && insets1.right == insets2.right && insets1.bottom == insets2.bottom;
}

UIKIT_STATIC_INLINE BOOL UIOffsetEqualToOffset(UIOffset offset1, UIOffset offset2) {
    return offset1.horizontal == offset2.horizontal && offset1.vertical == offset2.vertical;
}

UIKIT_EXTERN const UIEdgeInsets UIEdgeInsetsZero;
UIKIT_EXTERN const UIOffset UIOffsetZero;

UIKIT_EXTERN NSString *NSStringFromCGPoint(CGPoint point);
UIKIT_EXTERN NSString *NSStringFromCGSize(CGSize size);
UIKIT_EXTERN NSString *NSStringFromCGRect(CGRect rect);
UIKIT_EXTERN NSString *NSStringFromCGAffineTransform(CGAffineTransform transform);
UIKIT_EXTERN NSString *NSStringFromUIEdgeInsets(UIEdgeInsets insets);
UIKIT_EXTERN NSString *NSStringFromUIOffset(UIOffset offset);

UIKIT_EXTERN CGPoint CGPointFromString(NSString *string);
UIKIT_EXTERN CGSize CGSizeFromString(NSString *string);
UIKIT_EXTERN CGRect CGRectFromString(NSString *string);
UIKIT_EXTERN CGAffineTransform CGAffineTransformFromString(NSString *string);
UIKIT_EXTERN UIEdgeInsets UIEdgeInsetsFromString(NSString *string);
UIKIT_EXTERN UIOffset UIOffsetFromString(NSString *string);*/

/*extern class NSValue (NSValueUIGeometryExtensions)

+ (NSValue *)valueWithCGPoint:(CGPoint)point;
+ (NSValue *)valueWithCGSize:(CGSize)size;
+ (NSValue *)valueWithCGRect:(CGRect)rect;
+ (NSValue *)valueWithCGAffineTransform:(CGAffineTransform)transform;
+ (NSValue *)valueWithUIEdgeInsets:(UIEdgeInsets)insets;
+ (NSValue *)valueWithUIOffset:(UIOffset)insets NS_AVAILABLE_IOS(5_0);

- (CGPoint)CGPointValue;
- (CGSize)CGSizeValue;
- (CGRect)CGRectValue;
- (CGAffineTransform)CGAffineTransformValue;
- (UIEdgeInsets)UIEdgeInsetsValue;
- (UIOffset)UIOffsetValue NS_AVAILABLE_IOS(5_0);

}
    
extern class NSCoder (UIGeometryKeyedCoding)

	public function encodeCGPoint:(CGPoint)point forKey:(NSString *)key;
	public function encodeCGSize:(CGSize)size forKey:(NSString *)key;
	public function encodeCGRect:(CGRect)rect forKey:(NSString *)key;
	public function encodeCGAffineTransform:(CGAffineTransform)transform forKey:(NSString *)key;
	public function encodeUIEdgeInsets:(UIEdgeInsets)insets forKey:(NSString *)key;
	public function encodeUIOffset:(UIOffset)offset forKey:(NSString *)key NS_AVAILABLE_IOS(5_0);

- (CGPoint)decodeCGPointForKey:(NSString *)key;
- (CGSize)decodeCGSizeForKey:(NSString *)key;
- (CGRect)decodeCGRectForKey:(NSString *)key;
- (CGAffineTransform)decodeCGAffineTransformForKey:(NSString *)key;
- (UIEdgeInsets)decodeUIEdgeInsetsForKey:(NSString *)key;
- (UIOffset)decodeUIOffsetForKey:(NSString *)key NS_AVAILABLE_IOS(5_0);

}*/
