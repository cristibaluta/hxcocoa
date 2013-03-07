package objc.foundation;

@:framework("Foundation")
extern class NSBundle extends NSObject {

	public static function mainBundle () :NSBundle;
	public static function bundleWithPath (path:String) :NSBundle;
	public function initWithPath (path:String) :NSBundle;

	public static function bundleWithURL (url:NSURL) :NSBundle;
	public function initWithURL (url:NSURL) :NSBundle;

	public static function bundleForClass (aClass:Class<Dynamic>) :NSBundle;
	public static function bundleWithIdentifier (identifier:String) :NSBundle;

	public static function allBundles () :Array<NSBundle>;
	public static function allFrameworks () :Array<Dynamic>;

/* Methods for loading and unloading bundles. */
	public function load () :Bool;
	public function isLoaded () :Bool;
	public function unload () :Bool;

	public function preflightAndReturnError (error:NSError) :Bool
	public function loadAndReturnError (error:NSError) :Bool

/* Methods for locating various components of a bundle. */
	public function bundleURL () :NSURL;
	public function resourceURL () :NSURL;
	public function executableURL () :NSURL;
	public function URLForAuxiliaryExecutable (executableName:String) :NSURL;

	public function privateFrameworksURL () :NSURL;
	public function sharedFrameworksURL () :NSURL;
	public function sharedSupportURL () :NSURL;
	public function builtInPlugInsURL () :NSURL;

	@:require(osx10_7) public function appStoreReceiptURL () :NSURL;

	public function bundlePath () :String;
	public function resourcePath () :String;
	public function executablePath () :String;
	public function pathForAuxiliaryExecutable (executableName:String) :String;

	public function privateFrameworksPath () :String;
	public function sharedFrameworksPath () :String;
	public function sharedSupportPath () :String;
	public function builtInPlugInsPath () :String;

/* Methods for locating bundle resources.  Instance methods locate resources in the bundle indicated by the receiver; class methods take an argument pointing to a bundle on disk.  In the class methods, bundleURL is a URL pointing to the location of a bundle on disk, and may not be nil; bundlePath is the path equivalent of bundleURL, an absolute path pointing to the location of a bundle on disk.  By contrast, subpath is a relative path to a subdirectory inside the relevant global or localized resource directory, and should be nil if the resource file in question is not in a subdirectory.  Where appropriate, localizationName is the name of a .lproj directory in the bundle, minus the .lproj extension; passing nil for localizationName retrieves only global resources, whereas using a method without this argument retrieves both global and localized resources (using the standard localization search algorithm).  */

	public static function URLForResource (name:String, withExtension:String, subdirectory:String, inBundleWithURL:NSURL) :NSURL;
	public static function URLsForResourcesWithExtension (ext:String, subdirectory:String, inBundleWithURL:NSURL) :Array<NSURL>;

	@:overload(function(name:String, withExtension:String, subdirectory:String):NSURL{})
	@:overload(function(name:String, withExtension:String, subdirectory:String, localization:String):NSURL{})
	public function URLForResource (name:String, withExtension:String) :NSURL;

	@:overload(function(ext:String, subdirectory:String, localization:String):Array<NSURL>{})
	public function URLsForResourcesWithExtension (ext:String, subdirectory:String) :Array<NSURL>;
	
	public static function pathForResource (name:String, ofType:String, inDirectory:String) :String;
	public static function pathsForResourcesOfType (ext:String, inDirectory:String) :Array<String>;

	@:overload(function(name:String, ofType:String, inDirectory:String):String{})
	@:overload(function(name:String, ofType:String, inDirectory:String, forLocalization:String):String{})
	public function pathForResource (name:String, ofType:String) :String;
	
	public function pathsForResourcesOfType (ext:String, inDirectory:String) :Array<String>;
	public function pathsForResourcesOfType (ext:String, inDirectory:String, forLocalization:String) :Array<String>;

/* Method for retrieving localized strings. */
	public function localizedStringForKey (key:String, value:String, table:String) :String;

/* Methods for obtaining various information about a bundle. */
	public function bundleIdentifier () :String;
	public function infoDictionary () :NSDictionary;
	public function localizedInfoDictionary () :NSDictionary;
	public function objectForInfoDictionaryKey (key:String) :Dynamic;
	public function classNamed (className:String) :Class<Dynamic>;
	public function principalClass () :Class<Dynamic>;

/* Methods for dealing with localizations. */
	public function localizations () :Array<String>;
	public function preferredLocalizations () :Array<String>;
	public function developmentLocalization () :String;

	@:overload(function(localizationsArray:Array<String>, forPreferences:Array<String>):Array<String>{})
	public static function preferredLocalizationsFromArray (localizationsArray:Array<String>) :Array<String>;
	
	public function executableArchitectures () :Array<Int>;
}

/* Method for determining executable architectures. */
extern enum NSBundleExecutableArchitecture {
	NSBundleExecutableArchitectureI386;
	NSBundleExecutableArchitecturePPC;
	NSBundleExecutableArchitectureX86_64;
	NSBundleExecutableArchitecturePPC64;
}

/*#define NSLocalizedString(key, comment) \
	    [[NSBundle mainBundle] localizedStringForKey:(key) value:@"" table:nil]
#define NSLocalizedStringFromTable(key, tbl, comment) \
	    [[NSBundle mainBundle] localizedStringForKey:(key) value:@"" table:(tbl)]
#define NSLocalizedStringFromTableInBundle(key, tbl, bundle, comment) \
	    [bundle localizedStringForKey:(key) value:@"" table:(tbl)]
#define NSLocalizedStringWithDefaultValue(key, tbl, bundle, val, comment) \
	    [bundle localizedStringForKey:(key) value:(val) table:(tbl)]

FOUNDATION_EXPORT String * const NSBundleDidLoadNotification;
FOUNDATION_EXPORT String * const NSLoadedClasses;	// notification key

*/