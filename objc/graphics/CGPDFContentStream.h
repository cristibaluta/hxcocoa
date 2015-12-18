package objc.graphics;


typedef struct CGPDFContentStream *CGPDFContentStreamRef;

#include <CoreGraphics/CGPDFPage.h>

/* Create a content stream from `page'. */

	@:c public static function CGPDFContentStreamRef CGPDFContentStreamCreateWithPage(
  CGPDFPageRef page) CG_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

/* Create a content stream from `stream'. */

	@:c public static function CGPDFContentStreamRef CGPDFContentStreamCreateWithStream(
  CGPDFStreamRef stream, CGPDFDictionaryRef streamResources,
  CGPDFContentStreamRef parent)
  CG_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

/* Increment the retain count of `cs'. */

	@:c public static function CGPDFContentStreamRef CGPDFContentStreamRetain(
  CGPDFContentStreamRef cs) CG_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

/* Decrement the retain count of `cs'. */

	@:c public static function void CGPDFContentStreamRelease(CGPDFContentStreamRef cs)
    CG_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

/* Return the array of CGPDFStreamRefs comprising the entire content stream
   of `cs'. */

	@:c public static function CFArrayRef CGPDFContentStreamGetStreams(CGPDFContentStreamRef cs)
    CG_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

/* Return the resource named `name' in category `category' of the resource
   dictionaries of `cs'. */

	@:c public static function CGPDFObjectRef CGPDFContentStreamGetResource(
  CGPDFContentStreamRef cs, const char *category, const char *name)
  CG_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

#endif /* CGPDFCONTENTSTREAM_H_ */
