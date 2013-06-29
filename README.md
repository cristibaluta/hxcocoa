## Overview

This haxelib contains the Cocoa and CocoaTouch frameworks externs.
It should be used with the hxobjc target of the Haxe language.

## Packages

 1. Cocoa related frameworks are in the osx package

 2. CocoaTouch related frameworks are in the ios package

 3. objc contains the Foundation framework and other frameworks that are compatible with ios and osx

 4. SupportingFiles contains default icons and launch images but this is the place to put all your resources like pngs. You can specify a custom SupportingFiles folder in the compiler with 
	
	-supporting-files <path>


## Install

Zip the local copy then run:

	haxelib local hxcocoa.zip

To keep in sync with git you can set the dev to your git copy:

	haxelib dev hxcocoa <path>
