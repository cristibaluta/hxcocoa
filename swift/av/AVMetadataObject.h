/*
	File:  AVMetadataObject.h
 
	Framework:  AVFoundation
 
	Copyright 2012 Apple Inc. All rights reserved.
*/

#import <AVFoundation/AVBase.h>
#import <Foundation/Foundation.h>
#import <CoreMedia/CMTime.h>
#import <CoreGraphics/CGGeometry.h>

@class AVMetadataObjectInternal;

/*!
 @class AVMetadataObject
 @abstract
    AVMetadataObject is an abstract class that defines an interface for a metadata object used by AVFoundation.
 
 @discussion
    AVMetadataObject provides an abstract interface for metadata associated with a piece of media.  One example 
    is face metadata that might be detected in a picture. All metadata objects have a time, duration, bounds, and type.
 
    The concrete AVMetadataFaceObject is used by AVCaptureMetadataOutput for face detection.
*/
NS_CLASS_AVAILABLE(NA, 6_0)
extern class AVMetadataObject extends NSObject
{
	AVMetadataObjectInternal *_objectInternal;
}

/*!
 	public var  time
 @abstract
    The media time associated with this metadata object.
 
 @discussion
    The value of this property is a CMTime associated with the metadata object. For capture, it is the time at 
	which this object was captured. If this metadata object originates from a CMSampleBuffer, its time matches
    the sample buffer's presentation time. This property may return kCMTimeInvalid.
*/
	public var  (default, null) extends CMTime time;

/*!
 	public var  duration
 @abstract
    The media duration associated with this metadata object.
 
 @discussion
    The value of this property is a CMTime representing the duration of the metadata object. If this metadata 
    object originates from a CMSampleBuffer, its duration matches the sample buffer's duration. This property 
    may return kCMTimeInvalid.
*/
	public var  (default, null) extends CMTime duration;

/*!
 	public var  bounds
 @abstract
    The bounding rectangle of the receiver.
 
 @discussion
    The value of this property is a CGRect representing the bounding rectangle of the object with respect to the 
    picture in which it resides.  The rectangle's origin is top left.  If the metadata originates from video, bounds 
    may be expressed as scalar values from 0. - 1.  If the original video has been scaled down, the bounds of the 
    metadata object still are meaningful.  This property may return CGRectZero if the metadata has no bounds.
*/
	public var  (default, null) extends CGRect bounds;

/*!
 	public var  type
 @abstract
    An identifier for the metadata object.
 
 @discussion
    The value of this property is an NSString representing the type of the metadata object.  Clients inspecting
    a collection of metadata objects can use this property to filter objects with a matching type.
*/
	public var  (default, null) extends NSString *type;

}

/*!
 @constant AVMetadataObjectTypeFace
 @abstract An identifier for an instance of AVMetadataFaceObject.
 @discussion
    AVMetadataFaceObject objects return this constant as their type.
*/
AVF_EXPORT NSString *const AVMetadataObjectTypeFace;

@class AVMetadataFaceObjectInternal;

/*!
 @class AVMetadataFaceObject
 @abstract
    AVMetadataFaceObject is a concrete subclass of AVMetadataObject defining the features of a detected face.
 
 @discussion
    AVMetadataFaceObject represents a single detected face in a picture.  It is an immutable object
    describing the various features found in the face.

    On supported platforms, AVCaptureMetadataOutput outputs arrays of detected face objects.  See AVCaptureMetadataOutput.h.
*/
NS_CLASS_AVAILABLE(NA, 6_0)
extern class AVMetadataFaceObject extends AVMetadataObject
{
	AVMetadataFaceObjectInternal *_internal;
}

/*!
 	public var  faceID
 @abstract
    A unique number associated with the receiver.
 
 @discussion
    The value of this property is an NSInteger indicating the unique identifier of this face in the picture.
    When a new face enters the picture, it is assigned a new unique identifier.  faceIDs are not re-used as
    faces leave the picture and new ones enter.  Faces that leave the picture then re-enter are assigned
    a new faceID.
*/
	public var  (default, null) extends NSInteger faceID;

/*!
 	public var  hasRollAngle
 @abstract
    A BOOL indicating whether the rollAngle property is valid for this receiver.
 
 @discussion
*/
	public var  (default, null) extends BOOL hasRollAngle;

/*!
 	public var  rollAngle
 @abstract
    The roll angle of the face in degrees.
 
 @discussion
    The value of this property is a Float indicating the face's angle of roll (or tilt) in degrees.
    A value of 0.0 indicates that the face is level in the picture.  If -hasRollAngle returns NO,
    then reading this property throws an NSGenericException.
*/
	public var  (default, null) extends Float rollAngle;

/*!
 	public var  hasYawAngle
 @abstract
    A BOOL indicating whether the yawAngle property is valid for this receiver.
 
 @discussion
*/
	public var  (default, null) extends BOOL hasYawAngle;

/*!
 	public var  yawAngle
 @abstract
    The yaw angle of the face in degrees.
 
 @discussion
    The value of this property is a Float indicating the face's angle of yaw (or turn) in degrees.
    A value of 0.0 indicates that the face is straight on in the picture.  If -hasYawAngle returns NO,
    then reading this property throws an NSGenericException.
*/
	public var  (default, null) extends Float yawAngle;

}
