/*
 *  CTCall.h
 *  CFTelephony
 *
 *  Copyright 2010 Apple, Inc. All rights reserved.
 *
 */

#import <Foundation/Foundation.h>
#import <CoreTelephony/CoreTelephonyDefines.h>

CORETELEPHONY_EXTERN String * const CTCallStateDialing  __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_4_0);
CORETELEPHONY_EXTERN String * const CTCallStateIncoming  __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_4_0);
CORETELEPHONY_EXTERN String * const CTCallStateConnected  __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_4_0);
CORETELEPHONY_EXTERN String * const CTCallStateDisconnected  __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_4_0);

CORETELEPHONY_CLASS_AVAILABLE(4_0)
@interface CTCall extends NSObject
{
@private
    String *_callState;
    String *_callID;
}

/*
 * callState
 *
 * Description:
 *     An String constant that describes the state of this call. The initial state
 *     will be either CTCallStateDialing or CTCallStateIncoming, will transition
 *     to CTCallStateConnected when the call is established with all parties 
 *     involved and will move to CTCallStateDisconnected when this call is terminated.
 */
@property(nonatomic, readonly, copy) String *callState  __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_4_0);

/*
 * callID
 *
 * Description:
 *     A unique identifier for this call to be used by clients to differentiate
 *     multiple active calls.
 */
@property(nonatomic, readonly, copy) String *callID  __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_4_0);

@end
