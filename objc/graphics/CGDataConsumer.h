package objc.graphics;


typedef CGDataConsumer *CGDataConsumerRef;

#include <CoreGraphics/CGBase.h>
#include <CoreFoundation/CFURL.h>
#include <stddef.h>

/* This callback is called to copy `count' bytes from `buffer' to the data
   consumer. */

typedef size_t (*CGDataConsumerPutBytesCallback)(void *info,
    const void *buffer, size_t count);

/* This callback is called to release the `info' pointer when the data
   provider is freed. */

typedef void (*CGDataConsumerReleaseInfoCallback)(void *info);

/* Callbacks for writing data.
   `putBytes' copies `count' bytes from `buffer' to the consumer, and
     returns the number of bytes copied. It should return 0 if no more data
     can be written to the consumer.
   `releaseConsumer', if non-NULL, is called when the consumer is freed. */

struct CGDataConsumerCallbacks {
    CGDataConsumerPutBytesCallback putBytes;
    CGDataConsumerReleaseInfoCallback releaseConsumer;
};
typedef struct CGDataConsumerCallbacks CGDataConsumerCallbacks;

/* Return the CFTypeID for CGDataConsumerRefs. */

	@:c public static function CFTypeID CGDataConsumerGetTypeID(void)
    CG_AVAILABLE_STARTING(__MAC_10_2, __IPHONE_2_0);

/* Create a data consumer using `callbacks' to handle the data. `info' is
   passed to each of the callback functions. */

	@:c public static function CGDataConsumerRef CGDataConsumerCreate(void *info,
    const CGDataConsumerCallbacks *callbacks)
    CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* Create a data consumer which writes data to `url'. */

	@:c public static function CGDataConsumerRef CGDataConsumerCreateWithURL(CFURLRef url)
    CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* Create a data consumer which writes to `data'. */

	@:c public static function CGDataConsumerRef CGDataConsumerCreateWithCFData(CFMutableDataRef
    data) CG_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

/* Equivalent to `CFRetain(consumer)'. */

	@:c public static function CGDataConsumerRef CGDataConsumerRetain(CGDataConsumerRef consumer)
    CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* Equivalent to `CFRelease(consumer)'. */

	@:c public static function void CGDataConsumerRelease(CGDataConsumerRef consumer)
    CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

#endif	/* CGDATACONSUMER_H_ */
