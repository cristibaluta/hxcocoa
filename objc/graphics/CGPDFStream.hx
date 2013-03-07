package objc.graphics;


typedef CGPDFStreamRef = CGPDFStream;

extern enum CGPDFDataFormat {
    CGPDFDataFormatRaw; CGPDFDataFormatJPEGEncoded; CGPDFDataFormatJPEG2000;
}

extern class CGPDFStream {
/* Return the dictionary of `stream'. */

	@:c public static function CGPDFStreamGetDictionary(stream:CGPDFStreamRef) :CGPDFDictionaryRef;

/* Return the data of `stream'. */

	@:c public static function CGPDFStreamCopyData(stream:CGPDFStreamRef, format:CGPDFDataFormat) :CFDataRef;

}
