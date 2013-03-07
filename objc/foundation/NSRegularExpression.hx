package objc.foundation;

extern enum NSRegularExpressionOptions {
   NSRegularExpressionCaseInsensitive;     /* Match letters in the pattern independent of case. */
   NSRegularExpressionAllowCommentsAndWhitespace;     /* Ignore whitespace and #-prefixed comments in the pattern. */
   NSRegularExpressionIgnoreMetacharacters;     /* Treat the entire pattern as a literal string. */
   NSRegularExpressionDotMatchesLineSeparators;     /* Allow . to match any character, including line separators. */
   NSRegularExpressionAnchorsMatchLines;     /* Allow ^ and $ to match the start and end of lines. */
   NSRegularExpressionUseUnixLineSeparators;     /* Treat only \n as a line separator (otherwise, all standard line separators are used). */
   NSRegularExpressionUseUnicodeWordBoundaries;      /* Use Unicode TR#29 to specify word boundaries (otherwise, traditional regular expression word boundaries are used). */
}

extern enum NSMatchingOptions {
   NSMatchingReportProgress;/* Call the block periodically during long-running match operations. */
   NSMatchingReportCompletion;/* Call the block once after the completion of any matching. */
   NSMatchingAnchored;/* Limit matches to those at the start of the search range. */
   NSMatchingWithTransparentBounds;/* Allow matching to look beyond the bounds of the search range. */
   NSMatchingWithoutAnchoringBounds;/* Prevent ^ and $ from automatically matching the beginning and end of the search range. */
}

extern enum NSMatchingFlags {
   NSMatchingProgress;/* Set when the block is called to report progress during a long-running match operation. */
   NSMatchingCompleted;/* Set when the block is called after completion of any matching. */
   NSMatchingHitEnd;/* Set when the current match operation reached the end of the search range. */
   NSMatchingRequiredEnd;/* Set when the current match depended on the location of the end of the search range. */
   NSMatchingInternalError;/* Set when matching failed due to an internal error. */
}

@:require(osx_10_7)
extern class NSRegularExpression extends NSObject implements NSCopying implements NSCoding {

	public static function regularExpressionWithPattern (pattern:String, options:NSRegularExpressionOptions, error:NSError) : NSRegularExpression;
	public function initWithPattern (pattern:String, options:NSRegularExpressionOptions, error:NSError) : NSRegularExpression;

	public var pattern :String;
	public var options : NSRegularExpressionOptions;
	public var numberOfCaptureGroups :Int;

	public static function escapedPatternForString (string:String) :String;

// NSMatching

#if NS_BLOCKS_AVAILABLE
	public function enumerateMatchesInString (string:String, options:NSMatchingOptions, range:NSRange, usingBlock:NSTextCheckingResult->NSMatchingFlags->Bool->Void) :Void;
#end

	public function matchesInString (string:String, options:NSMatchingOptions, range:NSRange) :Array<String>;
	public function numberOfMatchesInString (string:String, options:NSMatchingOptions, range:NSRange) :Int;
	public function firstMatchInString (string:String, options:NSMatchingOptions, range:NSRange) : NSTextCheckingResult;
	public function rangeOfFirstMatchInString (string:String, options:NSMatchingOptions, range:NSRange) :NSRange;


// (NSReplacement)


	public function stringByReplacingMatchesInString (string:String, options:NSMatchingOptions, range:NSRange, withTemplate:String) :String;
	public function replaceMatchesInString (string:String, options:NSMatchingOptions, range:NSRange, withTemplate:String) :Int;
	public function replacementStringForResult (result:NSTextCheckingResult, inString:String, offset:Int, template:String) :String;

	public static function escapedTemplateForString (string:String) :String;

}

@:require(10_7, 4_0)
extern class NSDataDetector extends NSRegularExpression {

	public static function dataDetectorWithTypes (checkingTypes:NSTextCheckingTypes, error:NSError) : NSDataDetector;
	public function initWithTypes (checkingTypes:NSTextCheckingTypes, error:NSError) : NSDataDetector;

	public var checkingTypes :NSTextCheckingTypes;

}

