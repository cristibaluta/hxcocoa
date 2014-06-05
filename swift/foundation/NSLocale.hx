package swift.foundation;
import swift.foundation.NSObject;

@:framework("Foundation")
extern class NSLocale extends NSObject implements NSCopying implements NSSecureCoding {

	//Constants

	//Static Methods
	public static function systemLocale() :NSLocale;
	public static function localeIdentifierFromComponents( dict:NSDictionary):String;
	public static function characterDirectionForLanguage( isoLangCode:String):NSLocaleLanguageDirection;
	public static function ISOCountryCodes():Array<String>;
	public static function availableLocaleIdentifiers():Array<String>;
	public static function componentsFromLocaleIdentifier( string:String):NSDictionary;
	public static function localeIdentifierFromWindowsLocaleCode( lcid:Int):String;
	public static function windowsLocaleCodeFromLocaleIdentifier( localeIdentifier:String):Int;
	public static function lineDirectionForLanguage( isoLangCode:String) :NSLocaleLanguageDirection;
	public static function autoupdatingCurrentLocale():Dynamic;
	public static function commonISOCurrencyCodes():Array<String>;
	public static function ISOCurrencyCodes():Array<String>;
	public static function canonicalLanguageIdentifierFromString(string:String) :String;
	public static function currentLocale():NSLocale;
	public static function canonicalLocaleIdentifierFromString(string:String) :String;
	public static function ISOLanguageCodes():Array<String>;
	public static function preferredLanguages():Array<String>;

	//Properties

	//Methods
	public function objectForKey(key:String) :Dynamic;
	public function displayNameForKey( key:Dynamic, value:Dynamic):String;
	public function localeIdentifier():String;
	public function initWithLocaleIdentifier( string:String):Dynamic;
}

@:framework("Foundation")
extern enum NSLocaleLanguageDirection
{
	NSLocaleLanguageDirectionUnknown;
	NSLocaleLanguageDirectionLeftToRight;
	NSLocaleLanguageDirectionRightToLeft;
	NSLocaleLanguageDirectionTopToBottom;
	NSLocaleLanguageDirectionBottomToTop;
}

