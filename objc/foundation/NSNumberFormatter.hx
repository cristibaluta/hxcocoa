package objc.foundation;


extern class NSNumberFormatter extends NSFormatter
{

	//Constants

	//Static Methods
	public  function localizedStringFromNumber( num:Float,  nstyle:NSNumberFormatterStyle):String;
	public  function defaultFormatterBehavior():NSNumberFormatterBehavior;
	public  function setDefaultFormatterBehavior( behavior:NSNumberFormatterBehavior):Void;

	//Properties

	//Methods
	public  function setTextAttributesForNegativeValues( newAttributes:NSDictionary):Void;
	public  function setTextAttributesForNotANumber( newAttributes:NSDictionary):Void;
	public  function negativeSuffix():String;
	public  function setMaximumFractionDigits( number:Int):Void;
	public  function positivePrefix():String;
	public  function decimalSeparator():String;
	public  function textAttributesForPositiveInfinity():NSDictionary;
	public  function nilSymbol():String;
	public  function isLenient():Bool;
	public  function positiveFormat():String;
	public  function setTextAttributesForNil( newAttributes:NSDictionary):Void;
	public  function setLocale( locale:NSLocale):Void;
	public  function isPartialStringValidationEnabled():Bool;
	public  function generatesDecimalNumbers():Bool;
	public  function setAllowsFloats( flag:Bool):Void;
	public  function currencySymbol():String;
	public  function format():String;
	public  function setGroupingSeparator( string:String):Void;
	public  function setFormatWidth( number:Int):Void;
	public  function setExponentSymbol( string:String):Void;
	public  function setCurrencyGroupingSeparator( string:String):Void;
	public  function zeroSymbol():String;
	public  function roundingIncrement():Float;
	public  function notANumberSymbol():String;
	public  function alwaysShowsDecimalSeparator():Bool;
	public  function minimumFractionDigits():Int;
	public  function minusSign():String;
	public  function exponentSymbol():String;
	public override function getObjectValue( obj:outid,  string:String,  rangep:inoutNSRange,  error:outNSError*):Bool;
	public  function numberStyle():NSNumberFormatterStyle;
	public  function setUsesGroupingSeparator( b:Bool):Void;
	public  function setNegativeFormat( format:String):Void;
	public  function setTextAttributesForPositiveValues( newAttributes:NSDictionary):Void;
	public  function setAttributedStringForZero( newAttributedString:NSAttributedString):Void;
	public  function groupingSize():Int;
	public  function positiveInfinitySymbol():String;
	public  function setNegativeInfinitySymbol( string:String):Void;
	public  function localizesFormat():Bool;
	public  function locale():NSLocale;
	public  function usesGroupingSeparator():Bool;
	public  function minimum():Float;
	public  function setMaximum( number:Float):Void;
	public  function setNotANumberSymbol( string:String):Void;
	public  function negativePrefix():String;
	public  function setPlusSign( string:String):Void;
	public  function maximumFractionDigits():Int;
	public  function setHasThousandSeparators( flag:Bool):Void;
	public  function allowsFloats():Bool;
	public  function setCurrencySymbol( string:String):Void;
	public  function setAttributedStringForNotANumber( newAttributedString:NSAttributedString):Void;
	public  function setPaddingCharacter( string:String):Void;
	public  function hasThousandSeparators():Bool;
	public  function setPerMillSymbol( string:String):Void;
	public  function currencyGroupingSeparator():String;
	public  function numberFromString( string:String):Float;
	public  function negativeFormat():String;
	public  function textAttributesForPositiveValues():NSDictionary;
	public  function setTextAttributesForPositiveInfinity( newAttributes:NSDictionary):Void;
	public  function setMinimumIntegerDigits( number:Int):Void;
	public  function currencyDecimalSeparator():String;
	public  function setThousandSeparator( newSeparator:String):Void;
	public  function setFormat( string:String):Void;
	public  function groupingSeparator():String;
	public  function textAttributesForNegativeInfinity():NSDictionary;
	public  function setRoundingMode( mode:NSNumberFormatterRoundingMode):Void;
	public  function setCurrencyCode( string:String):Void;
	public  function maximum():Float;
	public  function setPartialStringValidationEnabled( b:Bool):Void;
	public  function attributedStringForNil():NSAttributedString;
	public  function setNegativePrefix( string:String):Void;
	public  function setMinimumSignificantDigits( number:Int):Void;
	public  function setGroupingSize( number:Int):Void;
	public  function formatterBehavior():NSNumberFormatterBehavior;
	public  function secondaryGroupingSize():Int;
	public  function setAlwaysShowsDecimalSeparator( b:Bool):Void;
	public  function setPaddingPosition( position:NSNumberFormatterPadPosition):Void;
	public  function setAttributedStringForNil( newAttributedString:NSAttributedString):Void;
	public  function setPositiveFormat( format:String):Void;
	public  function setMinusSign( string:String):Void;
	public  function setPositiveSuffix( string:String):Void;
	public  function setPositiveInfinitySymbol( string:String):Void;
	public  function negativeInfinitySymbol():String;
	public  function formatWidth():Int;
	public  function setLenient( b:Bool):Void;
	public  function minimumIntegerDigits():Int;
	public  function setNilSymbol( string:String):Void;
	public  function plusSign():String;
	public  function usesSignificantDigits():Bool;
	public  function setUsesSignificantDigits( b:Bool):Void;
	public  function minimumSignificantDigits():Int;
	public  function setMinimumFractionDigits( number:Int):Void;
	public  function setInternationalCurrencySymbol( string:String):Void;
	public  function multiplier():Float;
	public  function stringFromNumber( number:Float):String;
	public  function positiveSuffix():String;
	public  function setSecondaryGroupingSize( number:Int):Void;
	public  function roundingBehavior():NSDecimalNumberHandler;
	public  function setTextAttributesForNegativeInfinity( newAttributes:NSDictionary):Void;
	public  function setNegativeSuffix( string:String):Void;
	public  function maximumIntegerDigits():Int;
	public  function setRoundingBehavior( newRoundingBehavior:NSDecimalNumberHandler):Void;
	public  function maximumSignificantDigits():Int;
	public  function setMaximumIntegerDigits( number:Int):Void;
	public  function percentSymbol():String;
	public  function setPercentSymbol( string:String):Void;
	public  function textAttributesForNegativeValues():NSDictionary;
	public  function setGeneratesDecimalNumbers( b:Bool):Void;
	public  function thousandSeparator():String;
	public  function setPositivePrefix( string:String):Void;
	public  function roundingMode():NSNumberFormatterRoundingMode;
	public  function attributedStringForZero():NSAttributedString;
	public  function setNumberStyle( style:NSNumberFormatterStyle):Void;
	public  function textAttributesForZero():NSDictionary;
	public  function setRoundingIncrement( number:Float):Void;
	public  function setMaximumSignificantDigits( number:Int):Void;
	public  function paddingPosition():NSNumberFormatterPadPosition;
	public  function perMillSymbol():String;
	public  function setDecimalSeparator( string:String):Void;
	public  function setZeroSymbol( string:String):Void;
	public  function textAttributesForNotANumber():NSDictionary;
	public  function setCurrencyDecimalSeparator( string:String):Void;
	public  function setLocalizesFormat( flag:Bool):Void;
	public  function setMinimum( number:Float):Void;
	public  function internationalCurrencySymbol():String;
	public  function setMultiplier( number:Float):Void;
	public  function attributedStringForNotANumber():NSAttributedString;
	public  function setFormatterBehavior( behavior:NSNumberFormatterBehavior):Void;
	public  function currencyCode():String;
	public  function setTextAttributesForZero( newAttributes:NSDictionary):Void;
	public  function textAttributesForNil():NSDictionary;
	public  function paddingCharacter():String;
}

extern enum NSNumberFormatterStyle
{
	NSNumberFormatterNoStyle;
	NSNumberFormatterDecimalStyle;
	NSNumberFormatterCurrencyStyle;
	NSNumberFormatterPercentStyle;
	NSNumberFormatterScientificStyle;
	NSNumberFormatterSpellOutStyle;
}

extern enum NSNumberFormatterBehavior
{
	NSNumberFormatterBehaviorDefault;
	#if;
	#endif;
}

extern enum NSNumberFormatterPadPosition
{
	NSNumberFormatterPadBeforePrefix;
	NSNumberFormatterPadAfterPrefix;
	NSNumberFormatterPadBeforeSuffix;
	NSNumberFormatterPadAfterSuffix;
}

extern enum NSNumberFormatterRoundingMode
{
	NSNumberFormatterRoundCeiling;
	NSNumberFormatterRoundFloor;
	NSNumberFormatterRoundDown;
	NSNumberFormatterRoundUp;
	NSNumberFormatterRoundHalfEven;
	NSNumberFormatterRoundHalfDown;
	NSNumberFormatterRoundHalfUp;
}

