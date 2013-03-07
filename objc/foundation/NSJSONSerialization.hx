package objc.foundation;
import objc.foundation.NSObject;
import objc.foundation.NSData;

typedef NSInputStream = Dynamic;
typedef NSOutputStream = Dynamic;

/* A class for converting JSON to Foundation objects and converting Foundation objects to JSON.
   
   An object that may be converted to JSON must have the following properties:
    - Top level object is an Array<> or NSDictionary
    - All objects are NSString, NSNumber, Array<>, NSDictionary, or NSNull
    - All dictionary keys are NSStrings
    - NSNumbers are not NaN or infinity
*/
@:require(ios5_0,osx_10_7) extern class NSJSONSerialization extends NSObject {
	
	/* Returns YES if the given object can be converted to JSON data, NO otherwise. The object must have the following properties:
	    - Top level object is an Array<> or NSDictionary
	    - All objects are NSString, NSNumber, Array<>, NSDictionary, or NSNull
	    - All dictionary keys are NSStrings
	    - NSNumbers are not NaN or infinity
	 Other rules may apply. Calling this method or attempting a conversion are the definitive ways to tell if a given object can be converted to JSON data.
	 */
	public static function isValidJSONObject( obj:Dynamic):Bool;
	
	/* Generate JSON data from a Foundation object. If the object will not produce valid JSON then an exception will be thrown. Setting the NSJSONWritingPrettyPrinted option will generate JSON with whitespace designed to make the output more readable. If that option is not set, the most compact possible JSON will be generated. If an error occurs, the error parameter will be set and the return value will be nil. The resulting data is a encoded in UTF-8.
	*/
	public static function dataWithJSONObject( obj:Dynamic, options:NSJSONWritingOptions, error:NSError) :NSData;
	
	/* Create a Foundation object from JSON data. Set the NSJSONReadingAllowFragments option if the parser should allow top-level objects that are not an Array<> or NSDictionary. Setting the NSJSONReadingMutableContainers option will make the parser generate mutable Array<>s and NSDictionaries. Setting the NSJSONReadingMutableLeaves option will make the parser generate mutable NSString objects. If an error occurs during the parse, then the error parameter will be set and the result will be nil.
	   The data must be in one of the 5 supported encodings listed in the JSON specification: UTF-8, UTF-16LE, UTF-16BE, UTF-32LE, UTF-32BE. The data may or may not have a BOM. The most efficient encoding to use for parsing is UTF-8, so if you have a choice in encoding the data passed to this method, use UTF-8.
	 */
	public static function JSONObjectWithData( data:NSData, options:NSJSONReadingOptions, error:NSError) :NSJSONSerialization;
	
	/* Write JSON data into a stream. The stream should be opened and configured. The return value is the number of bytes written to the stream, or 0 on error. All other behavior of this method is the same as the dataWithJSONObject:options:error: method.
	 */
	public static function writeJSONObject( obj:Dynamic, stream:NSOutputStream, options:NSJSONWritingOptions, error:NSError):Int;
	
	/* Create a JSON object from JSON data stream. The stream should be opened and configured. All other behavior of this method is the same as the JSONObjectWithData:options:error: method.
	 */
	public static function JSONObjectWithStream( stream:NSInputStream, options:NSJSONReadingOptions, error:NSError) :NSJSONSerialization;
	
}

extern enum NSJSONReadingOptions
{
	NSJSONReadingMutableContainers;
	NSJSONReadingMutableLeaves;
	NSJSONReadingAllowFragments;
}

extern enum NSJSONWritingOptions
{
	NSJSONWritingPrettyPrinted;
}

