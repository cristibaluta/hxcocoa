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

#import <WebKit/DOMNode.h>

#if WEBKIT_VERSION_MAX_ALLOWED >= WEBKIT_VERSION_1_3

@class DOMAttr;
@class DOMCSSStyleDeclaration;
@class DOMElement;
@class DOMNodeList;
@class NSString;

enum {
    DOM_ALLOW_KEYBOARD_INPUT = 1
};

extern class DOMElement extends DOMNode
	public var (default, null) NSString *tagName;
	public var (default, null) DOMCSSStyleDeclaration *style;
	public var  (default, null) extends int offsetLeft;
	public var  (default, null) extends int offsetTop;
	public var  (default, null) extends int offsetWidth;
	public var  (default, null) extends int offsetHeight;
	public var (default, null) DOMElement *offsetParent;
	public var  (default, null) extends int clientLeft AVAILABLE_WEBKIT_VERSION_3_0_AND_LATER;
	public var  (default, null) extends int clientTop AVAILABLE_WEBKIT_VERSION_3_0_AND_LATER;
	public var  (default, null) extends int clientWidth;
	public var  (default, null) extends int clientHeight;
	public var  int scrollLeft;
	public var  int scrollTop;
	public var  (default, null) extends int scrollWidth;
	public var  (default, null) extends int scrollHeight;
	public var (default, null) DOMElement *firstElementChild AVAILABLE_IN_WEBKIT_VERSION_4_0;
	public var (default, null) DOMElement *lastElementChild AVAILABLE_IN_WEBKIT_VERSION_4_0;
	public var (default, null) DOMElement *previousElementSibling AVAILABLE_IN_WEBKIT_VERSION_4_0;
	public var (default, null) DOMElement *nextElementSibling AVAILABLE_IN_WEBKIT_VERSION_4_0;
	public var  (default, null) extends unsigned childElementCount AVAILABLE_IN_WEBKIT_VERSION_4_0;
	public var (default, null) NSString *innerText AVAILABLE_WEBKIT_VERSION_3_0_AND_LATER;

- (NSString *)getAttribute:(NSString *)name;
- (void)setAttribute:(NSString *)name value:(NSString *)value AVAILABLE_WEBKIT_VERSION_3_0_AND_LATER;
- (void)removeAttribute:(NSString *)name;
- (DOMAttr *)getAttributeNode:(NSString *)name;
- (DOMAttr *)setAttributeNode:(DOMAttr *)newAttr;
- (DOMAttr *)removeAttributeNode:(DOMAttr *)oldAttr;
- (DOMNodeList *)getElementsByTagName:(NSString *)name;
- (NSString *)getAttributeNS:(NSString *)namespaceURI localName:(NSString *)localName AVAILABLE_WEBKIT_VERSION_3_0_AND_LATER;
- (void)setAttributeNS:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName value:(NSString *)value AVAILABLE_WEBKIT_VERSION_3_0_AND_LATER;
- (void)removeAttributeNS:(NSString *)namespaceURI localName:(NSString *)localName AVAILABLE_WEBKIT_VERSION_3_0_AND_LATER;
- (DOMNodeList *)getElementsByTagNameNS:(NSString *)namespaceURI localName:(NSString *)localName AVAILABLE_WEBKIT_VERSION_3_0_AND_LATER;
- (DOMAttr *)getAttributeNodeNS:(NSString *)namespaceURI localName:(NSString *)localName AVAILABLE_WEBKIT_VERSION_3_0_AND_LATER;
- (DOMAttr *)setAttributeNodeNS:(DOMAttr *)newAttr;
- (BOOL)hasAttribute:(NSString *)name;
- (BOOL)hasAttributeNS:(NSString *)namespaceURI localName:(NSString *)localName AVAILABLE_WEBKIT_VERSION_3_0_AND_LATER;
- (void)focus AVAILABLE_IN_WEBKIT_VERSION_4_0;
- (void)blur AVAILABLE_IN_WEBKIT_VERSION_4_0;
- (void)scrollIntoView:(BOOL)alignWithTop AVAILABLE_WEBKIT_VERSION_3_0_AND_LATER;
- (void)scrollIntoViewIfNeeded:(BOOL)centerIfNeeded AVAILABLE_WEBKIT_VERSION_3_0_AND_LATER;
- (void)scrollByLines:(int)lines AVAILABLE_WEBKIT_VERSION_3_0_AND_LATER;
- (void)scrollByPages:(int)pages AVAILABLE_WEBKIT_VERSION_3_0_AND_LATER;
- (DOMNodeList *)getElementsByClassName:(NSString *)name AVAILABLE_IN_WEBKIT_VERSION_4_0;
- (DOMElement *)querySelector:(NSString *)selectors AVAILABLE_IN_WEBKIT_VERSION_4_0;
- (DOMNodeList *)querySelectorAll:(NSString *)selectors AVAILABLE_IN_WEBKIT_VERSION_4_0;
- (void)webkitRequestFullScreen:(unsigned short)flags AVAILABLE_IN_WEBKIT_VERSION_4_0;
}

extern class DOMElement (DOMElementDeprecated)
- (void)setAttribute:(NSString *)name :(NSString *)value AVAILABLE_WEBKIT_VERSION_1_3_AND_LATER_BUT_DEPRECATED_IN_WEBKIT_VERSION_3_0;
- (NSString *)getAttributeNS:(NSString *)namespaceURI :(NSString *)localName AVAILABLE_WEBKIT_VERSION_1_3_AND_LATER_BUT_DEPRECATED_IN_WEBKIT_VERSION_3_0;
- (void)setAttributeNS:(NSString *)namespaceURI :(NSString *)qualifiedName :(NSString *)value AVAILABLE_WEBKIT_VERSION_1_3_AND_LATER_BUT_DEPRECATED_IN_WEBKIT_VERSION_3_0;
- (void)removeAttributeNS:(NSString *)namespaceURI :(NSString *)localName AVAILABLE_WEBKIT_VERSION_1_3_AND_LATER_BUT_DEPRECATED_IN_WEBKIT_VERSION_3_0;
- (DOMNodeList *)getElementsByTagNameNS:(NSString *)namespaceURI :(NSString *)localName AVAILABLE_WEBKIT_VERSION_1_3_AND_LATER_BUT_DEPRECATED_IN_WEBKIT_VERSION_3_0;
- (DOMAttr *)getAttributeNodeNS:(NSString *)namespaceURI :(NSString *)localName AVAILABLE_WEBKIT_VERSION_1_3_AND_LATER_BUT_DEPRECATED_IN_WEBKIT_VERSION_3_0;
- (BOOL)hasAttributeNS:(NSString *)namespaceURI :(NSString *)localName AVAILABLE_WEBKIT_VERSION_1_3_AND_LATER_BUT_DEPRECATED_IN_WEBKIT_VERSION_3_0;
}

#endif
