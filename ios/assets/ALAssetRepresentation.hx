//
//  ALAssetRepresentation.h
//  AssetsLibrary
//
//  Copyright 2010 Apple Inc. All rights reserved.
//
/*
 *
 * An ALAssetRepresentation encapsulates one of the representations of a given ALAsset.
 * For example: in the case of a camera shooting RAW + JPEG, the resulting asset will have two representations,
 *              one for the RAW file and one for the JPEG file.
 *
 */
package ios.assets;

import ios.assets.ALAssetsLibrary;
import objc.foundation.NSObject;
import objc.foundation.NSURL;
import objc.foundation.NSDictionary;
import objc.graphics.CGGeometry;
import objc.graphics.CGImage;

@:framework("AssetsLibrary")
extern class ALAssetRepresentation extends NSObject {

// Returns the representation's UTI.
public function UTI () :String;

// Returns the dimensions of this representation.  If the representation does not have valid dimensions, this method will return CGSizeZero.
public function dimensions () :CGSize;

// Returns the size of the file for this representation. Callers can use this to allocate buffers of the right size for -getBytes:fromOffset:length:error:
public function size () :Int;

// Copies the specified range of bytes into the buffer given by the caller.
// The method returns the number of bytes actually written to the buffer. The number of bytes read will be 
// less than the requested range if the range exceeds the file's size.
// If an error occurs, the method returns 0 and upon return contains an NSError object that describes the problem. Pass NULL if you do not want error information.
//public function getBytes (buffer:Int, fromOffset:Int, length:Int, error:NSError) :Int;

// This is a convenience method for -[ALAssetRepresentation CGImageWithOptions:] where options is nil.
public function fullResolutionImage () :CGImageRef;

// This is a convenience method that returns a full resolution CGImage of the representation. It takes a dictionary
// of options as described for CGImageSourceCreateWithData() or CGImageSourceCreateWithURL()
public function CGImageWithOptions (options:NSDictionary) :CGImageRef;

// Returns a CGImage of the representation that is appropriate for displaying full screen.
// The dimensions of this image will be dependent on the hardware that the application is running on and does not mean it will match the dimensions of the screen.
public function fullScreenImage () :CGImageRef;

// Returns a persistent URL uniquely identifying the representation
public function url () :NSURL;

// Returns a dictionary of dictionaries of metadata for the representation.
// If the representation is one that the system cannot interpret, nil is returned.
public function metadata () :NSDictionary;

// Returns the representation's orientation as defined in ALAssetOrientation.
public function orientation () :ALAssetOrientation;

// Returns the representation's scale.
public function scale () :Float;

// Returns a string representing the filename of the representation on disk.  
// For representations synced from iTunes, this will be the filename of the represenation on the host.
@:require(ios5) public function filename () :String;

}
