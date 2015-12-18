package objc.game;

extern enum GKErrorCode {
    GKErrorUnknown;
    GKErrorCancelled;
    GKErrorCommunicationsFailure;
    GKErrorUserDenied;
    GKErrorInvalidCredentials;
    GKErrorNotAuthenticated;
    GKErrorAuthenticationInProgress;
    GKErrorInvalidPlayer;
    GKErrorScoreNotSet;
    GKErrorParentalControlsBlocked;
    GKErrorPlayerStatusExceedsMaximumLength;
    GKErrorPlayerStatusInvalid;
    GKErrorMatchRequestInvalid;
    GKErrorUnderage;
    GKErrorGameUnrecognized;
    GKErrorNotSupported;
    GKErrorInvalidParameter;
    GKErrorUnexpectedConnection;
    GKErrorChallengeInvalid;
    GKErrorTurnBasedMatchDataTooLarge;
    GKErrorTurnBasedTooManySessions;
    GKErrorTurnBasedInvalidParticipant;
    GKErrorTurnBasedInvalidTurn;
    GKErrorTurnBasedInvalidState;
}
