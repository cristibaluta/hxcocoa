package ios.coreimage;

import swift.foundation.NSObject;
import swift.graphics.CGGeometry;


@:framework("CoreImage")
extern class CIFeature extends NSObject {

/** The type of the feature. */
public var type (get, null) :String;
/** The bounds of the feature in the image it was detected in. */
public var bounds (get, null) :CGRect;

/** Specifies the type of a feature that is a face. */
inline public static var CIFeatureTypeFace :String;

}

/** A face feature found by a CIDetector.
 All positions are relative to the original image. */
@:framework("CoreImage")
extern class CIFaceFeature extends CIFeature {

/** coordinates of various cardinal points within a face.
 
 Note that the left eye is the eye on the left side of the face
 from the observer's perspective. It is not the left eye from
 the subject's perspective. */

public var hasLeftEyePosition (get, null) :Bool;
public var leftEyePosition (get, null) :CGPoint;
public var hasRightEyePosition (get, null) :Bool;
public var rightEyePosition (get, null) :CGPoint;
public var hasMouthPosition (get, null) :Bool;
public var mouthPosition (get, null) :CGPoint;

public var hasTrackingID (get, null) :Bool;
public var trackingID (get, null) :Int;
public var hasTrackingFrameCount (get, null) :Bool;
public var trackingFrameCount (get, null) :Int ;

}