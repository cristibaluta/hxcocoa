package objc.foundation;


@:framework("Foundation")
extern class NSByteCountFormatter extends NSFormatter {

	public static function stringFromByteCount (byteCount:longlong, countStyle:NSByteCountFormatterCountStyle) :String;

	//Properties
	public var allowedUnits(default, default):NSByteCountFormatterUnits;
	public var countStyle(default, default):NSByteCountFormatterCountStyle;
	public var allowsNonnumericFormatting(default, default):Bool;
	public var includesUnit(default, default):Bool;
	public var includesCount(default, default):Bool;
	public var includesActualByteCount(default, default):Bool;
	public var adaptive(default, default):Bool;
	public var zeroPadsFractionDigits(default, default):Bool;

	//Methods
	public  function stringFromByteCount( byteCount:longlong):String;
}

extern enum NSByteCountFormatterUnits
{
	NSByteCountFormatterUseDefault;
	NSByteCountFormatterUseBytes;
	NSByteCountFormatterUseKB;
	NSByteCountFormatterUseMB;
	NSByteCountFormatterUseGB;
	NSByteCountFormatterUseTB;
	NSByteCountFormatterUsePB;
	NSByteCountFormatterUseEB;
	NSByteCountFormatterUseZB;
	NSByteCountFormatterUseYBOrHigher;
	NSByteCountFormatterUseAll;
}

extern enum NSByteCountFormatterCountStyle
{
	NSByteCountFormatterCountStyleFile;
	NSByteCountFormatterCountStyleMemory;
	NSByteCountFormatterCountStyleDecimal;
	NSByteCountFormatterCountStyleBinary;
}

