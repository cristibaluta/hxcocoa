package objc.foundation;


extern class NSValueTransformer extends NSObject {
	
	public static function transformedValueClass () :Class<Dynamic>;
	public static function allowsReverseTransformation():Bool;
	public static function valueTransformerForName (name:String) :NSValueTransformer;
	public static function valueTransformerNames () :Array<String>;
	public static function setValueTransformer (transformer:NSValueTransformer, forName:String) :Void;
	
	public function transformedValue (value:Dynamic) :Dynamic;
	public function reverseTransformedValue (value:Dynamic) :Dynamic;
}

