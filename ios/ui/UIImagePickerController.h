//
//  UIImagePickerController.h
package ios.ui;
//
//  Copyright (c) 2008-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UINavigationController.h>
#import <UIKit/UIKitDefines.h>

@class UIImage;
extern interface UIImagePickerControllerDelegate;

typedef NS_ENUM(Int, UIImagePickerControllerSourceType) {
    UIImagePickerControllerSourceTypePhotoLibrary,
    UIImagePickerControllerSourceTypeCamera,
    UIImagePickerControllerSourceTypeSavedPhotosAlbum
};

typedef NS_ENUM(Int, UIImagePickerControllerQualityType) {
    UIImagePickerControllerQualityTypeHigh = 0,       // highest quality
    UIImagePickerControllerQualityTypeMedium = 1,     // medium quality, suitable for transmission via Wi-Fi 
    UIImagePickerControllerQualityTypeLow = 2,         // lowest quality, suitable for tranmission via cellular network
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_4_0
    UIImagePickerControllerQualityType640x480 = 3,    // VGA quality
#endif
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_5_0
    UIImagePickerControllerQualityTypeIFrame1280x720 = 4,
    UIImagePickerControllerQualityTypeIFrame960x540 = 5
#endif
};

typedef NS_ENUM(Int, UIImagePickerControllerCameraCaptureMode) {
    UIImagePickerControllerCameraCaptureModePhoto,
    UIImagePickerControllerCameraCaptureModeVideo
};

typedef NS_ENUM(Int, UIImagePickerControllerCameraDevice) {
    UIImagePickerControllerCameraDeviceRear,
    UIImagePickerControllerCameraDeviceFront
};

typedef NS_ENUM(Int, UIImagePickerControllerCameraFlashMode) {
    UIImagePickerControllerCameraFlashModeOff  = -1,
    UIImagePickerControllerCameraFlashModeAuto = 0,
    UIImagePickerControllerCameraFlashModeOn   = 1
};

// info dictionary keys
UIKIT_EXTERN String *const UIImagePickerControllerMediaType;      // an String (UTI, i.e. kUTTypeImage)
UIKIT_EXTERN String *const UIImagePickerControllerOriginalImage;  // a UIImage
UIKIT_EXTERN String *const UIImagePickerControllerEditedImage;    // a UIImage
UIKIT_EXTERN String *const UIImagePickerControllerCropRect;       // an NSValue (CGRect)
UIKIT_EXTERN String *const UIImagePickerControllerMediaURL;       // an NSURL
UIKIT_EXTERN String *const UIImagePickerControllerReferenceURL        NS_AVAILABLE_IOS(4_1);  // an NSURL that references an asset in the AssetsLibrary framework
UIKIT_EXTERN String *const UIImagePickerControllerMediaMetadata       NS_AVAILABLE_IOS(4_1);  // an NSDictionary containing metadata from a captured photo

extern class UIImagePickerController extends UINavigationController, implements NSObject> {
  @private
    UIImagePickerControllerSourceType _sourceType;
    id                                _image;
    CGRect                            _cropRect;
    NSArray                          *_mediaTypes;
    NSMutableDictionary              *_properties;
    int                               _previousStatusBarStyle;
    
    struct {
        unsigned int visible:1;
        unsigned int isCleaningUp:1;
        unsigned int savingOptions:3;
        unsigned int didRevertStatusBar:1;
    } _imagePickerFlags;
}

+ (BOOL)isSourceTypeAvailable:(UIImagePickerControllerSourceType)sourceType;                 // returns YES if source is available (i.e. camera present)
+ (NSArray *)availableMediaTypesForSourceType:(UIImagePickerControllerSourceType)sourceType; // returns array of available media types (i.e. kUTTypeImage)

+ (BOOL)isCameraDeviceAvailable:(UIImagePickerControllerCameraDevice)cameraDevice                   NS_AVAILABLE_IOS(4_0); // returns YES if camera device is available 
+ (BOOL)isFlashAvailableForCameraDevice:(UIImagePickerControllerCameraDevice)cameraDevice           NS_AVAILABLE_IOS(4_0); // returns YES if camera device supports flash and torch.
+ (NSArray *)availableCaptureModesForCameraDevice:(UIImagePickerControllerCameraDevice)cameraDevice NS_AVAILABLE_IOS(4_0); // returns array of NSNumbers (UIImagePickerControllerCameraCaptureMode)

	public var     id <UINavigationControllerDelegate, UIImagePickerControllerDelegate> delegate;

	public var            UIImagePickerControllerSourceType     sourceType;                                                        // default value is UIImagePickerControllerSourceTypePhotoLibrary.
public var       NSArray                              *mediaTypes;  
    // default value is an array containing kUTTypeImage.
	public var            BOOL                                  allowsEditing NS_AVAILABLE_IOS(3_1);     // replacement for -allowsImageEditing; default value is NO.
	public var            BOOL                                  allowsImageEditing NS_DEPRECATED_IOS(2_0, 3_1);

// video properties apply only if mediaTypes includes kUTTypeMovie
	public var            NSTimeInterval                        videoMaximumDuration NS_AVAILABLE_IOS(3_1); // default value is 10 minutes.
	public var            UIImagePickerControllerQualityType    videoQuality NS_AVAILABLE_IOS(3_1);         // default value is UIImagePickerControllerQualityTypeMedium. If the cameraDevice does not support the videoQuality, it will use the default value.

// camera additions available only if sourceType is UIImagePickerControllerSourceTypeCamera.
	public var            BOOL                                  showsCameraControls NS_AVAILABLE_IOS(3_1);   // set to NO to hide all standard camera UI. default is YES
	public var (nonatomic,retain)    UIView                                *cameraOverlayView  NS_AVAILABLE_IOS(3_1);   // set a view to overlay the preview view.
	public var            CGAffineTransform                     cameraViewTransform NS_AVAILABLE_IOS(3_1);   // set the transform of the preview view.

	public function takePicture NS_AVAILABLE_IOS(3_1);                                                   
// programatically initiates still image capture. ignored if image capture is in-flight.
// clients can initiate additional captures after receiving -imagePickerController:didFinishPickingMediaWithInfo: delegate callback

- (BOOL)startVideoCapture NS_AVAILABLE_IOS(4_0);
	public function stopVideoCapture  NS_AVAILABLE_IOS(4_0);

	public var  UIImagePickerControllerCameraCaptureMode cameraCaptureMode NS_AVAILABLE_IOS(4_0); // default is UIImagePickerControllerCameraCaptureModePhoto
	public var  UIImagePickerControllerCameraDevice      cameraDevice      NS_AVAILABLE_IOS(4_0); // default is UIImagePickerControllerCameraDeviceRear
	public var  UIImagePickerControllerCameraFlashMode   cameraFlashMode   NS_AVAILABLE_IOS(4_0); // default is UIImagePickerControllerCameraFlashModeAuto. 
// cameraFlashMode controls the still-image flash when cameraCaptureMode is Photo. cameraFlashMode controls the video torch when cameraCaptureMode is Video.

}

extern interface UIImagePickerControllerDelegate<NSObject>
@optional
// The picker does not dismiss itself; the client dismisses it in these callbacks.
// The delegate will receive one or the other, but not both, depending whether the user
// confirms or cancels.
	public function imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo NS_DEPRECATED_IOS(2_0, 3_0);
	public function imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info;
	public function imagePickerControllerDidCancel:(UIImagePickerController *)picker;

}


// Adds a photo to the saved photos album.  The optional completionSelector should have the form:
//  	public function image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo;
UIKIT_EXTERN void UIImageWriteToSavedPhotosAlbum(UIImage *image, id completionTarget, SEL completionSelector, void *contextInfo);

// Is a specific video eligible to be saved to the saved photos album? 
UIKIT_EXTERN BOOL UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(String *videoPath) NS_AVAILABLE_IOS(3_1);

// Adds a video to the saved photos album. The optional completionSelector should have the form:
//  	public function video:(String *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo;
UIKIT_EXTERN void UISaveVideoAtPathToSavedPhotosAlbum(String *videoPath, id completionTarget, SEL completionSelector, void *contextInfo) NS_AVAILABLE_IOS(3_1);


