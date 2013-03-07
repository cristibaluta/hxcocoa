package objc.image;

import objc.foundation.NSObject;


@:framework("CoreImage")
extern class CIFeature extends NSObject {

/** The type of the feature. */
	public var (default, null) type :String;
/** The bounds of the feature in the image it was detected in. */
	public var (default, null) bounds :CGRect;

}


/** Specifies the type of a feature that is a face. */
//CORE_IMAGE_EXPORT NSString* const CIFeatureTypeFace;


/** A face feature found by a CIDetector.
 All positions are relative to the original image. */

@:framework("CoreImage")
extern class CIFaceFeature extends CIFeature {

/** coordinates of various cardinal points within a face.
 
 Note that the left eye is the eye on the left side of the face
 from the observer's perspective. It is not the left eye from
 the subject's perspective. */

	public var (default, null) hasLeftEyePosition :Bool;
	public var (default, null) leftEyePosition :CGPoint;
	public var (default, null) hasRightEyePosition :Bool;
	public var (default, null) rightEyePosition :CGPoint;
	public var (default, null) hasMouthPosition :Bool;
	public var (default, null) mouthPosition :CGPoint;

	public var (default, null) hasTrackingID :Bool;
	public var (default, null) trackingID :Int;
	public var (default, null) hasTrackingFrameCount :Bool;
	public var (default, null) trackingFrameCount :Int;

}

