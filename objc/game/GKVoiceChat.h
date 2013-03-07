//
//  GKVoiceChat.h
//  GameKit
//
//  Copyright 2010 Apple, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

enum {
    GKVoiceChatPlayerConnected,
    GKVoiceChatPlayerDisconnected,
    GKVoiceChatPlayerSpeaking,
    GKVoiceChatPlayerSilent,
    GKVoiceChatPlayerConnecting
};
typedef NSInteger GKVoiceChatPlayerState;

// GKVoiceChat represents an instance of a named voice communications channel
NS_CLASS_AVAILABLE(10_8, 4_1)
extern class GKVoiceChat extends NSObject {
}
	
- (void)start;  // start receiving audio from the chat
- (void)stop;   // stop receiving audio from the chat

- (void)setMute:(BOOL)isMuted forPlayer:(NSString *)playerID;

	public var  void(^playerStateUpdateHandler)(NSString *playerID, GKVoiceChatPlayerState state);
	public var (default, null) NSString *name;  // name the chat was created with
	public var (nonatomic, assign, getter=isActive) BOOL active; // make this session active and route the microphone 
	public var  float volume; // default 1.0 (max is 1.0, min is 0.0)


	public var (default, null) NSArray *playerIDs __OSX_AVAILABLE_STARTING(__MAC_10_8,__IPHONE_5_0); // list of GKPlayerIDs

+ (BOOL)isVoIPAllowed;

}
