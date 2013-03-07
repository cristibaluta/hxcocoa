package objc.game;

// GKAchievement represents a game achievement that the player has started or completely achieved.
NS_CLASS_AVAILABLE(10_8, 4_1)
@:framework("GameKit")
extern class GKAchievement extends NSObject {

// Asynchronously load all achievements for the local player
+ (void)loadAchievementsWithCompletionHandler:(void(^)(NSArray *achievements, NSError *error))completionHandler;

// Reset the achievements progress for the local player. All the entries for the local player are removed from the server. Error will be nil on success.
//Possible reasons for error:
// 1. Local player not authenticated
// 2. Communications failure
+ (void)resetAchievementsWithCompletionHandler:(void(^)(NSError *error))completionHandler;

// Designate initializer
- (id)initWithIdentifier:(NSString *)identifier;


// Report an array of achievements to the server. Percent complete is required. Points, completed state are set based on percentComplete. isHidden is set to NO anytime this method is invoqued. Date is optional. Error will be nil on success.
// Possible reasons for error:
// 1. Local player not authenticated
// 2. Communications failure
// 3. Reported Achievement does not exist
+ (void)reportAchievements:(NSArray *)achievements withCompletionHandler:(void(^)(NSError *error))completionHandler __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_6_0);


// Report this achievement to the server. Percent complete is required. Points, completed state are set based on percentComplete. isHidden is set to NO anytime this method is invoqued. Date is optional. Error will be nil on success.
// Possible reasons for error:
// 1. Local player not authenticated
// 2. Communications failure
// 3. Reported Achievement does not exist
- (void)reportAchievementWithCompletionHandler:(void(^)(NSError *error))completionHandler;

	public var  NSString *identifier;                  // Achievement identifier
	public var  double percentComplete;                // Required, Percentage of achievement complete.
	public var (nonatomic, readonly, getter=isCompleted) BOOL completed;  // Set to NO until percentComplete = 100.
	public var (nonatomic, assign, getter=isHidden, readonly) BOOL hidden __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_NA,__MAC_NA,__IPHONE_4_1,__IPHONE_6_0);    // Set to NO when a report for that achievement is made. Note: to only unhide an achievement, report it with percentComplete = 0
	public var (default, null) NSDate *lastReportedDate;    // Date the achievement was last reported. ReadOnly. Created at initialization

	public var  BOOL showsCompletionBanner __OSX_AVAILABLE_STARTING(__MAC_10_8,__IPHONE_5_0);             // A banner will be momentarily displayed after reporting a completed achievement

}
