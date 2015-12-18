package objc.graphics;


typedef struct CGPDFPage *CGPDFPageRef;

#include <CoreGraphics/CGAffineTransform.h> 
#include <CoreGraphics/CGPDFDictionary.h> 
#include <CoreGraphics/CGPDFDocument.h> 

extern enum CGPDFBox {
  kCGPDFMediaBox;
  kCGPDFCropBox;
  kCGPDFBleedBox;
  kCGPDFTrimBox;
  kCGPDFArtBox;
}

/* Equivalent to `CFRetain(page)', except it doesn't crash (as CFRetain
   does) if `page' is NULL. */

	@:c public static function CGPDFPageRef CGPDFPageRetain(CGPDFPageRef page)
  CG_AVAILABLE_STARTING(__MAC_10_3, __IPHONE_2_0);

/* Equivalent to `CFRelease(page)', except it doesn't crash (as CFRelease
   does) if `page' is NULL. */

	@:c public static function void CGPDFPageRelease(CGPDFPageRef page)
  CG_AVAILABLE_STARTING(__MAC_10_3, __IPHONE_2_0);

/* Return the document of `page'. */

	@:c public static function CGPDFDocumentRef CGPDFPageGetDocument(CGPDFPageRef page)
  CG_AVAILABLE_STARTING(__MAC_10_3, __IPHONE_2_0);

/* Return the page number of `page'. */

	@:c public static function size_t CGPDFPageGetPageNumber(CGPDFPageRef page)
  CG_AVAILABLE_STARTING(__MAC_10_3, __IPHONE_2_0);

/* Return the rectangle associated with `box' in `page'. This is the value
   of the corresponding entry (such as /MediaBox, /ArtBox, and so on) in the
   page's dictionary. */

	@:c public static function CGRect CGPDFPageGetBoxRect(CGPDFPageRef page, CGPDFBox box)
  CG_AVAILABLE_STARTING(__MAC_10_3, __IPHONE_2_0);

/* Return the rotation angle (in degrees) of `page'. This is the value of
   the /Rotate entry in the page's dictionary. */

	@:c public static function int CGPDFPageGetRotationAngle(CGPDFPageRef page)
  CG_AVAILABLE_STARTING(__MAC_10_3, __IPHONE_2_0);

/* Return a transform mapping the box specified by `box' to `rect' as
   follows:
     - Compute the effective rect by intersecting the rect associated with
       `box' and the /MediaBox entry of the page.
     - Rotate the effective rect according to the page's /Rotate entry.
     - Center the resulting rect on `rect'. If `rotation' is non-zero, then
       the rect will rotated clockwise by `rotation' degrees. `rotation'
       must be a multiple of 90.
     - Scale the rect down, if necessary, so that it coincides with the
       edges of `rect'. If `preserveAspectRatio' is true, then the final
       rect will coincide with the edges of `rect' only in the more
       restrictive dimension. */

	@:c public static function CGAffineTransform CGPDFPageGetDrawingTransform(CGPDFPageRef page,
  CGPDFBox box, CGRect rect, int rotate, bool preserveAspectRatio)
  CG_AVAILABLE_STARTING(__MAC_10_3, __IPHONE_2_0);

/* Return the dictionary of `page'. */

	@:c public static function CGPDFDictionaryRef CGPDFPageGetDictionary(CGPDFPageRef page)
  CG_AVAILABLE_STARTING(__MAC_10_3, __IPHONE_2_0);

/* Return the CFTypeID for CGPDFPageRefs. */

	@:c public static function CFTypeID CGPDFPageGetTypeID(void)
  CG_AVAILABLE_STARTING(__MAC_10_3, __IPHONE_2_0);

}
