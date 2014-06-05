package swift.game;

// Game Center cross-platform headers
typedef GKAchievement = swift.game.GKAchievement;
typedef GKAchievementDescription = swift.game.GKAchievementDescription;
typedef GKDefines = swift.game.GKDefines;
typedef GKError = swift.game.GKError;
typedef GKLeaderboard = swift.game.GKLeaderboard;
typedef GKLocalPlayer = swift.game.GKLocalPlayer;
typedef GKMatch = swift.game.GKMatch;
typedef GKTurnBasedMatch = swift.game.GKTurnBasedMatch;
typedef GKMatchmaker = swift.game.GKMatchmaker;
typedef GKPlayer = swift.game.GKPlayer;
typedef GKScore = swift.game.GKScore;
typedef GKVoiceChat = swift.game.GKVoiceChat;
typedef GKChallenge = swift.game.GKChallenge;
typedef GKNotificationBanner = swift.game.GKNotificationBanner;
typedef GKChallengeEventHandler = swift.game.GKChallengeEventHandler;

#if ios
// Game Center UI iOS
typedef GKMatchmakerViewController = swift.game.GKMatchmakerViewController;
typedef GKTurnBasedMatchmakerViewController = swift.game.GKTurnBasedMatchmakerViewController;
typedef GKLeaderboardViewController = swift.game.GKLeaderboardViewController;
typedef GKAchievementViewController = swift.game.GKAchievementViewController;
typedef GKFriendRequestComposeViewController = swift.game.GKFriendRequestComposeViewController;
typedef GKGameCenterViewController = swift.game.GKGameCenterViewController;

// GameKit 3.0 iOS
typedef GKPeerPickerController = swift.game.GKPeerPickerController;
typedef GKPublicConstants = swift.game.GKPublicConstants;
typedef GKPublicProtocols = swift.game.GKPublicProtocols;
typedef GKSession = swift.game.GKSession;
typedef GKSessionError = swift.game.GKSessionError;
typedef GKVoiceChatService = swift.game.GKVoiceChatService;

#else

// Game Center UI Mac
typedef GKMatchmakerPanel = swift.game.GKMatchmakerPanel;
typedef GKTurnBasedMatchmakerPanel = swift.game.GKTurnBasedMatchmakerPanel;
typedef GKLeaderboardPanel = swift.game.GKLeaderboardPanel;
typedef GKAchievementPanel = swift.game.GKAchievementPanel;
typedef GKFriendRequestComposePanel = swift.game.GKFriendRequestComposePanel;

#end

