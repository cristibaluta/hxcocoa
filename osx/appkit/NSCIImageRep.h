/*
        NSCIImageRep.h
        Application Kit
        Copyright (c) 2003-2011, Apple Inc.
        All rights reserved.
*/

#import <AppKit/NSImageRep.h>
#import <AppKit/NSGraphics.h>
#import <QuartzCore/CIImage.h>


@class NSBitmapImageRep;

extern class NSCIImageRep extends NSImageRep
{
    CIImage *_ciImage;
}
+ (id)imageRepWithCIImage:(CIImage *)image;
- (id)initWithCIImage:(CIImage *)image;
- (CIImage *)CIImage;
}

extern class CIImage (NSAppKitAdditions)
- (id)initWithBitmapImageRep:(NSBitmapImageRep *)bitmapImageRep;

- (void)drawInRect:(NSRect)rect fromRect:(NSRect)fromRect operation:(NSCompositingOperation)op fraction:(Float)delta;
- (void)drawAtPoint:(NSPoint)point fromRect:(NSRect)fromRect operation:(NSCompositingOperation)op fraction:(Float)delta;
}

