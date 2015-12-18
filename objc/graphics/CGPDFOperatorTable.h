package objc.graphics;


typedef struct CGPDFOperatorTable *CGPDFOperatorTableRef;

#include <CoreGraphics/CGPDFScanner.h>

typedef void (*CGPDFOperatorCallback)(CGPDFScannerRef scanner, void *info);

/* Return an empty operator table. */

	@:c public static function CGPDFOperatorTableRef CGPDFOperatorTableCreate(void)
    CG_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

/* Increment the retain count of `table'. */

	@:c public static function CGPDFOperatorTableRef CGPDFOperatorTableRetain(CGPDFOperatorTableRef
    table) CG_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

/* Decrement the retain count of `table'. */

	@:c public static function void CGPDFOperatorTableRelease(CGPDFOperatorTableRef table)
    CG_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

/* Set the callback for the operator named `name' to `callback' */

	@:c public static function void CGPDFOperatorTableSetCallback(CGPDFOperatorTableRef table,
    const char *name, CGPDFOperatorCallback callback)
    CG_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

#endif	/* CGPDFOPERATORTABLE_H_ */
