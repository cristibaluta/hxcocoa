/*
 * Copyright (C) 2004, 2005, 2006, 2007, 2008, 2009 Apple Inc. All rights reserved.
 * Copyright (C) 2006 Samuel Weinig <sam.weinig@gmail.com>
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY APPLE COMPUTER, INC. ``AS IS'' AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL APPLE COMPUTER, INC. OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 * OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. 
 */

#import <WebKit/DOMUIEvent.h>

#if WEBKIT_VERSION_MAX_ALLOWED >= WEBKIT_VERSION_1_3

@class DOMAbstractView;
@class DOMNode;
@class NSString;
@protocol DOMEventTarget;

extern class DOMMouseEvent extends DOMUIEvent
	public var  (default, null) extends int screenX;
	public var  (default, null) extends int screenY;
	public var  (default, null) extends int clientX;
	public var  (default, null) extends int clientY;
	public var  (default, null) extends BOOL ctrlKey;
	public var  (default, null) extends BOOL shiftKey;
	public var  (default, null) extends BOOL altKey;
	public var  (default, null) extends BOOL metaKey;
	public var  (default, null) extends unsigned short button;
	public var (default, null) id <DOMEventTarget> relatedTarget;
	public var  (default, null) extends int offsetX AVAILABLE_WEBKIT_VERSION_3_0_AND_LATER;
	public var  (default, null) extends int offsetY AVAILABLE_WEBKIT_VERSION_3_0_AND_LATER;
	public var  (default, null) extends int x AVAILABLE_WEBKIT_VERSION_3_0_AND_LATER;
	public var  (default, null) extends int y AVAILABLE_WEBKIT_VERSION_3_0_AND_LATER;
	public var (default, null) DOMNode *fromElement AVAILABLE_WEBKIT_VERSION_3_0_AND_LATER;
	public var (default, null) DOMNode *toElement AVAILABLE_WEBKIT_VERSION_3_0_AND_LATER;

- (void)initMouseEvent:(NSString *)type canBubble:(BOOL)canBubble cancelable:(BOOL)cancelable view:(DOMAbstractView *)view detail:(int)detail screenX:(int)screenX screenY:(int)screenY clientX:(int)clientX clientY:(int)clientY ctrlKey:(BOOL)ctrlKey altKey:(BOOL)altKey shiftKey:(BOOL)shiftKey metaKey:(BOOL)metaKey button:(unsigned short)button relatedTarget:(id <DOMEventTarget>)relatedTarget AVAILABLE_WEBKIT_VERSION_3_0_AND_LATER;
}

extern class DOMMouseEvent (DOMMouseEventDeprecated)
- (void)initMouseEvent:(NSString *)type :(BOOL)canBubble :(BOOL)cancelable :(DOMAbstractView *)view :(int)detail :(int)screenX :(int)screenY :(int)clientX :(int)clientY :(BOOL)ctrlKey :(BOOL)altKey :(BOOL)shiftKey :(BOOL)metaKey :(unsigned short)button :(id <DOMEventTarget>)relatedTarget AVAILABLE_WEBKIT_VERSION_1_3_AND_LATER_BUT_DEPRECATED_IN_WEBKIT_VERSION_3_0;
}

#endif
