/*
 * Copyright (c) 2005, The haXe Project Contributors
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *   - Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *   - Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE HAXE PROJECT CONTRIBUTORS "AS IS" AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE HAXE PROJECT CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
 * DAMAGE.
 */
package ios;

typedef ALAssetsGroup = Dynamic;
typedef ALAsset = Dynamic;
import objc.location.CLLocation;
import ios.ui.UIAlertView;
import ios.ui.UIDevice;
import ios.ui.UIImageView;
 
class Lib {
	
	public static function log (v : Dynamic) : Void {}
	public static function print (v : Dynamic) : Void {
		untyped __objc__ ("printf ( [[v description] cStringUsingEncoding:NSStringEncodingConversionAllowLossy] )");
	}
	public static function println (v : Dynamic) : Void {
		Lib.print ( v );
		untyped __objc__ ("printf ( \"\\n\" )");
	}
	public static function getURL (url :String, ?target : String) : Bool {
		return untyped __objc__ ("AppDelegate applicationHandleOpenURL:UIApplication handleOpenURL:NSURL]");
	}
	public static function attach (name : String) :UIImageView {
		return untyped __objc__ ("[[UIImageView alloc] initWithImage:[UIImage imageNamed:@\"name\"]]");
	}
	public static function enumerateLibraryGroups () :Array<ALAssetsGroup> {
		//library = [[ALAssetsLibrary alloc] init];
		//[library enumerateGroupsWithTypes:ALAssetsGroupAlbum usingBlock:groupsEnumerator failureBlock:failHandler];
		return null;
	}
	public static function fetchCameraItemsInGroup (group:String) :Array<ALAsset> {
		return null;
	}
	public static function location () :CLLocation {
		return null;
	}
	public static function isIpad () :Bool {
		var deviceType:String = UIDevice.currentDevice().model;
		return deviceType == "iPad";
		return untyped __objc__("UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad");
	}
	public static function isIpod () :Bool {
		var deviceType:String = UIDevice.currentDevice().model;
		return deviceType == "iPod touch";
		return untyped __objc__("UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad");
	}
	public static function alert (title:String, message:String) :UIAlertView {
		var a = new UIAlertView().initWithTitle (title, message, null, "Cancel", null);
		a.show();
		return a;
	}
}
