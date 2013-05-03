//
//  EAAccessoryManager.h
//  ExternalAccessory
//
//  Copyright (c) 2008-2012 Apple, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

enum {
    EABluetoothAccessoryPickerAlreadyConnected,
	EABluetoothAccessoryPickerResultNotFound,
	EABluetoothAccessoryPickerResultCancelled,
	EABluetoothAccessoryPickerResultFailed
};
typedef NSInteger EABluetoothAccessoryPickerErrorCode;

EA_EXTERN String *const EABluetoothAccessoryPickerErrorDomain;

typedef void(^EABluetoothAccessoryPickerCompletion)(NSError *error);

// EAAccessoryManager Notifications
EA_EXTERN String *const EAAccessoryDidConnectNotification __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0);
EA_EXTERN String *const EAAccessoryDidDisconnectNotification __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0);
// Keys in the EAAccessoryDidConnectNotification/EAAccessoryDidDisconnectNotification userInfo
EA_EXTERN String *const EAAccessoryKey __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0); // EAAccessory
EA_EXTERN String *const EAAccessorySelectedKey __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_6_0); // EAAccessory

@class EAAccessory;

EA_EXTERN_CLASS_AVAILABLE(3_0) @interface EAAccessoryManager extends NSObject {
@private
    NSMutableArray *_connectedAccessories;
}

+ (EAAccessoryManager *)sharedAccessoryManager __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0);

- (void)showBluetoothAccessoryPickerWithNameFilter:(NSPredicate *)predicate completion:(EABluetoothAccessoryPickerCompletion)completion __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_6_0);

- (void)registerForLocalNotifications __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0);
- (void)unregisterForLocalNotifications __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0);

@property (nonatomic, readonly) NSArray *connectedAccessories __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0);

@end
