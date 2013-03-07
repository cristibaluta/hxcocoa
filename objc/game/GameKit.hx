package objc.game;

// Game Center cross-platform headers
typedef GKAchievement = objc.game.GKAchievement;
typedef GKAchievementDescription = objc.game.GKAchievementDescription;
typedef GKDefines = objc.game.GKDefines;
typedef GKError = objc.game.GKError;
typedef GKLeaderboard = objc.game.GKLeaderboard;
typedef GKLocalPlayer = objc.game.GKLocalPlayer;
typedef GKMatch = objc.game.GKMatch;
typedef GKTurnBasedMatch = objc.game.GKTurnBasedMatch;
typedef GKMatchmaker = objc.game.GKMatchmaker;
typedef GKPlayer = objc.game.GKPlayer;
typedef GKScore = objc.game.GKScore;
typedef GKVoiceChat = objc.game.GKVoiceChat;
typedef GKChallenge = objc.game.GKChallenge;
typedef GKNotificationBanner = objc.game.GKNotificationBanner;
typedef GKChallengeEventHandler = objc.game.GKChallengeEventHandler;

#if ios
// Game Center UI iOS
typedef GKMatchmakerViewController = objc.game.GKMatchmakerViewController;
typedef GKTurnBasedMatchmakerViewController = objc.game.GKTurnBasedMatchmakerViewController;
typedef GKLeaderboardViewController = objc.game.GKLeaderboardViewController;
typedef GKAchievementViewController = objc.game.GKAchievementViewController;
typedef GKFriendRequestComposeViewController = objc.game.GKFriendRequestComposeViewController;
typedef GKGameCenterViewController = objc.game.GKGameCenterViewController;

// GameKit 3.0 iOS
typedef GKPeerPickerController = objc.game.GKPeerPickerController;
typedef GKPublicConstants = objc.game.GKPublicConstants;
typedef GKPublicProtocols = objc.game.GKPublicProtocols;
typedef GKSession = objc.game.GKSession;
typedef GKSessionError = objc.game.GKSessionError;
typedef GKVoiceChatService = objc.game.GKVoiceChatService;

#else

// Game Center UI Mac
typedef GKMatchmakerPanel = objc.game.GKMatchmakerPanel;
typedef GKTurnBasedMatchmakerPanel = objc.game.GKTurnBasedMatchmakerPanel;
typedef GKLeaderboardPanel = objc.game.GKLeaderboardPanel;
typedef GKAchievementPanel = objc.game.GKAchievementPanel;
typedef GKFriendRequestComposePanel = objc.game.GKFriendRequestComposePanel;

#end

