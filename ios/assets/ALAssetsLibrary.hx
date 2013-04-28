//
//  ALAssetsLibrary.h
//  AssetsLibrary
//
//  Copyright 2010 Apple Inc. All rights reserved.
//
/*
 *
 * This class represents the set of all videos and photos that are under the control of the Photos application. This includes
 * those that are in the saved photos album and those coming from iTunes.
 * It is used to retrieve the list of all asset groups and to save images and videos into the Saved Photos album.
 *
 */
package ios.assets;

import objc.foundation.NSError;
import objc.foundation.NSURL;
import objc.foundation.NSObject;
import objc.foundation.NSDictionary;
import objc.foundation.NSData;
import objc.graphics.CGImage;

@:framework("AssetsLibrary")
extern enum ALAssetOrientation {
    ALAssetOrientationUp;            // default orientation
    ALAssetOrientationDown;          // 180 deg rotation
    ALAssetOrientationLeft;          // 90 deg CCW
    ALAssetOrientationRight;         // 90 deg CW
    ALAssetOrientationUpMirrored;    // as above but image mirrored along other axis. horizontal flip
    ALAssetOrientationDownMirrored;  // horizontal flip
    ALAssetOrientationLeftMirrored;  // vertical flip
    ALAssetOrientationRightMirrored; // vertical flip
}


@:framework("AssetsLibrary")
extern enum ALAssetsGroupType {
    ALAssetsGroupLibrary;         // The Library group that includes all assets.
    ALAssetsGroupAlbum;         // All the albums synced from iTunes or created on the device.
    ALAssetsGroupEvent;         // All the events synced from iTunes.
    ALAssetsGroupFaces;         // All the faces albums synced from iTunes.
    ALAssetsGroupSavedPhotos;         // The Saved Photos album.
    ALAssetsGroupPhotoStream;         // The PhotoStream album.
    ALAssetsGroupAll;       // The same as ORing together all the available group types, 
                                                    // with the exception that ALAssetsGroupLibrary is not included.
}


@:framework("AssetsLibrary")
@:require(ios6_0)
extern enum ALAuthorizationStatus {
    ALAuthorizationStatusNotDetermined; // User has not yet made a choice with regards to this application
    ALAuthorizationStatusRestricted;        // This application is not authorized to access photo data.
                                            // The user cannot change this application’s status, possibly due to active restrictions
                                            //  such as parental controls being in place.
    ALAuthorizationStatusDenied;            // User has explicitly denied this application access to photos data.
    ALAuthorizationStatusAuthorized;         // User has authorized this application to access photos data.
}


// This block is executed when a match is found during enumeration. The match is passed to the block in the group argument.
// When the enumeration is done, the block will be called with group set to nil.
// Setting the output argument stop to YES will finish the enumeration.
@:framework("AssetsLibrary")
typedef ALAssetsLibraryGroupsEnumerationResultsBlock = ALAssetsGroup->Bool->Void;

// This block is executed if the user has granted access to the caller to access the data managed by the framework.
// If the asset is not found, asset is nil.
@:framework("AssetsLibrary")
typedef ALAssetsLibraryAssetForURLResultBlock = ALAsset->Void;

// This block is executed if the user has granted access to the caller to access the data managed by the framework.
// If the group is not found, group is nil.
@:framework("AssetsLibrary")
@:require(ios5_0)
typedef ALAssetsLibraryGroupResultBlock = ALAssetsGroup->Void;

// This block is executed if the user does not grant access to the caller to access the data managed by the framework or if the data is currently unavailable.
@:framework("AssetsLibrary")
typedef ALAssetsLibraryAccessFailureBlock = NSError->Void;

// This block is executed when saving an image by -writeImageToSavedPhotosAlbum:completionBlock: finishes. The assetURL can later be used to reference the saved image.
@:framework("AssetsLibrary")
typedef ALAssetsLibraryWriteImageCompletionBlock = NSURL->NSError->Void;
// This block is executed when saving a video by -writeVideoAtPathToSavedPhotosAlbum:completionBlock: finishes. The assetURL can later be used to reference the saved video.
@:framework("AssetsLibrary")
typedef ALAssetsLibraryWriteVideoCompletionBlock = NSURL->NSError->Void;



@:framework("AssetsLibrary")
extern class ALAssetsLibrary extends NSObject {

// Get the list of groups that match the given types. Multiple types can be ORed together. The results are passed one by one to the caller by executing the enumeration block.
// When the enumeration is done, 'enumerationBlock' will be called with group set to nil.
// When groups are enumerated, the user may be asked to confirm the application's access to the data. If the user denies access to the application or if no application is allowed to access the data, the failure block will be called.
// If the data is currently unavailable, the failure block will be called.
public function enumerateGroupsWithTypes (types:ALAssetsGroupType, usingBlock:ALAssetsLibraryGroupsEnumerationResultsBlock, failureBlock:ALAssetsLibraryAccessFailureBlock) :Void;

// Returns an ALAsset object in the result block for a URL previously retrieved from an ALAsset object.
// When the ALAsset is requested, the user may be asked to confirm the application's access to the data. If the user denies access to the application or if no application is allowed to access the data, the failure block will be called.
// If the data is currently unavailable, the failure block will be called.
public function assetForURL (assetURL:NSURL, resultBlock:ALAssetsLibraryAssetForURLResultBlock, failureBlock:ALAssetsLibraryAccessFailureBlock) :Void;

// Returns an ALAssetsGroup object in the result block for a URL previously retrieved from an ALAssetsGroup object.
// When the ALAssetsGroup is requested, the user may be asked to confirm the application's access to the data.  If the user denies access to the application or if no application is allowed to access the data, the failure block will be called.
// If the data is currently unavailable, the failure block will be called.
@:require(ios5_0)
public function groupForURL (groupURL:NSURL, resultBlock:ALAssetsLibraryGroupResultBlock, failureBlock:ALAssetsLibraryAccessFailureBlock) :Void;

// Add a new ALAssetsGroup to the library.
// The name of the ALAssetsGroup is name and the type is ALAssetsGroupAlbum.  The editable property of this ALAssetsGroup returns YES.
// If name conflicts with another ALAssetsGroup with the same name, then the group is not created and the result block returns a nil group.
// When the ALAssetsGroup is added, the user may be asked to confirm the application's access to the data.  If the user denies access to the application or if no application is allowed to access the data, the failure block will be called.
// If the data is currently unavailable, the failure block will be called.
@:require(ios5_0)
public function addAssetsGroupAlbumWithName (name:String, resultBlock:ALAssetsLibraryGroupResultBlock, failureBlock:ALAssetsLibraryAccessFailureBlock) :Void;

// These methods can be used to add photos or videos to the saved photos album.

// With a UIImage, the API user can use -[UIImage CGImage] to get a CGImageRef, and cast -[UIImage imageOrientation] to ALAssetOrientation.
@:overload(function(imageRef:CGImageRef, orientation:ALAssetOrientation, completionBlock:ALAssetsLibraryWriteImageCompletionBlock):Void{})
public function writeImageToSavedPhotosAlbum (imageRef:CGImageRef, metadata:NSDictionary, completionBlock:ALAssetsLibraryWriteImageCompletionBlock) :Void;

// If there is a conflict between the metadata in the image data and the metadata dictionary, the image data metadata values will be overwritten
public function writeImageDataToSavedPhotosAlbum (imageData:NSData, metadata:NSDictionary, completionBlock:ALAssetsLibraryWriteImageCompletionBlock) :Void;

public function writeVideoAtPathToSavedPhotosAlbum (videoPathURL:NSURL, completionBlock:ALAssetsLibraryWriteVideoCompletionBlock) :Void;
public function videoAtPathIsCompatibleWithSavedPhotosAlbum (videoPathURL:NSURL) :Bool;

// Returns photo data authorization status for this application
//@:require(ios6_0)
//public static function (authorizationStatus:ALAuthorizationStatus) :Void;

// Disable retrieval and notifications for Shared Photo Streams
@:require(ios6_0)
public static function disableSharedPhotoStreamsSupport () :Void;

}

// Notifications

// This notification will be sent when the contents of the ALAssetsLibrary have changed from under the app that is using the data.
// The API user should retain the library object to receive this notification.
// The userInfo may include the keys listed below, which identify specific ALAssets or ALAssetGroups that have become invalid and should be discarded. The values are NSSets of NSURLs which match the ALAssetPropertyURL and ALAssetsGroupPropertyURL properties. 
// If the userInfo is nil, all ALAssets and ALAssetGroups should be considered invalid and discarded.
// Modified ALAssets will be identified by the ALAssetLibraryUpdatedAssetsKey, but inserted or deleted ALAssets are identified by invalidating the containing ALAssetGroups.

@:framework("AssetsLibrary")
@:require(ios6_0)
extern enum ALAssetsLibraryOptions {
	ALAssetsLibraryChangedNotification;
	ALAssetLibraryUpdatedAssetsKey;
	ALAssetLibraryInsertedAssetGroupsKey;
	ALAssetLibraryUpdatedAssetGroupsKey;
	ALAssetLibraryDeletedAssetGroupsKey;

	ALAssetsLibraryErrorDomain;
    ALAssetsLibraryUnknownError;      // Error (reason unknown)
    
    // These errors would be returned in the ALAssetsLibraryWriteImageCompletionBlock and ALAssetsLibraryWriteVideoCompletionBlock completion blocks,
    // as well as in the completion selector for UIImageWriteToSavedPhotosAlbum() and UISaveVideoAtPathToSavedPhotosAlbum()
    ALAssetsLibraryWriteFailedError;// Write error (write failed)
    ALAssetsLibraryWriteBusyError;// Write error (writing is busy, try again)
    ALAssetsLibraryWriteInvalidDataError;// Write error (invalid data)
    ALAssetsLibraryWriteIncompatibleDataError;// Write error (incompatible data)
    ALAssetsLibraryWriteDataEncodingError;// Write error (data has invalid encoding)
    ALAssetsLibraryWriteDiskSpaceError;// Write error (out of disk space)

    // This error would be returned in the ALAssetsLibraryAccessFailureBlock, ALAssetsLibraryWriteImageCompletionBlock, and ALAssetsLibraryWriteVideoCompletionBlock completion blocks,
    // as well as in the completion selector for UIImageWriteToSavedPhotosAlbum() and UISaveVideoAtPathToSavedPhotosAlbum()
    ALAssetsLibraryDataUnavailableError;// Data unavailable (data currently unavailable)    
    
    // These errors would be returned in the ALAssetsLibraryAccessFailureBlock
    ALAssetsLibraryAccessUserDeniedError;// Access error (user denied access request)
    ALAssetsLibraryAccessGloballyDeniedError;// Access error (access globally denied)
}
