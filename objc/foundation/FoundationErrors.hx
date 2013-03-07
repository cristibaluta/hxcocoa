package objc.foundation;

@:framework("Foundation") extern class FoundationErrors {
	
	inline static public var NSFileNoSuchFileError = 4;                                              // Attempt to do a file system operation on a non-existent file
	inline static public var NSFileLockingError = 255;                                               // Couldn't get a lock on file
	inline static public var NSFileReadUnknownError = 256;                                           // Read error (reason unknown)
	inline static public var NSFileReadNoPermissionError = 257;                                      // Read error (permission problem)
	inline static public var NSFileReadInvalidFileNameError = 258;                                   // Read error (invalid file name)
	inline static public var NSFileReadCorruptFileError = 259;                                       // Read error (file corrupt; bad format; etc)
	inline static public var NSFileReadNoSuchFileError = 260;                                        // Read error (no such file)
	inline static public var NSFileReadInapplicableStringEncodingError = 261;                        // Read error (string encoding not applicable) also NSStringEncodingErrorKey
	inline static public var NSFileReadUnsupportedSchemeError = 262;                                 // Read error (unsupported URL scheme)
	inline static public var NSFileReadTooLargeError = 263;             // Read error (file too large)
	inline static public var NSFileReadUnknownStringEncodingError = 264; // Read error (string encoding of file contents could not be determined)
	inline static public var FileWriteUnknownError = 512;                                          // Write error (reason unknown)
	inline static public var FileWriteNoPermissionError = 513;                                     // Write error (permission problem)
	inline static public var FileWriteInvalidFileNameError = 514;                                  // Write error (invalid file name)
	inline static public var FileWriteFileExistsError = 516;          // Write error (file exists)
	inline static public var FileWriteInapplicableStringEncodingError = 517;                       // Write error (string encoding not applicable) also NSStringEncodingErrorKey
	inline static public var FileWriteUnsupportedSchemeError = 518;                                // Write error (unsupported URL scheme)
	inline static public var FileWriteOutOfSpaceError = 640;                                       // Write error (out of disk space)
	inline static public var FileWriteVolumeReadOnlyError = 642;      // Write error (readonly volume)

    // Other errors
	inline static public var KeyValueValidationError = 1024;                                       // KVC validation error
	inline static public var FormattingError = 2048;                                               // Formatting error
	inline static public var UserCancelledError = 3072;                                            // User cancelled operation (this one often doesn't deserve a panel and might be a good one to special case)
	inline static public var FeatureUnsupportedError = 3328;          // Feature unsupported error
    
    // Executable loading errors
	inline static public var ExecutableNotLoadableError = 3584;           // Executable is of a type that is not loadable in the current process
	inline static public var ExecutableArchitectureMismatchError = 3585;  // Executable does not provide an architecture compatible with the current process
	inline static public var ExecutableRuntimeMismatchError = 3586;       // Executable has Objective C runtime information incompatible with the current process
	inline static public var ExecutableLoadError = 3587;                  // Executable cannot be loaded for some other reason; such as a problem with a library it depends on
	inline static public var ExecutableLinkError = 3588;                  // Executable fails due to linking issues
    
    // Inclusive error range definitions; for checking future error codes
	inline static public var FileErrorMinimum = 0;
	inline static public var FileErrorMaximum = 1023;
    
	inline static public var ValidationErrorMinimum = 1024;
	inline static public var ValidationErrorMaximum = 2047;

	inline static public var ExecutableErrorMinimum = 3584;
	inline static public var ExecutableErrorMaximum = 3839;

	inline static public var NSFormattingErrorMinimum = 2048;
	inline static public var NSFormattingErrorMaximum = 2559;
    
	inline static public var NSPropertyListReadCorruptError = 3840;         // Error parsing a property list
	inline static public var NSPropertyListReadUnknownVersionError = 3841;  // The version number in the property list is unknown
	inline static public var NSPropertyListReadStreamError = 3842;          // Stream error reading a property list
	inline static public var NSPropertyListWriteStreamError = 3851;         // Stream error writing a property list

	inline static public var NSPropertyListErrorMinimum = 3840;
	inline static public var NSPropertyListErrorMaximum = 4095;

	#if (osx_10_8 || ios_6_0)
	inline static public var NSXPCConnectionInterrupted = 4097;
	inline static public var NSXPCConnectionInvalid = 4099;
	inline static public var NSXPCConnectionReplyInvalid = 4101;
    
	inline static public var NSXPCConnectionErrorMinimum = 4096;
	inline static public var NSXPCConnectionErrorMaximum = 4224
	#end
}
