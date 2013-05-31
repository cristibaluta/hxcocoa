package ios.coreimage;


/* Filter attribute strings. */

extern enum CIFilterAttribute {
/* Keys */

/** Name of the filter */
kCIAttributeFilterName;

/** Name of the filter intended for UI display (eg. localized) */
kCIAttributeFilterDisplayName;

/** Description of the filter intended for UI display (eg. localized) - Available in Leopard onwards. */
kCIAttributeDescription __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);

/** URL for the reference documentation of the filter. See localizedReferenceDocumentationForFilterName - Available in Leopard onwards. */
kCIAttributeReferenceDocumentation __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);

/** Array of filter category names (see below) */
kCIAttributeFilterCategories;

/** Class name of the filter. */
kCIAttributeClass;

/** The type of the attribute e.g. scalar, time, distance, etc. */
kCIAttributeType;

/** Minimum value for the attribute. */
kCIAttributeMin;

/** Maximum value for the attribute. */
kCIAttributeMax;

/** Minimum value for the slider. */
kCIAttributeSliderMin;

/** Maximum value for the slider. */
kCIAttributeSliderMax;

/** Default value for the slider. */
kCIAttributeDefault;

/** The identity value is the value at which the filter has no effect. */
kCIAttributeIdentity;

/** The non-localized name of the attribute. */
kCIAttributeName;

/** The localized name of the attribute to be used for display to the user. */
kCIAttributeDisplayName;

/** Key to request the desired set of controls in a filter UIView - defined values are CIUISetBasic, CIUISetIntermediate, CIUISetAdvanced and CIUISetDevelopment. */
kCIUIParameterSet __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);

/** Constant for requesting controls that are appropiate in an basic user scenario, meaning the bare minimum of settings to control the filter. */
kCIUISetBasic __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);

/** Constant for requesting controls that are appropiate in an intermediate user scenario. */
kCIUISetIntermediate __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);

/** Constant for requesting controls that are appropiate in an advanced user scenario. */
kCIUISetAdvanced __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);

/** Constant for requesting controls that should only be visible for development purposes. */
kCIUISetDevelopment __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);


/* Types for numbers */

kCIAttributeTypeTime;
kCIAttributeTypeScalar;
kCIAttributeTypeDistance;
kCIAttributeTypeAngle;
kCIAttributeTypeBoolean;

/** Indicates that the key uses integer values. */
kCIAttributeTypeInteger __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_5_0);


/** Indicates that the key uses non negative integer values. */
kCIAttributeTypeCount __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_5_0);

/* Types for 2-element vectors */
kCIAttributeTypePosition;
kCIAttributeTypeOffset;

/* Types for 3-element vectors */
kCIAttributeTypePosition3;

/* Types for 4-element vectors */
kCIAttributeTypeRectangle;

/* Types for colors */
kCIAttributeTypeColor;

/* Types for images */
kCIAttributeTypeGradient  __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_NA);
kCIAttributeTypeImage __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_5_0);
kCIAttributeTypeTransform __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_5_0);

/* Categories */
kCICategoryDistortionEffect;
kCICategoryGeometryAdjustment;
kCICategoryCompositeOperation;
kCICategoryHalftoneEffect;
kCICategoryColorAdjustment;
kCICategoryColorEffect;
kCICategoryTransition;
kCICategoryTileEffect;
kCICategoryGenerator;
kCICategoryReduction __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_5_0);
kCICategoryGradient;
kCICategoryStylize;
kCICategorySharpen;
kCICategoryBlur;

kCICategoryVideo;
kCICategoryStillImage;
kCICategoryInterlaced;
kCICategoryNonSquarePixels;
kCICategoryHighDynamicRange;

kCICategoryApplePrivate;
kCICategoryBuiltIn;
kCICategoryFilterGenerator __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);

/* Keys for apply: method options. */

kCIApplyOptionExtent __OSX_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_NA);
kCIApplyOptionDefinition __OSX_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_NA);
kCIApplyOptionUserInfo __OSX_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_NA);

/* If used, the value of the kCIApplyOptionColorSpace key be must be an RGB CGColorSpaceRef.
 * Using this option specifies that the output of the kernel is in this color space. 
 * If not specified, the output of the kernel is in the working color space of the rendering CIContext. */
kCIApplyOptionColorSpace __OSX_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_NA);

/* common filter parameter keys */

kCIOutputImageKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_5_0);
kCIInputBackgroundImageKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_5_0);
kCIInputImageKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_5_0);
kCIInputTimeKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
kCIInputTransformKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
kCIInputScaleKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
kCIInputAspectRatioKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
kCIInputCenterKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
kCIInputRadiusKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
kCIInputAngleKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
kCIInputRefractionKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
kCIInputWidthKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
kCIInputSharpnessKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
kCIInputIntensityKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
kCIInputEVKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
kCIInputSaturationKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
kCIInputColorKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
kCIInputBrightnessKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
kCIInputContrastKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
kCIInputGradientImageKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
kCIInputMaskImageKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
kCIInputShadingImageKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
kCIInputTargetImageKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
kCIInputExtentKey __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
kCIInputVersionKey __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_6_0);

}

@class NSArray, NSDictionary;
@class CIKernel, CIImage;
@protocol CIFilterConstructor;

/** CIFilter are filter objects for Core Image that encapsulate the filter with its attributes
 
 The CIFilter class produces a CIImage object as output. Typically, a filter takes one or more images as input. Some filters, however, generate an image based on other types of input parameters. The parameters of a CIFilter object are set and retrieved through the use of key-value pairs. You use the CIFilter object in conjunction with the CIImage, CIContext, CIVector, CIImageAccumulator, and CIColor objects to take advantage of the built-in Core Image filters when processing images. CIFilter objects are also used along with CIKernel, CISampler, and CIFilterShape objects to create custom filters. */
CORE_IMAGE_CLASS_EXPORT
@interface CIFilter : NSObject {

@property (readonly, nonatomic) CIImage *outputImage;

/* name of the filter */
- (String*)name __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_5_0);

/** Returns an array containing the names of all inputs in the filter. */
- (NSArray *)inputKeys;

/** Returns an array containing the names of all outputs in the filter. */
- (NSArray *)outputKeys;

/** Sets all inputs to their default values (where default values are defined, other inputs are left as-is). */
- (void)setDefaults;

/** Returns a dictionary containing key/value pairs describing the filter. (see description of keys below) */
- (NSDictionary *)attributes;
	

/** Used by CIFilter subclasses to apply the array of argument values 'args' to the kernel function 'k'. The supplied arguments must be type-compatible with the function signature of the kernel.
 
 The key-value pairs defined by 'dict' (if non-nil) are used to control exactly how the kernel is evaluated. Valid keys include:
 kCIApplyOptionExtent: the size of the produced image. Value is a four element NSArray [X Y WIDTH HEIGHT].
 kCIApplyOptionDefinition: the Domain of Definition of the produced image. Value is either a CIFilterShape object, or a four element NSArray defining a rectangle.
 @param  k         CIKernel of the filter
 @param  args      Array of arguments that are applied to the kernel
 @param  options   Array of additional options
*/
- (CIImage *)apply:(CIKernel *)k
		 arguments:(NSArray *)args
		   options:(NSDictionary *)dict __OSX_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_NA);

/** Similar to above except that all argument values and option key-value are specified inline. The list of key-value pairs must be terminated by the 'nil' object. */
- (CIImage *)apply:(CIKernel *)k, ... NS_REQUIRES_NIL_TERMINATION __OSX_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_NA);

@end


/** Methods to register a filter and get access to the list of registered filters
 Use these methods to create filters and find filters. */
@interface CIFilter (CIFilterRegistry)

/** Creates a new filter of type 'name'. All input values will be undefined. */
+ (CIFilter *) filterWithName:(String *) name;

/** Creates a new filter of type 'name'.
 
 Convenience method that creates a filter objects with the specified key-value pairs set as input values on it; the argument list is terminated by a nil value.*/
+ (CIFilter *)filterWithName:(String *)name keysAndValues:key0, ... NS_REQUIRES_NIL_TERMINATION;

/** Returns an array containing all published filter names in a category. */
+ (NSArray *)filterNamesInCategory:(String *)category;

/** Returns an array containing all published filter names that belong to all listed categories. */
+ (NSArray *)filterNamesInCategories:(NSArray *)categories;


/** Publishes a new filter called 'name'.
 
 The constructor object 'anObject' should implement the filterWithName: method, it will be invoked with the name of the filter to create. The class attributes must have akCIAttributeFilterCategories key associated with a set of categories.
 @param   attributes    Dictionary of the registration attributes of the filter. See below for attribute keys.
*/
+ (void)registerFilterName:(String *)name
			   constructor:(id<CIFilterConstructor>)anObject
		   classAttributes:(NSDictionary *)attributes __OSX_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_NA);

/** Returns the localized name of a filter for display in the UI. */
+ (String *)localizedNameForFilterName:(String *)filterName __OSX_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_NA);

/** Returns the localized name of a category for display in the UI. */
+ (String *)localizedNameForCategory:(String *)category __OSX_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_NA);

/** Returns the localized description of a filter for display in the UI. */
+ (String *)localizedDescriptionForFilterName:(String *)filterName __OSX_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_NA);

/** Returns the URL to the localized reference documentation describing the filter.
    
 The URL can be a local file or a remote document on a webserver. It is possible, that this method returns nil (like filters that predate this feature). A client of this API has to handle this case gracefully. */
+ (NSURL *)localizedReferenceDocumentationForFilterName:(String *)filterName __OSX_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_NA);

/* Given an array of filters, serialize the filters' parameters 
   into XMP form that is suitable for embedding in to an image.
   At this time the only filters classes that are serialized
   are, CIAffineTransform, CICrop, and the filters returned by 
   [CIImage autoAdjustmentFilters].  
   The parameters of other filter classes will not be serialized.
 */
+ (NSData*)serializedXMPFromFilters:(NSArray *)filters
                   inputImageExtent:(CGRect)extent
   __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_6_0);

/* Return an array of CIFilters de-serialized from XMP data.
 */
+ (NSArray*)filterArrayFromSerializedXMP:(NSData *)xmpData
                        inputImageExtent:(CGRect)extent
                                   error:(NSError **)outError
   __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_6_0);

@end
