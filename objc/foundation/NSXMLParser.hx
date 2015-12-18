package objc.foundation;


extern class NSXMLParser
{

	//Constants

	//Static Methods

	//Properties

	//Methods
	public function setShouldResolveExternalEntities( shouldResolveExternalEntities:Bool):Void;
	public function parse():Bool;
	public function initWithStream( stream:NSInputStream):Dynamic;
	public function shouldResolveExternalEntities():Bool;
	public function setShouldReportNamespacePrefixes( shouldReportNamespacePrefixes:Bool):Void;
	public function initWithContentsOfURL( url:NSURL):Dynamic;
	public function columnNumber():Int;
	public function initWithData( data:NSData):Dynamic;
	public function setShouldProcessNamespaces( shouldProcessNamespaces:Bool):Void;
	public function shouldReportNamespacePrefixes():Bool;
	public function delegate():id<NSXMLParserDelegate>;
	public function setDelegate( delegate:id<NSXMLParserDelegate>):Void;
	public function parser( parser:NSXMLParser,  name:String,  publicID:String,  systemID:String):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public function parser1( parser:NSXMLParser,  name:String,  publicID:String,  systemID:String,  notationName:String):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public function parser2( parser:NSXMLParser,  attributeName:String,  elementName:String,  type:String,  defaultValue:String):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public function parser3( parser:NSXMLParser,  elementName:String,  model:String):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public function parser4( parser:NSXMLParser,  name:String,  value:String):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public function parser5( parser:NSXMLParser,  name:String,  publicID:String,  systemID:String):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public function parser6( parser:NSXMLParser,  elementName:String,  namespaceURI:String,  qName:String,  attributeDict:NSDictionary):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public function parser7( parser:NSXMLParser,  elementName:String,  namespaceURI:String,  qName:String):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public function parser8( parser:NSXMLParser,  prefix:String,  namespaceURI:String):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public function parser9( parser:NSXMLParser,  prefix:String):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public function parser10( parser:NSXMLParser,  string:String):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public function parser11( parser:NSXMLParser,  whitespaceString:String):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public function parser12( parser:NSXMLParser,  target:String,  data:String):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public function parser13( parser:NSXMLParser,  comment:String):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public function parser14( parser:NSXMLParser,  CDATABlock:NSData):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public function parser15( parser:NSXMLParser,  name:String,  systemID:String):NSData;
	//@:overload !!NEED CUSTOM META DATA !!
	public function parser16( parser:NSXMLParser,  parseError:NSError):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public function parser17( parser:NSXMLParser,  validationError:NSError):Void;
	public function shouldProcessNamespaces():Bool;
	public function abortParsing():Void;
	public function parserDidEndDocument( parser:NSXMLParser):Void;
	public function parserError():NSError;
	public function lineNumber():Int;
	public function parserDidStartDocument( parser:NSXMLParser):Void;
	public function publicID():String;
	public function systemID():String;
}

extern enum NSXMLParserError
{
	NSXMLParserInternalError;
	NSXMLParserOutOfMemoryError;
	NSXMLParserDocumentStartError;
	NSXMLParserEmptyDocumentError;
	NSXMLParserPrematureDocumentEndError;
	NSXMLParserInvalidHexCharacterRefError;
	NSXMLParserInvalidDecimalCharacterRefError;
	NSXMLParserInvalidCharacterRefError;
	NSXMLParserInvalidCharacterError;
	NSXMLParserCharacterRefAtEOFError;
	NSXMLParserCharacterRefInPrologError;
	NSXMLParserCharacterRefInEpilogError;
	NSXMLParserCharacterRefInDTDError;
	NSXMLParserEntityRefAtEOFError;
	NSXMLParserEntityRefInPrologError;
	NSXMLParserEntityRefInEpilogError;
	NSXMLParserEntityRefInDTDError;
	NSXMLParserParsedEntityRefAtEOFError;
	NSXMLParserParsedEntityRefInPrologError;
	NSXMLParserParsedEntityRefInEpilogError;
	NSXMLParserParsedEntityRefInInternalSubsetError;
	NSXMLParserEntityReferenceWithoutNameError;
	NSXMLParserEntityReferenceMissingSemiError;
	NSXMLParserParsedEntityRefNoNameError;
	NSXMLParserParsedEntityRefMissingSemiError;
	NSXMLParserUndeclaredEntityError;
	NSXMLParserUnparsedEntityError;
	NSXMLParserEntityIsExternalError;
	NSXMLParserEntityIsParameterError;
	NSXMLParserUnknownEncodingError;
	NSXMLParserEncodingNotSupportedError;
	NSXMLParserStringNotStartedError;
	NSXMLParserStringNotClosedError;
	NSXMLParserNamespaceDeclarationError;
	NSXMLParserEntityNotStartedError;
	NSXMLParserEntityNotFinishedError;
	NSXMLParserLessThanSymbolInAttributeError;
	NSXMLParserAttributeNotStartedError;
	NSXMLParserAttributeNotFinishedError;
	NSXMLParserAttributeHasNoValueError;
	NSXMLParserAttributeRedefinedError;
	NSXMLParserLiteralNotStartedError;
	NSXMLParserLiteralNotFinishedError;
	NSXMLParserCommentNotFinishedError;
	NSXMLParserProcessingInstructionNotStartedError;
	NSXMLParserProcessingInstructionNotFinishedError;
	NSXMLParserNotationNotStartedError;
	NSXMLParserNotationNotFinishedError;
	NSXMLParserAttributeListNotStartedError;
	NSXMLParserAttributeListNotFinishedError;
	NSXMLParserMixedContentDeclNotStartedError;
	NSXMLParserMixedContentDeclNotFinishedError;
	NSXMLParserElementContentDeclNotStartedError;
	NSXMLParserElementContentDeclNotFinishedError;
	NSXMLParserXMLDeclNotStartedError;
	NSXMLParserXMLDeclNotFinishedError;
	NSXMLParserConditionalSectionNotStartedError;
	NSXMLParserConditionalSectionNotFinishedError;
	NSXMLParserExternalSubsetNotFinishedError;
	NSXMLParserDOCTYPEDeclNotFinishedError;
	NSXMLParserMisplacedCDATAEndStringError;
	NSXMLParserCDATANotFinishedError;
	NSXMLParserMisplacedXMLDeclarationError;
	NSXMLParserSpaceRequiredError;
	NSXMLParserSeparatorRequiredError;
	NSXMLParserNMTOKENRequiredError;
	NSXMLParserNAMERequiredError;
	NSXMLParserPCDATARequiredError;
	NSXMLParserURIRequiredError;
	NSXMLParserPublicIdentifierRequiredError;
	NSXMLParserLTRequiredError;
	NSXMLParserGTRequiredError;
	NSXMLParserLTSlashRequiredError;
	NSXMLParserEqualExpectedError;
	NSXMLParserTagNameMismatchError;
	NSXMLParserUnfinishedTagError;
	NSXMLParserStandaloneValueError;
	NSXMLParserInvalidEncodingNameError;
	NSXMLParserCommentContainsDoubleHyphenError;
	NSXMLParserInvalidEncodingError;
	NSXMLParserExternalStandaloneEntityError;
	NSXMLParserInvalidConditionalSectionError;
	NSXMLParserEntityValueRequiredError;
	NSXMLParserNotWellBalancedError;
	NSXMLParserExtraContentError;
	NSXMLParserInvalidCharacterInEntityError;
	NSXMLParserParsedEntityRefInInternalError;
	NSXMLParserEntityRefLoopError;
	NSXMLParserEntityBoundaryError;
	NSXMLParserInvalidURIError;
	NSXMLParserURIFragmentError;
	NSXMLParserNoDTDError;
	NSXMLParserDelegateAbortedParseError;
}

/*	NSXMLParser.h
        Copyright (c) 2003-2012, Apple Inc. All rights reserved.
*/

package objc.foundation;

@class NSData, NSDictionary, NSError, NSString, NSURL, NSInputStream;
@protocol NSXMLParserDelegate;

extern class NSXMLParser extends NSObject {
@private
    id _reserved0;
    id _delegate;
    id _reserved1;
    id _reserved2;
    id _reserved3;
}
- (id)initWithContentsOfURL:(NSURL *)url;  // initializes the parser with the specified URL.
- (id)initWithData:(NSData *)data; // create the parser from data
- (id)initWithStream:(NSInputStream *)stream NS_AVAILABLE(10_7, 5_0); //create a parser that incrementally pulls data from the specified stream and parses it.

// delegate management. The delegate is not retained.
- (id <NSXMLParserDelegate>)delegate;
public function setDelegate:(id <NSXMLParserDelegate>)delegate;

public function setShouldProcessNamespaces:(Bool)shouldProcessNamespaces;
public function setShouldReportNamespacePrefixes:(Bool)shouldReportNamespacePrefixes;
public function setShouldResolveExternalEntities:(Bool)shouldResolveExternalEntities;
    
- (Bool)shouldProcessNamespaces;
- (Bool)shouldReportNamespacePrefixes;
- (Bool)shouldResolveExternalEntities;

- (Bool)parse;	// called to start the event-driven parse. Returns YES in the event of a successful parse, and NO in case of error.
public function abortParsing;	// called by the delegate to stop the parse. The delegate will get an error message sent to it.

- (NSError *)parserError;	// can be called after a parse is over to determine parser state.
}

// Once a parse has begun, the delegate may be interested in certain parser state. These methods will only return meaningful information during parsing, or after an error has occurred.
extern class NSXMLParser (NSXMLParserLocatorAdditions)
- (NSString *)publicID;
- (NSString *)systemID;
- (Int)lineNumber;
- (Int)columnNumber;
}

/*
 
 For the discussion of event methods, assume the following XML:

 <?xml version="1.0" encoding="UTF-8"?>
 <?xml-stylesheet type='text/css' href='cvslog.css'?>
 <!DOCTYPE cvslog SYSTEM "cvslog.dtd">
 <cvslog xmlns="http://xml.apple.com/cvslog">
   <radar:radar xmlns:radar="http://xml.apple.com/radar">
     <radar:bugID>2920186</radar:bugID>
     <radar:title>API/NSXMLParser: there ought to be an NSXMLParser</radar:title>
   </radar:radar>
 </cvslog>
 
 */

// The parser's delegate is informed of events through the methods in the NSXMLParserDelegateEventAdditions category.
@protocol NSXMLParserDelegate <NSObject>
@optional

// Document handling methods
public function parserDidStartDocument:(NSXMLParser *)parser;
    // sent when the parser begins parsing of the document.
public function parserDidEndDocument:(NSXMLParser *)parser;
    // sent when the parser has completed parsing. If this is encountered, the parse was successful.

// DTD handling methods for various declarations.
public function parser:(NSXMLParser *)parser foundNotationDeclarationWithName:(NSString *)name publicID:(NSString *)publicID systemID:(NSString *)systemID;

public function parser:(NSXMLParser *)parser foundUnparsedEntityDeclarationWithName:(NSString *)name publicID:(NSString *)publicID systemID:(NSString *)systemID notationName:(NSString *)notationName;

public function parser:(NSXMLParser *)parser foundAttributeDeclarationWithName:(NSString *)attributeName forElement:(NSString *)elementName type:(NSString *)type defaultValue:(NSString *)defaultValue;

public function parser:(NSXMLParser *)parser foundElementDeclarationWithName:(NSString *)elementName model:(NSString *)model;

public function parser:(NSXMLParser *)parser foundInternalEntityDeclarationWithName:(NSString *)name value:(NSString *)value;

public function parser:(NSXMLParser *)parser foundExternalEntityDeclarationWithName:(NSString *)name publicID:(NSString *)publicID systemID:(NSString *)systemID;

public function parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict;
    // sent when the parser finds an element start tag.
    // In the case of the cvslog tag, the following is what the delegate receives:
    //   elementName == cvslog, namespaceURI == http://xml.apple.com/cvslog, qualifiedName == cvslog
    // In the case of the radar tag, the following is what's passed in:
    //    elementName == radar, namespaceURI == http://xml.apple.com/radar, qualifiedName == radar:radar
    // If namespace processing >isn't< on, the xmlns:radar="http://xml.apple.com/radar" is returned as an attribute pair, the elementName is 'radar:radar' and there is no qualifiedName.

public function parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName;
    // sent when an end tag is encountered. The various parameters are supplied as above.

public function parser:(NSXMLParser *)parser didStartMappingPrefix:(NSString *)prefix toURI:(NSString *)namespaceURI;
    // sent when the parser first sees a namespace attribute.
    // In the case of the cvslog tag, before the didStartElement:, you'd get one of these with prefix == @"" and namespaceURI == @"http://xml.apple.com/cvslog" (i.e. the default namespace)
    // In the case of the radar:radar tag, before the didStartElement: you'd get one of these with prefix == @"radar" and namespaceURI == @"http://xml.apple.com/radar"

public function parser:(NSXMLParser *)parser didEndMappingPrefix:(NSString *)prefix;
    // sent when the namespace prefix in question goes out of scope.

public function parser:(NSXMLParser *)parser foundCharacters:(NSString *)string;
    // This returns the string of the characters encountered thus far. You may not necessarily get the longest character run. The parser reserves the right to hand these to the delegate as potentially many calls in a row to -parser:foundCharacters:

public function parser:(NSXMLParser *)parser foundIgnorableWhitespace:(NSString *)whitespaceString;
    // The parser reports ignorable whitespace in the same way as characters it's found.

public function parser:(NSXMLParser *)parser foundProcessingInstructionWithTarget:(NSString *)target data:(NSString *)data;
    // The parser reports a processing instruction to you using this method. In the case above, target == @"xml-stylesheet" and data == @"type='text/css' href='cvslog.css'"

public function parser:(NSXMLParser *)parser foundComment:(NSString *)comment;
    // A comment (Text in a <!-- --> block) is reported to the delegate as a single string

public function parser:(NSXMLParser *)parser foundCDATA:(NSData *)CDATABlock;
    // this reports a CDATA block to the delegate as an NSData.

- (NSData *)parser:(NSXMLParser *)parser resolveExternalEntityName:(NSString *)name systemID:(NSString *)systemID;
    // this gives the delegate an opportunity to resolve anexternal entity itself and reply with the resulting data.

public function parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError;
    // ...and this reports a fatal error to the delegate. The parser will stop parsing.

public function parser:(NSXMLParser *)parser validationErrorOccurred:(NSError *)validationError;
    // If validation is on, this will report a fatal validation error to the delegate. The parser will stop parsing.
}

FOUNDATION_EXPORT NSString * const NSXMLParserErrorDomain	NS_AVAILABLE(10_3, 2_0);  // for use with NSError.

// Error reporting
typedef NS_ENUM(Int, NSXMLParserError) {
    NSXMLParserInternalError = 1,
    NSXMLParserOutOfMemoryError = 2,
    NSXMLParserDocumentStartError = 3,
    NSXMLParserEmptyDocumentError = 4,
    NSXMLParserPrematureDocumentEndError = 5,
    NSXMLParserInvalidHexCharacterRefError = 6,
    NSXMLParserInvalidDecimalCharacterRefError = 7,
    NSXMLParserInvalidCharacterRefError = 8,
    NSXMLParserInvalidCharacterError = 9,
    NSXMLParserCharacterRefAtEOFError = 10,
    NSXMLParserCharacterRefInPrologError = 11,
    NSXMLParserCharacterRefInEpilogError = 12,
    NSXMLParserCharacterRefInDTDError = 13,
    NSXMLParserEntityRefAtEOFError = 14,
    NSXMLParserEntityRefInPrologError = 15,
    NSXMLParserEntityRefInEpilogError = 16,
    NSXMLParserEntityRefInDTDError = 17,
    NSXMLParserParsedEntityRefAtEOFError = 18,
    NSXMLParserParsedEntityRefInPrologError = 19,
    NSXMLParserParsedEntityRefInEpilogError = 20,
    NSXMLParserParsedEntityRefInInternalSubsetError = 21,
    NSXMLParserEntityReferenceWithoutNameError = 22,
    NSXMLParserEntityReferenceMissingSemiError = 23,
    NSXMLParserParsedEntityRefNoNameError = 24,
    NSXMLParserParsedEntityRefMissingSemiError = 25,
    NSXMLParserUndeclaredEntityError = 26,
    NSXMLParserUnparsedEntityError = 28,
    NSXMLParserEntityIsExternalError = 29,
    NSXMLParserEntityIsParameterError = 30,
    NSXMLParserUnknownEncodingError = 31,
    NSXMLParserEncodingNotSupportedError = 32,
    NSXMLParserStringNotStartedError = 33,
    NSXMLParserStringNotClosedError = 34,
    NSXMLParserNamespaceDeclarationError = 35,
    NSXMLParserEntityNotStartedError = 36,
    NSXMLParserEntityNotFinishedError = 37,
    NSXMLParserLessThanSymbolInAttributeError = 38,
    NSXMLParserAttributeNotStartedError = 39,
    NSXMLParserAttributeNotFinishedError = 40,
    NSXMLParserAttributeHasNoValueError = 41,
    NSXMLParserAttributeRedefinedError = 42,
    NSXMLParserLiteralNotStartedError = 43,
    NSXMLParserLiteralNotFinishedError = 44,
    NSXMLParserCommentNotFinishedError = 45,
    NSXMLParserProcessingInstructionNotStartedError = 46,
    NSXMLParserProcessingInstructionNotFinishedError = 47,
    NSXMLParserNotationNotStartedError = 48,
    NSXMLParserNotationNotFinishedError = 49,
    NSXMLParserAttributeListNotStartedError = 50,
    NSXMLParserAttributeListNotFinishedError = 51,
    NSXMLParserMixedContentDeclNotStartedError = 52,
    NSXMLParserMixedContentDeclNotFinishedError = 53,
    NSXMLParserElementContentDeclNotStartedError = 54,
    NSXMLParserElementContentDeclNotFinishedError = 55,
    NSXMLParserXMLDeclNotStartedError = 56,
    NSXMLParserXMLDeclNotFinishedError = 57,
    NSXMLParserConditionalSectionNotStartedError = 58,
    NSXMLParserConditionalSectionNotFinishedError = 59,
    NSXMLParserExternalSubsetNotFinishedError = 60,
    NSXMLParserDOCTYPEDeclNotFinishedError = 61,
    NSXMLParserMisplacedCDATAEndStringError = 62,
    NSXMLParserCDATANotFinishedError = 63,
    NSXMLParserMisplacedXMLDeclarationError = 64,
    NSXMLParserSpaceRequiredError = 65,
    NSXMLParserSeparatorRequiredError = 66,
    NSXMLParserNMTOKENRequiredError = 67,
    NSXMLParserNAMERequiredError = 68,
    NSXMLParserPCDATARequiredError = 69,
    NSXMLParserURIRequiredError = 70,
    NSXMLParserPublicIdentifierRequiredError = 71,
    NSXMLParserLTRequiredError = 72,
    NSXMLParserGTRequiredError = 73,
    NSXMLParserLTSlashRequiredError = 74,
    NSXMLParserEqualExpectedError = 75,
    NSXMLParserTagNameMismatchError = 76,
    NSXMLParserUnfinishedTagError = 77,
    NSXMLParserStandaloneValueError = 78,
    NSXMLParserInvalidEncodingNameError = 79,
    NSXMLParserCommentContainsDoubleHyphenError = 80,
    NSXMLParserInvalidEncodingError = 81,
    NSXMLParserExternalStandaloneEntityError = 82,
    NSXMLParserInvalidConditionalSectionError = 83,
    NSXMLParserEntityValueRequiredError = 84,
    NSXMLParserNotWellBalancedError = 85,
    NSXMLParserExtraContentError = 86,
    NSXMLParserInvalidCharacterInEntityError = 87,
    NSXMLParserParsedEntityRefInInternalError = 88,
    NSXMLParserEntityRefLoopError = 89,
    NSXMLParserEntityBoundaryError = 90,
    NSXMLParserInvalidURIError = 91,
    NSXMLParserURIFragmentError = 92,
    NSXMLParserNoDTDError = 94,
    NSXMLParserDelegateAbortedParseError = 512
};
