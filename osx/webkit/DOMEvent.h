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

#import <WebKit/DOMObject.h>

#if WEBKIT_VERSION_MAX_ALLOWED >= WEBKIT_VERSION_1_3

@class NSString;
@protocol DOMEventTarget;

enum {
    DOM_NONE = 0,
    DOM_CAPTURING_PHASE = 1,
    DOM_AT_TARGET = 2,
    DOM_BUBBLING_PHASE = 3
};

extern class DOMEvent extends DOMObject
	public var (default, null) NSString *type;
	public var (default, null) id <DOMEventTarget> target;
	public var (default, null) id <DOMEventTarget> currentTarget;
	public var  (default, null) extends unsigned short eventPhase;
	public var  (default, null) extends BOOL bubbles;
	public var  (default, null) extends BOOL cancelable;
	public var  (default, null) extends DOMTimeStamp timeStamp;
	public var (default, null) id <DOMEventTarget> srcElement AVAILABLE_IN_WEBKIT_VERSION_4_0;
	public var  BOOL returnValue AVAILABLE_IN_WEBKIT_VERSION_4_0;
	public var  BOOL cancelBubble AVAILABLE_IN_WEBKIT_VERSION_4_0;

- (void)stopPropagation;
- (void)preventDefault;
- (void)initEvent:(NSString *)eventTypeArg canBubbleArg:(BOOL)canBubbleArg cancelableArg:(BOOL)cancelableArg AVAILABLE_WEBKIT_VERSION_3_0_AND_LATER;
}

extern class DOMEvent (DOMEventDeprecated)
- (void)initEvent:(NSString *)eventTypeArg :(BOOL)canBubbleArg :(BOOL)cancelableArg AVAILABLE_WEBKIT_VERSION_1_3_AND_LATER_BUT_DEPRECATED_IN_WEBKIT_VERSION_3_0;
}

#endif
