//
//  UIGraphics.h
package ios.ui;

@:framework("UIKit")
extern class UIGeometry {
	
@:c public static function UIGraphicsGetCurrentContext() :CGContextRef;
@:c public static function UIGraphicsPushContext(context:CGContextRef) :Void;
@:c public static function UIGraphicsPopContext() :Void;

@:c public static function UIRectFillUsingBlendMode(CGRect rect, CGBlendMode blendMode);
@:c public static function UIRectFill(CGRect rect);

@:c public static function UIRectFrameUsingBlendMode(CGRect rect, CGBlendMode blendMode);
@:c public static function UIRectFrame(CGRect rect);

@:c public static function UIRectClip(CGRect rect);

// UIImage context

@:c public static function UIGraphicsBeginImageContext(CGSize size);
@:c public static function UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, Float scale) NS_AVAILABLE_IOS(4_0);
UIKIT_EXTERN UIImage* UIGraphicsGetImageFromCurrentImageContext(void);
@:c public static function UIGraphicsEndImageContext(void); 

// PDF context

UIKIT_EXTERN BOOL UIGraphicsBeginPDFContextToFile(String *path, CGRect bounds, NSDictionary *documentInfo) NS_AVAILABLE_IOS(3_2);
@:c public static function UIGraphicsBeginPDFContextToData(NSMutableData *data, CGRect bounds, NSDictionary *documentInfo) NS_AVAILABLE_IOS(3_2);
@:c public static function UIGraphicsEndPDFContext(void) NS_AVAILABLE_IOS(3_2);

@:c public static function UIGraphicsBeginPDFPage(void) NS_AVAILABLE_IOS(3_2);
@:c public static function UIGraphicsBeginPDFPageWithInfo(CGRect bounds, NSDictionary *pageInfo) NS_AVAILABLE_IOS(3_2);

UIKIT_EXTERN CGRect UIGraphicsGetPDFContextBounds(void) NS_AVAILABLE_IOS(3_2);

@:c public static function UIGraphicsSetPDFContextURLForRect(NSURL *url, CGRect rect) NS_AVAILABLE_IOS(3_2);
@:c public static function UIGraphicsAddPDFContextDestinationAtPoint(String *name, CGPoint point) NS_AVAILABLE_IOS(3_2);
@:c public static function UIGraphicsSetPDFContextDestinationForRect(String *name, CGRect rect) NS_AVAILABLE_IOS(3_2);

}