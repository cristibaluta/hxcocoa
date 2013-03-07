package objc.foundation;

// Retrieve kCFURLError* values used in the NSURLError* assignments
#if ios_4_0
#import <CFNetwork/CFNetwork.h>
#else
#import <CoreServices/CoreServices.h>
#endif
#import <Foundation/NSObjCRuntime.h>


    NSURLErrorUnknown = 			-1,
    NSURLErrorCancelled = 			kCFURLErrorCancelled,
    NSURLErrorBadURL = 				kCFURLErrorBadURL,
    NSURLErrorTimedOut = 			kCFURLErrorTimedOut,
    NSURLErrorUnsupportedURL = 			kCFURLErrorUnsupportedURL,
    NSURLErrorCannotFindHost = 			kCFURLErrorCannotFindHost,
    NSURLErrorCannotConnectToHost = 		kCFURLErrorCannotConnectToHost,
    NSURLErrorNetworkConnectionLost = 		kCFURLErrorNetworkConnectionLost,
    NSURLErrorDNSLookupFailed = 		kCFURLErrorDNSLookupFailed,
    NSURLErrorHTTPTooManyRedirects = 		kCFURLErrorHTTPTooManyRedirects,
    NSURLErrorResourceUnavailable = 		kCFURLErrorResourceUnavailable,
    NSURLErrorNotConnectedToInternet = 		kCFURLErrorNotConnectedToInternet,
    NSURLErrorRedirectToNonExistentLocation = 	kCFURLErrorRedirectToNonExistentLocation,
    NSURLErrorBadServerResponse = 		kCFURLErrorBadServerResponse,
    NSURLErrorUserCancelledAuthentication = 	kCFURLErrorUserCancelledAuthentication,
    NSURLErrorUserAuthenticationRequired = 	kCFURLErrorUserAuthenticationRequired,
    NSURLErrorZeroByteResource = 		kCFURLErrorZeroByteResource,
    NSURLErrorCannotDecodeRawData =             kCFURLErrorCannotDecodeRawData,
    NSURLErrorCannotDecodeContentData =         kCFURLErrorCannotDecodeContentData,
    NSURLErrorCannotParseResponse =             kCFURLErrorCannotParseResponse,
    NSURLErrorFileDoesNotExist = 		kCFURLErrorFileDoesNotExist,
    NSURLErrorFileIsDirectory = 		kCFURLErrorFileIsDirectory,
    NSURLErrorNoPermissionsToReadFile = 	kCFURLErrorNoPermissionsToReadFile,
    NSURLErrorDataLengthExceedsMaximum NS_ENUM_AVAILABLE(10_5, 2_0) =	kCFURLErrorDataLengthExceedsMaximum,
    
    // SSL errors
    NSURLErrorSecureConnectionFailed = 		kCFURLErrorSecureConnectionFailed,
    NSURLErrorServerCertificateHasBadDate = 	kCFURLErrorServerCertificateHasBadDate,
    NSURLErrorServerCertificateUntrusted = 	kCFURLErrorServerCertificateUntrusted,
    NSURLErrorServerCertificateHasUnknownRoot = kCFURLErrorServerCertificateHasUnknownRoot,
    NSURLErrorServerCertificateNotYetValid = 	kCFURLErrorServerCertificateNotYetValid,
    NSURLErrorClientCertificateRejected = 	kCFURLErrorClientCertificateRejected,
    NSURLErrorClientCertificateRequired =	kCFURLErrorClientCertificateRequired,
    NSURLErrorCannotLoadFromNetwork = 		kCFURLErrorCannotLoadFromNetwork,
    
    // Download and file I/O errors
    NSURLErrorCannotCreateFile = 		kCFURLErrorCannotCreateFile,
    NSURLErrorCannotOpenFile = 			kCFURLErrorCannotOpenFile,
    NSURLErrorCannotCloseFile = 		kCFURLErrorCannotCloseFile,
    NSURLErrorCannotWriteToFile = 		kCFURLErrorCannotWriteToFile,
    NSURLErrorCannotRemoveFile = 		kCFURLErrorCannotRemoveFile,
    NSURLErrorCannotMoveFile = 			kCFURLErrorCannotMoveFile,
    NSURLErrorDownloadDecodingFailedMidStream = kCFURLErrorDownloadDecodingFailedMidStream,
    NSURLErrorDownloadDecodingFailedToComplete =kCFURLErrorDownloadDecodingFailedToComplete,

    NSURLErrorInternationalRoamingOff NS_ENUM_AVAILABLE(10_7, 3_0) =         kCFURLErrorInternationalRoamingOff,
    NSURLErrorCallIsActive NS_ENUM_AVAILABLE(10_7, 3_0) =                    kCFURLErrorCallIsActive,
    NSURLErrorDataNotAllowed NS_ENUM_AVAILABLE(10_7, 3_0) =                  kCFURLErrorDataNotAllowed,
    NSURLErrorRequestBodyStreamExhausted NS_ENUM_AVAILABLE(10_7, 3_0) =      kCFURLErrorRequestBodyStreamExhausted,
};

