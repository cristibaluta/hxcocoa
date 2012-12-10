//
//  MPMoviePlayerViewController.h
//  MediaPlayer
//
//  Copyright 2009-2010 Apple, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayerDefines.h>
#import <UIKit/UIViewController.h>

@class MPMoviePlayerController;

MP_EXTERN_CLASS_AVAILABLE(3_2)extern class MPMoviePlayerViewController extends UIViewController {
@private
    id _internal;
}

- (id)initWithContentURL:(NSURL *)contentURL;

	public var (default, null) MPMoviePlayerController *moviePlayer;

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation; // Default is YES.
}

// -----------------------------------------------------------------------------
// UIViewController Additions
// Additions to present a fullscreen movie player as a modal view controller using the standard movie player transition.

extern class UIViewController (MPMoviePlayerViewController)

- (void)presentMoviePlayerViewControllerAnimated:(MPMoviePlayerViewController *)moviePlayerViewController;
- (void)dismissMoviePlayerViewControllerAnimated;

}
