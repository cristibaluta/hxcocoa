package objc.foundation;

import objc.foundation.NSObject;

@:framework("Foundation")
extern enum NSComparisonResult {
	NSOrderedAscending;
	NSOrderedSame;
	NSOrderedDescending;
}
private typedef NSStringCompareOptions = Int;

@:framework("Foundation")
extern enum NSStringEncoding {
	NSASCIIStringEncoding;
	NSNEXTSTEPStringEncoding;
	NSJapaneseEUCStringEncoding;
	NSUTF8StringEncoding;
	NSISOLatin1StringEncoding;
	NSSymbolStringEncoding;
	NSNonLossyASCIIStringEncoding;
	NSShiftJISStringEncoding;
	NSISOLatin2StringEncoding;
	NSUnicodeStringEncoding;
	NSWindowsCP1251StringEncoding;
	NSWindowsCP1252StringEncoding;
	NSWindowsCP1253StringEncoding;
	NSWindowsCP1254StringEncoding;
	NSWindowsCP1250StringEncoding;
	NSISO2022JPStringEncoding;
	NSMacOSRomanStringEncoding;
	NSUTF16StringEncoding;
	//NSUnicodeStringEncoding;
	NSUTF16BigEndianStringEncoding;
	NSUTF16LittleEndianStringEncoding;
	NSUTF32StringEncoding;
	NSUTF32BigEndianStringEncoding;
	NSUTF32LittleEndianStringEncoding;
}

@:framework("Foundation")
extern enum NSStringEnumeration {
	NSStringEnumerationByLines;
	NSStringEnumerationByParagraphs;
	NSStringEnumerationByComposedCharacterSequences;
	NSStringEnumerationByWords;
	NSStringEnumerationBySentences;
	NSStringEnumerationReverse;
	NSStringEnumerationSubstringNotRequired;
	NSStringEnumerationLocalized;
}

@:framework("Foundation")
extern class NSString extends NSObject implements NSCopying implements NSMutableCopying implements NSSecureCoding {

	inline public static var NSMaximumStringLength = 10000;//INT_MAX-1;
	
	inline public static var NSCaseInsensitiveSearch = 1;
	inline public static var NSLiteralSearch = 2;
	inline public static var NSBackwardsSearch = 4;
	inline public static var NSAnchoredSearch = 8;
	inline public static var NSNumericSearch = 64;
	inline public static var NSDiacriticInsensitiveSearch = 128;
	inline public static var NSWidthInsensitiveSearch = 256;
	inline public static var NSForcedOrderingSearch = 512;
	inline public static var NSRegularExpressionSearch = 1024;
	
	inline public static var NSStringEncodingConversionAllowLossy = 1;
	inline public static var NSStringEncodingConversionExternalRepresentation = 2;
	
	
	public function length () :Int;
	public function characterAtIndex (index:Int) :String;

	public function getCharacters (buffer:String, range:NSRange) :Void;

	public function substringFromIndex (from:Int) :NSString;
	public function substringToIndex (to:Int) :NSString;
	public function substringWithRange (range:NSRange) :NSString;

	public function compare (string:NSString) :NSComparisonResult;
	//public function compare (string:NSString, options:NSStringCompareOptions) :NSComparisonResult;
	//public function compare (string:NSString, options:NSStringCompareOptions, range:NSRange) :NSComparisonResult;
	//public function compare (string:NSString, options:NSStringCompareOptions, range:NSRange, locale:Dynamic) :NSComparisonResult;
	public function caseInsensitiveCompare (string:NSString) :NSComparisonResult;
	public function localizedCompare (string:NSString) :NSComparisonResult;
	public function localizedCaseInsensitiveCompare (string:NSString) :NSComparisonResult;
	public function localizedStandardCompare (string:NSString) :NSComparisonResult;

	public function isEqualToString (aString:NSString) :Bool;
	public function hasPrefix (aString:NSString) :Bool;
	public function hasSuffix (aString:NSString) :Bool;

/* These methods return length==0 if the target string is not found. So, to check for containment: ([str rangeOfString:@"target"].length > 0).  Note that the length of the range returned by these methods might be different than the length of the target string, due composed characters and such.
*/
	@:overload(function(aString:String, options:NSStringCompareOptions) :NSRange {})
	@:overload(function(aString:String, options:NSStringCompareOptions, range:NSRange) :NSRange {})
	@:overload(function(aString:String, options:NSStringCompareOptions, range:NSRange, locale:NSLocale) :NSRange {})
	public function rangeOfString (aString:NSString) :NSRange;
	//@:overload(function(aSet:NSCharacterSet, options:StringCompareOptions) :NSRange{})
	//@:overload(function(aSet:NSCharacterSet, options:StringCompareOptions, range:NSRange) :NSRange{})
	public function rangeOfCharacterFromSet (aSet:NSCharacterSet) :NSRange;
	public function rangeOfComposedCharacterSequenceAtIndex (index:Int) :NSRange;
	public function rangeOfComposedCharacterSequencesForRange (range:NSRange) :NSRange;

	public function stringByAppendingString (aString:NSString) :NSString;
	public function stringByAppendingFormat (format:NSString) :NSString;

	public function doubleValue () :Int;
	public function floatValue () :Float;
	public function intValue () :Int;
	public function integerValue () :Int;
	public function longLongValue () :Float;
	public function boolValue () :Bool;
	
	public function componentsSeparatedByString (separator:NSString) :Array<String>;
	public function componentsSeparatedByCharactersInSet (separator:NSCharacterSet) :Array<String>;
	public function commonPrefixWithString (aString:NSString, options:NSStringCompareOptions) :NSString;
	public function uppercaseString () :String;
	public function lowercaseString () :String;
	public function capitalizedString () :NSString;
	#if (osx_10_8 || ios_6_0)
	public function uppercaseStringWithLocale (locale:NSLocale) :NSString;
	public function lowercaseStringWithLocale (locale:NSLocale) :NSString;
	public function capitalizedStringWithLocale (locale:NSLocale) :NSString;
	#end
	public function stringByTrimmingCharactersInSet (set:NSCharacterSet) :NSString;
	public function stringByPaddingToLength (newLength:Int, withString:NSString, startingAtIndex:Int) :NSString;

	public function getLineStart (startPtr:Int, end:Int, contentsEnd:Int, forRange:NSRange) :Void;
	public function lineRangeForRange (range:NSRange) :NSRange;

	public function getParagraphStart (startPtr:Int, end:Int, contentsEnd:Int, forRange:NSRange) :Void;
	public function paragraphRangeForRange (range:NSRange) :NSRange;

	#if (osx_10_6 || ios_4_0)
	public function enumerateSubstringsInRange (range:NSRange, options:NSStringEnumerationOptions, usingBlock:NSString->NSRange->NSRange->Bool) :Void;
	public function enumerateLinesUsingBlock (block:NSString->Bool) :Void;
	#end

	public function description () :String;
	public function hash () :Int;

	public function fastestEncoding () :NSStringEncoding;
	public function smallestEncoding () :NSStringEncoding;

	public function dataUsingEncoding (encoding:NSStringEncoding, allowLossyConversion:Bool) :NSData;
	//public function dataUsingEncoding (encoding:NSStringEncoding) :NSData;

	public function canBeConvertedToEncoding (encoding:NSStringEncoding) :Bool;
	public function getCString (buffer:String, maxLength:Int, encoding:NSStringEncoding) :String;

//- (Bool)getBytes:(void *)buffer maxLength:(NSUInteger)maxBufferCount usedLength:(NSUInteger *)usedBufferCount encoding:(NSStringEncoding)encoding options:(NSStringEncodingConversionOptions)options range:(NSRange)range remainingRange:(NSRangePointer)leftover;
 
	public function maximumLengthOfBytesUsingEncoding (enc:NSStringEncoding) :Int;
	public function lengthOfBytesUsingEncoding (enc:NSStringEncoding) :Int;

	public function decomposedStringWithCanonicalMapping () :String;
	public function precomposedStringWithCanonicalMapping () :String;
	public function decomposedStringWithCompatibilityMapping () :String;
	public function precomposedStringWithCompatibilityMapping () :String;

	public function stringByFoldingWithOptions (options:NSStringCompareOptions, locale:NSLocale) :String;
	@:overload(function(target:String, withString:String, options:NSStringCompareOptions, range:NSRange) :String {})
	public function stringByReplacingOccurrencesOfString (target:NSString, withString:String) :String;
	public function stringByReplacingCharactersInRange (range:NSRange, withString:String) :String;


//+ (const NSStringEncoding *)availableStringEncodings;
//+ (NSString *)localizedNameOfStringEncoding:(NSStringEncoding)encoding;

	override public function init () :NSString;
	public function initWithCharactersNoCopy (characters:String, length:Int, freeWhenDone:Bool) :NSString;
	public function initWithCharacters (characters:String, length:Int) :NSString;
	public function initWithUTF8String (nullTerminatedCString:String) :NSString;
	public function initWithString (aString:String) :NSString;
	//public function initWithFormat (format:String) :NSString;
	public function initWithFormat (format:String, arguments:Array<Dynamic>) :NSString;
	//public function initWithFormat (NSString *)format locale:(id)locale, ... NS_FORMAT_FUNCTION(1,3);
	//public function initWithFormat (NSString *)format locale:(id)locale arguments:(va_list)argList NS_FORMAT_FUNCTION(1,0);
	public function initWithData (data:NSData, encoding:NSStringEncoding) :NSString;
	public function initWithBytes (bytes:Void, length:Int, encoding:NSStringEncoding) :NSString;
	public function initWithBytesNoCopy (bytes:Void, length:Int, encoding:NSStringEncoding, freeWhenDone:Bool) :NSString;

	public static function string () :NSString;
	public static function stringWithString (string:String) :NSString;
	public static function stringWithCharacters (characters:String, length:Int) :NSString;
	public static function stringWithUTF8String (nullTerminatedCString:String) :NSString;
	public static function stringWithFormat (format:String, ?p1:Dynamic, ?p2:Dynamic, ?p3:Dynamic) :NSString;
	public static function localizedStringWithFormat (format:String) :NSString;

	public function initWithCString (nullTerminatedCString:String, encoding:NSStringEncoding) :NSString;
	public static function stringWithCString (cString:String, encoding:NSStringEncoding) :NSString;

	public function initWithContentsOfURL (url:NSURL, usedEncoding:NSStringEncoding, error:NSError) :NSString;
	public function initWithContentsOfFile (path:String, usedEncoding:NSStringEncoding, error:NSError) :NSString;
	public static function stringWithContentsOfURL (url:NSURL, usedEncoding:NSStringEncoding, error:NSError) :NSString;
	public static function stringWithContentsOfFile (path:String, usedEncoding:NSStringEncoding, error:NSError) :NSString;

//- (Bool)writeToURL (NSURL *)url atomically:(Bool)useAuxiliaryFile encoding:(NSStringEncoding)enc error:(NSError **)error;
//- (Bool)writeToFile (NSString *)path atomically:(Bool)useAuxiliaryFile encoding:(NSStringEncoding)enc error:(NSError **)error;

//(NSStringPathExtensions)

/*+ (NSString *)pathWithComponents:(Array<> *)components;
- (Array<> *)pathComponents;

- (Bool)isAbsolutePath;

- (NSString *)lastPathComponent;
- (NSString *)stringByDeletingLastPathComponent;
- (NSString *)stringByAppendingPathComponent:(NSString *)str;

- (NSString *)pathExtension;
- (NSString *)stringByDeletingPathExtension;
- (NSString *)stringByAppendingPathExtension:(NSString *)str;

- (NSString *)stringByAbbreviatingWithTildeInPath;
- (NSString *)stringByExpandingTildeInPath;

- (NSString *)stringByStandardizingPath;

- (NSString *)stringByResolvingSymlinksInPath;

- (Array<> *)stringsByAppendingPaths:(Array<> *)paths;

- (NSUInteger)completePathIntoString:(NSString **)outputName caseSensitive:(Bool)flag matchesIntoArray:(Array<> **)outputArray filterTypes:(Array<> *)filterTypes;

- (__strong const char *)fileSystemRepresentation NS_RETURNS_INNER_POINTER;
- (Bool)getFileSystemRepresentation:(char *)cname maxLength:(NSUInteger)max;*/

}


@:framework("Foundation")
extern class NSMutableString extends NSString {

	public function replaceCharactersInRange (range:NSRange, withString:NSString) :Void;

	public function insertString (aString:NSString, atIndex:Int) :Void;
	public function deleteCharactersInRange (range:NSRange) :Void;
	public function appendString (aString:NSString) :Void;
	public function appendFormat (format:NSString) :Void;
	public function setString (aString:NSString) :Void;

	public function initWithCapacity (capacity:Int) :NSMutableString;
	public static function stringWithCapacity (capacity:Int) :NSMutableString;

	public function replaceOccurrencesOfString (target:NSString, withString:NSString, options:NSStringCompareOptions, range:NSRange) :Int;
}
