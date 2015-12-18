/*
 GKSession.h
 GameKit
 
 Copyright 2010 Apple, Inc. All rights reserved.
 
 The Game Connectivity Kit (GCK) is a framework for handling connectivity and data transport in multiplayer network games.  
 
 With the GCK API, a developer can setup a game network, which consists of players connected to each other for a game.  The API supports setting up and connecting a client/server game, or a peer-to-peer game (any peer can be the game server).
 
 This a not a Game Center feature. To support Game Center and online play, see GKMatch.
*/

#import <Foundation/Foundation.h>
#import <GameKit/GKDefines.h>
#import <GameKit/GKPublicProtocols.h>

/* The GKSession handles networking between peers for a game, which includes establishing and maintaining connections over a game network, and network data transport.
 
 This a not a Game Center feature. To support Game Center and online play, see GKMatch.
*/
NS_CLASS_AVAILABLE(10_8, 4_1)
GK_EXTERN_CLASSextern class GKSession extends NSObject {
@private
	id _session;
}

/* Creating a GKSession requires a unique identifier, sessionID, and mode.  All instances of the application must have the same sessionID in order to be able to join a game network.  Additionally, the GKSession requires a name, which is used to identify the specific instances of the application.

If sessionID = nil then the GKSession will use the app bundle identifier.
If name = nil then GKSession will use the device name.
*/
- (id)initWithSessionID:(NSString *)sessionID displayName:(NSString *)name sessionMode:(GKSessionMode)mode;

	public var (assign) id<GKSessionDelegate> delegate;

	public var  (default, null) extends NSString *sessionID;
	public var  (default, null) extends NSString *displayName;
	public var  (default, null) extends GKSessionMode sessionMode;
	public var  (default, null) extends NSString *peerID;			// session's peerID

/* Toggle availability on the network based on session mode and search criteria.  Delegate will get a callback -session:didReceiveConnectionRequestFromPeer: when a peer attempts a connection.
*/
	public var (getter=isAvailable) BOOL available;

/* The timeout for disconnecting a peer if it appears that the peer has lost connection to the game network 
*/
	public var (assign) NSTimeInterval disconnectTimeout; // default is 20 seconds

/* Return the application chosen name of a specific peer
*/
- (NSString *)displayNameForPeer:(NSString *)peerID;

/* Asynchronous delivery of data to one or more peers.  Returns YES if delivery started, NO if unable to start sending, and error will be set.  Delivery will be reliable or unreliable as set by mode.
*/
- (BOOL)sendData:(NSData *) data toPeers:(NSArray *)peers withDataMode:(GKSendDataMode)mode error:(NSError **)error;

/* Asynchronous delivery to all peers.  Returns YES if delivery started, NO if unable to start sending, and error will be set.  Delivery will be reliable or unreliable as set by mode.
*/
- (BOOL)sendDataToAllPeers:(NSData *) data withDataMode:(GKSendDataMode)mode error:(NSError **)error;	// errors: buffer full, data too big

/* Set the handler to receive data sent from remote peers.
*/
- (void)setDataReceiveHandler:(id)handler withContext:(void *)context;  // SEL = -receiveData:fromPeer:inSession:context:

/* Attempt connection to a remote peer.  Remote peer gets a callback to -session:didReceiveConnectionRequestFromPeer:.  

Success results in a call to delegate -session:peer:didChangeState: GKPeerStateConnected
Failure results in a call to delegate -session:connectionWithPeerFailed:withError:
*/
- (void)connectToPeer:(NSString *)peerID withTimeout:(NSTimeInterval)timeout;
- (void)cancelConnectToPeer:(NSString *)peerID;

/* Methods to accept or deny a prior connection request from -session:didReceiveConnectionRequestFromPeer:
*/
- (BOOL)acceptConnectionFromPeer:(NSString *)peerID error:(NSError **)error;	// errors: cancelled, or timeout
- (void)denyConnectionFromPeer:(NSString *)peerID;

/* Disconnect a peer from the session (the peer gets disconnected from all connected peers).
*/
- (void)disconnectPeerFromAllPeers:(NSString *)peerID;

/* Disconnect local peer
*/
- (void)disconnectFromAllPeers;

/* Returns peers according to connection state
*/ 
- (NSArray *)peersWithConnectionState:(GKPeerConnectionState)state;
}
