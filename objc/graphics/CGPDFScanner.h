package objc.graphics;


typedef struct CGPDFScanner *CGPDFScannerRef;

#include <CoreGraphics/CGPDFContentStream.h>
#include <CoreGraphics/CGPDFOperatorTable.h>

/* Create a scanner. */

	@:c public static function CGPDFScannerRef CGPDFScannerCreate(CGPDFContentStreamRef cs,
  CGPDFOperatorTableRef table, void *info)
  CG_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

/* Retain `scanner'. */

	@:c public static function CGPDFScannerRef CGPDFScannerRetain(CGPDFScannerRef scanner)
  CG_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

/* Release `scanner'. */

	@:c public static function void CGPDFScannerRelease(CGPDFScannerRef scanner)
  CG_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

/* Scan the content stream of `scanner'. Returns true if the entire stream
   was scanned successfully; false if scanning failed for some reason (for
   example, if the stream's data is corrupted). */

	@:c public static function bool CGPDFScannerScan(CGPDFScannerRef scanner)
  CG_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

/* Return the content stream associated with `scanner'. */

	@:c public static function CGPDFContentStreamRef CGPDFScannerGetContentStream(
  CGPDFScannerRef scanner) CG_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

/* Pop an object from the stack of `scanner' and return it in `value'. */

	@:c public static function bool CGPDFScannerPopObject(CGPDFScannerRef scanner,
  CGPDFObjectRef *value) CG_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

/* Pop an object from the stack of `scanner' and, if it's a boolean, return
   it in `value'. Return false if the top of the stack isn't a boolean. */

	@:c public static function bool CGPDFScannerPopBoolean(CGPDFScannerRef scanner,
  CGPDFBoolean *value) CG_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

/* Pop an object from the stack of `scanner' and, if it's an integer, return
   it in `value'. Return false if the top of the stack isn't an integer. */

	@:c public static function bool CGPDFScannerPopInteger(CGPDFScannerRef scanner,
  CGPDFInteger *value) CG_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

/* Pop an object from the stack of `scanner' and, if it's a number, return
   it in `value'. Return false if the top of the stack isn't a number. */

	@:c public static function bool CGPDFScannerPopNumber(CGPDFScannerRef scanner, CGPDFReal *value)
  CG_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

/* Pop an object from the stack of `scanner' and, if it's a name, return it
   in `value'. Return false if the top of the stack isn't a name. */

	@:c public static function bool CGPDFScannerPopName(CGPDFScannerRef scanner, const char **value)
  CG_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

/* Pop an object from the stack of `scanner' and, if it's a string, return
   it in `value'. Return false if the top of the stack isn't a string. */

	@:c public static function bool CGPDFScannerPopString(CGPDFScannerRef scanner,
  CGPDFStringRef *value) CG_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

/* Pop an object from the stack of `scanner' and, if it's an array, return
   it in `value'. Return false if the top of the stack isn't an array. */

	@:c public static function bool CGPDFScannerPopArray(CGPDFScannerRef scanner,
  CGPDFArrayRef *value) CG_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

/* Pop an object from the stack of `scanner' and, if it's a dictionary,
   return it in `value'. Return false if the top of the stack isn't a
   dictionary. */

	@:c public static function bool CGPDFScannerPopDictionary(CGPDFScannerRef scanner,
  CGPDFDictionaryRef *value) CG_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

/* Pop an object from the stack of `scanner' and, if it's a stream, return
   it in `value'. Return false if the top of the stack isn't a stream. */

	@:c public static function bool CGPDFScannerPopStream(CGPDFScannerRef scanner,
  CGPDFStreamRef *value) CG_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

#endif /* CGPDFSCANNER_H_ */
