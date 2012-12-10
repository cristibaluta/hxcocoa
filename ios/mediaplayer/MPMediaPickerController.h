//
//  MPMediaPickerController.h
//  MediaPlayer
//
//  Copyright 2008 Apple, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayerDefines.h>
#import <MediaPlayer/MPMediaItem.h>
#import <MediaPlayer/MPMediaItemCollection.h>

@class MPMediaPickerControllerInternal;
@protocol MPMediaPickerControllerDelegate;

// MPMediaPickerController is a UIViewController for visually selecting media items.
// To display it, present it modally on an existing view controller.

MP_EXTERN_CLASS_AVAILABLE(3_0)extern class MPMediaPickerController extends UIViewController {
@private
    MPMediaPickerControllerInternal *_internal;
}

- (id)init; // defaults to MPMediaTypeAny
- (id)initWithMediaTypes:(MPMediaType)mediaTypes;
	public var MPMediaType mediaTypes;

	public var id<MPMediaPickerControllerDelegate> delegate;

	public var BOOL allowsPickingMultipleItems; // default is NO

	public var BOOL showsCloudItems NS_AVAILABLE_IOS(6_0); // default is YES

	public var NSString *prompt; // displays a prompt for the user above the navigation bar buttons

}

@protocol MPMediaPickerControllerDelegate<NSObject>
@optional

// It is the delegate's responsibility to dismiss the modal view controller on the parent view controller.

- (void)mediaPicker:(MPMediaPickerController *)mediaPicker didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection;
- (void)mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker;

}
