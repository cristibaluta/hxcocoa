package objc.foundation;


extern class NSFormatter implements NSCopying implements NSCoding
{

	//Constants

	//Static Methods

	//Properties

	//Methods
	public  function attributedStringForObjectValue( obj:Dynamic,  attrs:NSDictionary):NSAttributedString;
	public  function stringForObjectValue( obj:Dynamic):String;
	public  function isPartialStringValid( partialString:String,  newString:NSString*,  error:NSString*):Bool;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function isPartialStringValid1( partialStringPtr:NSString*,  proposedSelRangePtr:NSRangePointer,  origString:String,  origSelRange:NSRange,  error:NSString*):Bool;
	public  function editingStringForObjectValue( obj:Dynamic):String;
	public  function getObjectValue( obj:outid,  string:String,  error:outNSString*):Bool;
}

