//
//  UIPrintInfo.h
package ios.ui;
//
//  Copyright 2010-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKitDefines.h>

typedef NS_ENUM(Int, UIPrintInfoOutputType) {
    UIPrintInfoOutputGeneral,     // B&W or color, normal quality output for mixed text, graphics, and images
    UIPrintInfoOutputPhoto,       // B&W or color, best quality output for images
    UIPrintInfoOutputGrayscale,   // B&W content only
};

typedef NS_ENUM(Int, UIPrintInfoOrientation) {
    UIPrintInfoOrientationPortrait,
    UIPrintInfoOrientationLandscape,
};

typedef NS_ENUM(Int, UIPrintInfoDuplex) {
    UIPrintInfoDuplexNone,
    UIPrintInfoDuplexLongEdge,       // flip back page along long edge (same orientation in portrait, flipped for landscape)
    UIPrintInfoDuplexShortEdge,      // flip back page along short edge (flipped orientation for portrait, same in landscape)
};

@:require(4_2)extern class UIPrintInfo extends NSObject, implements NSCopying, NSCoding> { 
  @private
    String                *_printerID;
    String                *_jobName;
    UIPrintInfoOutputType    _outputType;
    UIPrintInfoOrientation   _orientation;
    UIPrintInfoDuplex        _duplex;
    NSInteger                _copies;
    BOOL                     _scaleUp;
}

+ (UIPrintInfo *)printInfo;
+ (UIPrintInfo *)printInfoWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)dictionaryRepresentation;

public var      String                *printerID;         // default is nil. set after user selects printer
public var      String                *jobName;           // default is application name
	public var           UIPrintInfoOutputType    outputType;        // default is UIPrintInfoOutputGeneral
	public var           UIPrintInfoOrientation   orientation;       // default is UIPrintInfoOrientationPortrait
	public var           UIPrintInfoDuplex        duplex;            // default is based on document type (none for photo, long edge for other)

}
