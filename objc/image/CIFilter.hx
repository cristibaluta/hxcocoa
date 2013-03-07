package objc.image;

import objc.foundation.NSObject;
import objc.foundation.NSDictionary;
import objc.foundation.NSURL;


/* Filter attribute strings. */

/* Keys */

/** Name of the filter */
CORE_IMAGE_EXPORT NSString *kCIAttributeFilterName;

/** Name of the filter intended for UI display (eg. localized) */
CORE_IMAGE_EXPORT NSString *kCIAttributeFilterDisplayName;

/** Description of the filter intended for UI display (eg. localized) - Available in Leopard onwards. */
CORE_IMAGE_EXPORT NSString *kCIAttributeDescription __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);

/** URL for the reference documentation of the filter. See localizedReferenceDocumentationForFilterName - Available in Leopard onwards. */
CORE_IMAGE_EXPORT NSString *kCIAttributeReferenceDocumentation __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);

/** Array of filter category names (see below) */
CORE_IMAGE_EXPORT NSString *kCIAttributeFilterCategories;

/** Class name of the filter. */
CORE_IMAGE_EXPORT NSString *kCIAttributeClass;

/** The type of the attribute e.g. scalar, time, distance, etc. */
CORE_IMAGE_EXPORT NSString *kCIAttributeType;

/** Minimum value for the attribute. */
CORE_IMAGE_EXPORT NSString *kCIAttributeMin;

/** Maximum value for the attribute. */
CORE_IMAGE_EXPORT NSString *kCIAttributeMax;

/** Minimum value for the slider. */
CORE_IMAGE_EXPORT NSString *kCIAttributeSliderMin;

/** Maximum value for the slider. */
CORE_IMAGE_EXPORT NSString *kCIAttributeSliderMax;

/** Default value for the slider. */
CORE_IMAGE_EXPORT NSString *kCIAttributeDefault;

/** The identity value is the value at which the filter has no effect. */
CORE_IMAGE_EXPORT NSString *kCIAttributeIdentity;

/** The non-localized name of the attribute. */
CORE_IMAGE_EXPORT NSString *kCIAttributeName;

/** The localized name of the attribute to be used for display to the user. */
CORE_IMAGE_EXPORT NSString *kCIAttributeDisplayName;

/** Key to request the desired set of controls in a filter UIView - defined values are CIUISetBasic, CIUISetIntermediate, CIUISetAdvanced and CIUISetDevelopment. */
CORE_IMAGE_EXPORT NSString *kCIUIParameterSet __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);

/** Constant for requesting controls that are appropiate in an basic user scenario, meaning the bare minimum of settings to control the filter. */
CORE_IMAGE_EXPORT NSString *kCIUISetBasic __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);

/** Constant for requesting controls that are appropiate in an intermediate user scenario. */
CORE_IMAGE_EXPORT NSString *kCIUISetIntermediate __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);

/** Constant for requesting controls that are appropiate in an advanced user scenario. */
CORE_IMAGE_EXPORT NSString *kCIUISetAdvanced __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);

/** Constant for requesting controls that should only be visible for development purposes. */
CORE_IMAGE_EXPORT NSString *kCIUISetDevelopment __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);


/* Types for numbers */

CORE_IMAGE_EXPORT NSString *kCIAttributeTypeTime;
CORE_IMAGE_EXPORT NSString *kCIAttributeTypeScalar;
CORE_IMAGE_EXPORT NSString *kCIAttributeTypeDistance;
CORE_IMAGE_EXPORT NSString *kCIAttributeTypeAngle;
CORE_IMAGE_EXPORT NSString *kCIAttributeTypeBoolean;

/** Indicates that the key uses integer values. */
CORE_IMAGE_EXPORT NSString *kCIAttributeTypeInteger __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_5_0);


/** Indicates that the key uses non negative integer values. */
CORE_IMAGE_EXPORT NSString *kCIAttributeTypeCount __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_5_0);

/* Types for 2-element vectors */
CORE_IMAGE_EXPORT NSString *kCIAttributeTypePosition;
CORE_IMAGE_EXPORT NSString *kCIAttributeTypeOffset;

/* Types for 3-element vectors */
CORE_IMAGE_EXPORT NSString *kCIAttributeTypePosition3;

/* Types for 4-element vectors */
CORE_IMAGE_EXPORT NSString *kCIAttributeTypeRectangle;

/* Types for colors */
CORE_IMAGE_EXPORT NSString *kCIAttributeTypeColor;

/* Types for images */
CORE_IMAGE_EXPORT NSString *kCIAttributeTypeGradient  __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_NA);
CORE_IMAGE_EXPORT NSString *kCIAttributeTypeImage __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_5_0);
CORE_IMAGE_EXPORT NSString *kCIAttributeTypeTransform __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_5_0);

/* Categories */
CORE_IMAGE_EXPORT NSString *kCICategoryDistortionEffect;
CORE_IMAGE_EXPORT NSString *kCICategoryGeometryAdjustment;
CORE_IMAGE_EXPORT NSString *kCICategoryCompositeOperation;
CORE_IMAGE_EXPORT NSString *kCICategoryHalftoneEffect;
CORE_IMAGE_EXPORT NSString *kCICategoryColorAdjustment;
CORE_IMAGE_EXPORT NSString *kCICategoryColorEffect;
CORE_IMAGE_EXPORT NSString *kCICategoryTransition;
CORE_IMAGE_EXPORT NSString *kCICategoryTileEffect;
CORE_IMAGE_EXPORT NSString *kCICategoryGenerator;
CORE_IMAGE_EXPORT NSString *kCICategoryReduction __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_5_0);
CORE_IMAGE_EXPORT NSString *kCICategoryGradient;
CORE_IMAGE_EXPORT NSString *kCICategoryStylize;
CORE_IMAGE_EXPORT NSString *kCICategorySharpen;
CORE_IMAGE_EXPORT NSString *kCICategoryBlur;

CORE_IMAGE_EXPORT NSString *kCICategoryVideo;
CORE_IMAGE_EXPORT NSString *kCICategoryStillImage;
CORE_IMAGE_EXPORT NSString *kCICategoryInterlaced;
CORE_IMAGE_EXPORT NSString *kCICategoryNonSquarePixels;
CORE_IMAGE_EXPORT NSString *kCICategoryHighDynamicRange;

CORE_IMAGE_EXPORT NSString *kCICategoryApplePrivate;
CORE_IMAGE_EXPORT NSString *kCICategoryBuiltIn;
CORE_IMAGE_EXPORT NSString *kCICategoryFilterGenerator __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);

/* Keys for apply: method options. */

CORE_IMAGE_EXPORT NSString *kCIApplyOptionExtent __OSX_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_NA);
CORE_IMAGE_EXPORT NSString *kCIApplyOptionDefinition __OSX_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_NA);
CORE_IMAGE_EXPORT NSString *kCIApplyOptionUserInfo __OSX_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_NA);

/* If used, the value of the kCIApplyOptionColorSpace key be must be an RGB CGColorSpaceRef.
 * Using this option specifies that the output of the kernel is in this color space. 
 * If not specified, the output of the kernel is in the working color space of the rendering CIContext. */
CORE_IMAGE_EXPORT NSString *kCIApplyOptionColorSpace __OSX_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_NA);

/* common filter parameter keys */

CORE_IMAGE_EXPORT NSString *kCIOutputImageKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_5_0);
CORE_IMAGE_EXPORT NSString *kCIInputBackgroundImageKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_5_0);
CORE_IMAGE_EXPORT NSString *kCIInputImageKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_5_0);
CORE_IMAGE_EXPORT NSString *kCIInputTimeKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
CORE_IMAGE_EXPORT NSString *kCIInputTransformKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
CORE_IMAGE_EXPORT NSString *kCIInputScaleKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
CORE_IMAGE_EXPORT NSString *kCIInputAspectRatioKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
CORE_IMAGE_EXPORT NSString *kCIInputCenterKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
CORE_IMAGE_EXPORT NSString *kCIInputRadiusKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
CORE_IMAGE_EXPORT NSString *kCIInputAngleKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
CORE_IMAGE_EXPORT NSString *kCIInputRefractionKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
CORE_IMAGE_EXPORT NSString *kCIInputWidthKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
CORE_IMAGE_EXPORT NSString *kCIInputSharpnessKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
CORE_IMAGE_EXPORT NSString *kCIInputIntensityKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
CORE_IMAGE_EXPORT NSString *kCIInputEVKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
CORE_IMAGE_EXPORT NSString *kCIInputSaturationKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
CORE_IMAGE_EXPORT NSString *kCIInputColorKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
CORE_IMAGE_EXPORT NSString *kCIInputBrightnessKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
CORE_IMAGE_EXPORT NSString *kCIInputContrastKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
CORE_IMAGE_EXPORT NSString *kCIInputGradientImageKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
CORE_IMAGE_EXPORT NSString *kCIInputMaskImageKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
CORE_IMAGE_EXPORT NSString *kCIInputShadingImageKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
CORE_IMAGE_EXPORT NSString *kCIInputTargetImageKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
CORE_IMAGE_EXPORT NSString *kCIInputExtentKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
CORE_IMAGE_EXPORT NSString *kCIInputVersionKey __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_6_0);

/** CIFilter are filter objects for Core Image that encapsulate the filter with its attributes
 
 The CIFilter class produces a CIImage object as output. Typically, a filter takes one or more images as input. Some filters, however, generate an image based on other types of input parameters. The parameters of a CIFilter object are set and retrieved through the use of key-value pairs. You use the CIFilter object in conjunction with the CIImage, CIContext, CIVector, CIImageAccumulator, and CIColor objects to take advantage of the built-in Core Image filters when processing images. CIFilter objects are also used along with CIKernel, CISampler, and CIFilterShape objects to create custom filters. */

@:framework("CoreImage")
extern class CIFilter extends NSObject implements NSCopying {

	public var (default, null) outputImage :CIImage;

/* name of the filter */
	public function name () :String;// __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_5_0);

/** Returns an array containing the names of all inputs in the filter. */
	public function inputKeys () :Array<String>;

/** Returns an array containing the names of all outputs in the filter. */
	public function outputKeys () :Array<String>;

/** Sets all inputs to their default values (where default values are defined, other inputs are left as-is). */
	public function setDefaults () :Void;

/** Returns a dictionary containing key/value pairs describing the filter. (see description of keys below) */
	public function attributes () :NSDictionary;
	

/** Used by CIFilter subclasses to apply the array of argument values 'args' to the kernel function 'k'. The supplied arguments must be type-compatible with the function signature of the kernel.
 
 The key-value pairs defined by 'dict' (if non-nil) are used to control exactly how the kernel is evaluated. Valid keys include:
 kCIApplyOptionExtent: the size of the produced image. Value is a four element NSArray [X Y WIDTH HEIGHT].
 kCIApplyOptionDefinition: the Domain of Definition of the produced image. Value is either a CIFilterShape object, or a four element NSArray defining a rectangle.
 @param  k         CIKernel of the filter
 @param  args      Array of arguments that are applied to the kernel
 @param  options   Array of additional options
*/
	@:require(osx_10_4) public function apply (k:CIKernel, arguments:Array, options:NSDictionary) :CIImage;

/** Similar to above except that all argument values and option key-value are specified inline. The list of key-value pairs must be terminated by the 'nil' object. */
//- (CIImage *)apply:(CIKernel *)k, ... NS_REQUIRES_NIL_TERMINATION __OSX_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_NA);


/** Methods to register a filter and get access to the list of registered filters
 Use these methods to create filters and find filters. */
//extern class CIFilter (CIFilterRegistry)

/** Creates a new filter of type 'name'. All input values will be undefined. */
	public static function filterWithName (name:String) :CIFilter;

/** Creates a new filter of type 'name'.
 
 Convenience method that creates a filter objects with the specified key-value pairs set as input values on it; the argument list is terminated by a nil value.*/
	//public static function filterWithName (name:NSString, keysAndValues:) :CIFilter;//NS_REQUIRES_NIL_TERMINATION;

/** Returns an array containing all published filter names in a category. */
	public static function filterNamesInCategory (category:String) :Array<String>;

/** Returns an array containing all published filter names that belong to all listed categories. */
	public static function filterNamesInCategories (category:String) :Array<String>;


/** Publishes a new filter called 'name'.
 
 The constructor object 'anObject' should implement the filterWithName: method, it will be invoked with the name of the filter to create. The class attributes must have akCIAttributeFilterCategories key associated with a set of categories.
 @param   attributes    Dictionary of the registration attributes of the filter. See below for attribute keys.
*/
	@:require(osx_10_4) public static function registerFilterName (name:String, constructor:CIFilterConstructor, classAttributes:NSDictionary) :Void;

/** Returns the localized name of a filter for display in the UI. */
	@:require(osx_10_4) public static function localizedNameForFilterName (filterName:String) :String;

/** Returns the localized name of a category for display in the UI. */
	@:require(osx_10_4) public static function localizedNameForCategory (category:String) :String;

/** Returns the localized description of a filter for display in the UI. */
	@:require(osx_10_4) public static function localizedDescriptionForFilterName (filterName:String) :String;

/** Returns the URL to the localized reference documentation describing the filter.
    
 The URL can be a local file or a remote document on a webserver. It is possible, that this method returns nil (like filters that predate this feature). A client of this API has to handle this case gracefully. */
	@:require(osx_10_4) public static function localizedReferenceDocumentationForFilterName (filterName:String) :NSURL;

/* Given an array of filters, serialize the filters' parameters 
   into XMP form that is suitable for embedding in to an image.
   At this time the only filters classes that are serialized
   are, CIAffineTransform, CICrop, and the filters returned by 
   [CIImage autoAdjustmentFilters].  
   The parameters of other filter classes will not be serialized.
 */
	@:require(ios6_0) public static function serializedXMPFromFilters (filters:Array<CIFilter>, inputImageExtent:CGRect) :NSData;

/* Return an array of CIFilters de-serialized from XMP data.
 */
	@:require(ios6_0) public static function filterArrayFromSerializedXMP (xmpData:NSData, inputImageExtent:CGRect, error:NSError) :Array<CIFIlter>;
}
