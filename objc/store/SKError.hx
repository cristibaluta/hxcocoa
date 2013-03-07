package objc.store;

// error codes for the SKErrorDomain
extern enum SKErrorDomain {
    SKErrorUnknown;
    SKErrorClientInvalid;               // client is not allowed to issue the request, etc.
    SKErrorPaymentCancelled;            // user cancelled the request, etc.
    SKErrorPaymentInvalid;              // purchase identifier was invalid, etc.
    SKErrorPaymentNotAllowed;           // this device is not allowed to make the payment
    SKErrorStoreProductNotAvailable;    // Product is not available in the current storefront
}
