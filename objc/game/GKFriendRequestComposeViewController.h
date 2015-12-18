/*
 *  GKFriendRequestComposeViewController.h
 *  GameKit
 *
 *  Copyright 2010 Apple, Inc. All rights reserved.
 */

#import <UIKit/UIKit.h>

@protocol GKFriendRequestComposeViewControllerDelegate;

// Standard view controller for sending friend requests to other players. Present modally from the top view controller.
NS_CLASS_AVAILABLE(NA, 4_2)
extern class GKFriendRequestComposeViewController extends UINavigationController
// Get the maximum number of recipients permitted
+ (NSUInteger)maxNumberOfRecipients;

// Specify the message sent to the invitee. A default message will be used if you don't specify one.
- (void)setMessage:(NSString *)message;

// Add recipients to the request.
// If you don't specify at least one recipient before presenting the view, the recipients field will be made firstResponder, to encourage the user to add some.
// If you add more than maxNumberOfRecipients recipients, these methods will throw an exception.
- (void)addRecipientsWithPlayerIDs:(NSArray *)playerIDs;
- (void)addRecipientsWithEmailAddresses:(NSArray *)emailAddresses;

	public var id<GKFriendRequestComposeViewControllerDelegate> composeViewDelegate;
}

// Optional delegate
@protocol GKFriendRequestComposeViewControllerDelegate
// The compose view has finished
- (void)friendRequestComposeViewControllerDidFinish:(GKFriendRequestComposeViewController *)viewController;
}
