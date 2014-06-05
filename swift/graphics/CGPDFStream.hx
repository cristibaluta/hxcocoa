package swift.graphics;


typedef CGPDFStreamRef = CGPDFStream;

@:framework("CoreGraphics")
extern enum CGPDFDataFormat {
    CGPDFDataFormatRaw; CGPDFDataFormatJPEGEncoded; CGPDFDataFormatJPEG2000;
}

@:framework("CoreGraphics")
extern class CGPDFStream {
/* Return the dictionary of `stream'. */

	@:c public static function CGPDFStreamGetDictionary(stream:CGPDFStreamRef) :CGPDFDictionaryRef;

/* Return the data of `stream'. */

	@:c public static function CGPDFStreamCopyData(stream:CGPDFStreamRef, format:CGPDFDataFormat) :CFDataRef;

}
