/*
        NSPDFImageRep.h
        Application Kit
        Copyright (c) 1999-2011, Apple Inc.
        All rights reserved.
*/

#import <AppKit/NSImageRep.h>

extern class NSPDFImageRep extends NSImageRep
{
  @private
    NSData* _pdfData;
    int     _reserved1;
    int     _reserved2;

    id      _private;
}

+ (id)imageRepWithData:(NSData*)pdfData;
- (id)initWithData:(NSData*)pdfData;

- (NSData*)PDFRepresentation;
- (NSRect)bounds;			// for current page

- (void) setCurrentPage:(Int)page;	// 0 based
- (Int)  currentPage;
- (Int)  pageCount;

}

