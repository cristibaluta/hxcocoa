package ios.assets;

import ios.assets.ALAssetsLibrary;
import swift.foundation.NSObject;
import swift.foundation.NSDictionary;
import swift.foundation.NSData;
import swift.foundation.NSURL;
import swift.graphics.CGImage;

// Properties
@:framework("AssetsLibrary")
extern enum ALAssetProperty {
	ALErrorInvalidProperty;
	ALAssetPropertyType;
	ALAssetPropertyLocation;
	ALAssetPropertyDuration;
	ALAssetPropertyOrientation;
	ALAssetPropertyDate;

// Properties related to multiple photo representations
	ALAssetPropertyRepresentations;
	ALAssetPropertyURLs;
	@:require(ios6) ALAssetPropertyAssetURL;
}
// Asset types
@:framework("AssetsLibrary")
extern enum ALAssetType {
	ALAssetTypePhoto;
	ALAssetTypeVideo;
	ALAssetTypeUnknown;
}

@:framework("AssetsLibrary")
@:require(ios5)
extern class ALAsset extends NSObject {

// Returns the value for a given property (as defined above). Calling it with an invalid property returns a ALErrorInvalidProperty error.
public function valueForProperty (property:String) :Dynamic;

// Returns an ALAssetRepresentation object for the default representation of the ALAsset
public function defaultRepresentation () :ALAssetRepresentation;

// Returns an ALAssetRepresentation object for the given representation UTI. If the ALAsset does not
// support the representation, nil is returned.
public function representationForUTI (representationUTI:String) :ALAssetRepresentation;

// Returns a CGImage with a square thumbnail of the asset.  The size of the thumbnail is the appropriate size for the platform.  The thumbnail will be in the correct orientation.
public function thumbnail () :CGImageRef;

// Returns a CGImage with an aspect ratio thumbnail of the asset.  The size of the thumbnail is the appropriate size for the platform.  The thumbnail will be in the correct orientation.
public function aspectRatioThumbnail () :CGImageRef;

// Saves image data to the saved photos album as a new ALAsset that is considered a modified version of the calling ALAsset.
public function writeModifiedImageDataToSavedPhotosAlbum (imageData:NSData, metadata:NSDictionary, completionBlock:ALAssetsLibraryWriteImageCompletionBlock) :Void;

// Saves the video at the specified path to the saved photos album as a new ALAsset that is considered a modified version of the calling ALAsset.
public function writeModifiedVideoAtPathToSavedPhotosAlbum (videoPathURL:NSURL, completionBlock:ALAssetsLibraryWriteVideoCompletionBlock) :Void;

// Returns the original asset if the caller was saved as a modified version of an asset.
// Returns nil if the caller was not saved as a modified version of an asset.
public var originalAsset (default, null) :ALAsset;

// Returns YES if the application is able to edit the asset.  Returns NO if the application is not able to edit the asset.
// Applications are only allowed to edit assets that they originally wrote.
public var editable (default, null) :Bool;

// Replaces the image data in the calling asset with the supplied image data.
// The caller should check the editable property of the asset to see if it is possible to replace the image data.
// If the application is able to edit the asset, the completion block will return the same assetURL as the calling asset, since a new asset is not being created.
// If the application is not able to edit the asset, the completion block will return a nil assetURL and an ALAssetsLibraryWriteFailedError.
public function setImageData (imageData:NSData, metadata:NSDictionary, completionBlock:ALAssetsLibraryWriteImageCompletionBlock) :Void;

// Replaces the video data in the calling asset with the video at the specified path.
// The caller should check the editable property of the asset to see if it is possible to replace the video data.
// If the application is able to edit the asset, the completion block will return the same assetURL as the calling asset, since a new asset is not being created.
// If the application is not able to edit the asset (see the editable property on ALAsset), the completion block will return a nil assetURL and an ALAssetsLibraryWriteFailedError.
public function setVideoAtPath (videoPathURL:NSURL, completionBlock:ALAssetsLibraryWriteVideoCompletionBlock) :Void;

}
