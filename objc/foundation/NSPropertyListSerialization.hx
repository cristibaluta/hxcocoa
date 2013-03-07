package objc.foundation;


extern class NSPropertyListSerialization
{

	//Constants

	//Static Methods
	public  function writePropertyList( plist:Dynamic,  stream:NSOutputStream,  format:NSPropertyListFormat,  opt:NSPropertyListWriteOptions,  error:outNSError*):Int;
	public  function dataFromPropertyList( plist:Dynamic,  format:NSPropertyListFormat,  errorString:out__strongNSString*):NSData;
	public  function propertyListFromData( data:NSData,  opt:NSPropertyListMutabilityOptions,  format:NSPropertyListFormat,  errorString:out__strongNSString*):Dynamic;
	public  function dataWithPropertyList( plist:Dynamic,  format:NSPropertyListFormat,  opt:NSPropertyListWriteOptions,  error:outNSError*):NSData;
	public  function propertyList( plist:Dynamic,  format:NSPropertyListFormat):Bool;
	public  function propertyListWithData( data:NSData,  opt:NSPropertyListReadOptions,  format:NSPropertyListFormat,  error:outNSError*):Dynamic;
	public  function propertyListWithStream( stream:NSInputStream,  opt:NSPropertyListReadOptions,  format:NSPropertyListFormat,  error:outNSError*):Dynamic;

	//Properties

	//Methods
}

extern enum NSPropertyListMutabilityOptions
{
	NSPropertyListImmutable;
	NSPropertyListMutableContainers;
	NSPropertyListMutableContainersAndLeaves;
}

extern enum NSPropertyListFormat
{
	NSPropertyListOpenStepFormat;
	NSPropertyListXMLFormat_v1_0;
	NSPropertyListBinaryFormat_v1_0;
}

