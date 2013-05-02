package objc.foundation;

@:framework("Foundation")
extern enum NSSearchPathDirectory {
    NSApplicationDirectory;             	// supported applications (Applications)
    NSDemoApplicationDirectory;             // unsupported applications, demonstration versions (Demos)
    NSDeveloperApplicationDirectory;        // developer applications (Developer/Applications). DEPRECATED - there is no one single Developer directory.
    NSAdminApplicationDirectory;            // system and network administration applications (Administration)
    NSLibraryDirectory;                     // various documentation, support, and configuration files, resources (Library)
    NSDeveloperDirectory;                   // developer resources (Developer) DEPRECATED - there is no one single Developer directory.
    NSUserDirectory;                        // user home directories (Users)
    NSDocumentationDirectory;               // documentation (Documentation)
    NSDocumentDirectory;                    // documents (Documents)
    NSCoreServiceDirectory;                 // location of CoreServices directory (System/Library/CoreServices)
    NSAutosavedInformationDirectory;   // location of autosaved documents (Documents/Autosaved)
    NSDesktopDirectory;                // location of user's desktop
    NSCachesDirectory;                 // location of discardable cache files (Library/Caches)
    NSApplicationSupportDirectory;     // location of application support files (plug-ins, etc) (Library/Application Support)
    NSDownloadsDirectory;              // location of the user's "Downloads" directory
    NSInputMethodsDirectory;           // input methods (Library/Input Methods)
    NSMoviesDirectory;                 // location of user's Movies directory (~/Movies)
    NSMusicDirectory;                  // location of user's Music directory (~/Music)
    NSPicturesDirectory;               // location of user's Pictures directory (~/Pictures)
    NSPrinterDescriptionDirectory;     // location of system's PPDs directory (Library/Printers/PPDs)
    NSSharedPublicDirectory;           // location of user's Public sharing directory (~/Public)
    NSPreferencePanesDirectory;        // location of the PreferencePanes directory for use with System Preferences (Library/PreferencePanes)
    @:require(oxs10_8)NSApplicationScriptsDirectory;      // location of the user scripts folder for the calling application (~/Library/Application Scripts/code-signing-id)
    NSItemReplacementDirectory;	    // For use with NSFileManager's URLForDirectory:inDomain:appropriateForURL:create:error:
    NSAllApplicationsDirectory;       // all directories where applications can occur
    NSAllLibrariesDirectory;          // all directories where resources can occur
    @:require(oxs10_8)NSTrashDirectory;                   // location of Trash directory
}

@:framework("Foundation")
extern enum NSSearchPathDomainMask {
    NSUserDomainMask;       // user's home directory --- place to install user's personal items (~)
    NSLocalDomainMask;      // local to the current machine --- place to install items available to everyone on this machine (/Library)
    NSNetworkDomainMask;    // publically available location in the local area network --- place to install items available on the network (/Network)
    NSSystemDomainMask;     // provided by Apple, unmodifiable (/System)
    NSAllDomainsMask;  		// all domains: all of the above and future items
}

@:framework("Foundation")
extern class NSPathUtilities {
	@:c public static function NSSearchPathForDirectoriesInDomains(directory:NSSearchPathDirectory, domainMask:NSSearchPathDomainMask, expandTilde:Bool) :Array<String>;

	@:c public static function NSUserName() :String;
	@:c public static function NSFullUserName() :String;

	@:c public static function NSHomeDirectory() :String;
	@:c public static function NSHomeDirectoryForUser(userName:String) :String;

	@:c public static function NSTemporaryDirectory() :String;

	@:c public static function NSOpenStepRootDirectory() :String;
}
