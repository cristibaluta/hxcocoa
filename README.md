## Overview

This haxe library will contain almost all the Cocoa and CocoaTouch frameworks.
It should be used with the hxobjc target of the Haxe language

## Packages

: Cocoa related frameworks are in the osx package

: CocoaTouch related frameworks are in the ios package

: objc contains the Foundation framework and other frameworks that are compatible with ios and osx

: SupportingFiles contains some default icons and launch images. You can specify a custom SupportingFiles folder in the compiler with 
	
	-supporting-files <path>


## Install

This lib will not be on haxelib till the hxobjc will be in the official compiler. To install you need to download it from github. Once you've done that zip it, then run:

	haxelib test hxcocoa.zip
