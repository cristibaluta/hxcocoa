package objc.graphics;


typedef CGPDFStringRef = CGPDFString;

extern class CGPDFString {
/* Return the length of `string'. */

	@:c public static function CGPDFStringGetLength(string:CGPDFStringRef) :Int;

/* Return a pointer to the bytes of `string'. */

	@:c public static function CGPDFStringGetBytePtr(string:CGPDFStringRef) :const unsigned char;

/* Return a CFString representing `string' as a "text string". See Section
   3.8.1 "Text Strings", PDF Reference: Adobe PDF version 1.6 (5th ed.) for
   more information. */

	@:c public static function CGPDFStringCopyTextString(string:CGPDFStringRef) :CFStringRef;

/* Convert `string' to a CFDate. See Section 3.8.3 "Dates", PDF Reference:
   Adobe PDF version 1.6 (5th ed.) for more information. */

	@:c public static function CGPDFStringCopyDate(string:CGPDFStringRef) :CFDateRef;

}
