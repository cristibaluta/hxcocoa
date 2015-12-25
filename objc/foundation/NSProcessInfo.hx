/*	NSProcessInfo.h
	Copyright (c) 1994-2012, Apple Inc. All rights reserved.
*/

package objc.foundation;
import objc.foundation.NSObject;
import objc.foundation.NSDictionary;

@:framework("Foundation")
extern enum NSOperatingSystem {	/* Constants returned by -operatingSystem */
	NSWindowsNTOperatingSystem;
	NSWindows95OperatingSystem;
	NSSolarisOperatingSystem;
	NSHPUXOperatingSystem;
	NSMACHOperatingSystem;
	NSSunOSOperatingSystem;
	NSOSF1OperatingSystem;
}

@:framework("Foundation")
extern class NSProcessInfo extends NSObject {

	public static function processInfo() : NSProcessInfo;
	public function environment() : NSDictionary;
	public function arguments() : Array<String>;
	public function hostName() : String;
	public function processName() : String;
	public function processIdentifier() : Int;
	public function setProcessName(newName:String) : Void;
	public function globallyUniqueString() : String;
	public function operatingSystem() : Int;
	public function operatingSystemName() : String;
	public function operatingSystemVersionString() : String;
	/* Human readable, localized; appropriate for displaying to user or using in bug emails and such; NOT appropriate for parsing */
	public function processorCount() : Int;
	public function activeProcessorCount() : Int;
	public function physicalMemory() : Int;
	public function systemUptime() : Float;

	/* Disable or reenable the ability to be quickly killed. The default implementations of these methods increment or decrement, respectively, a counter whose value is 1 when the process is first created. When the counter's value is 0 the application is considered to be safely killable and may be killed by the operating system without any notification or event being sent to the process first. If an application's Info.plist has an NSSupportsSuddenTermination entry whose value is true then NSApplication invokes -enableSuddenTermination automatically during application launch, which typically renders the process killable right away. You can also manually invoke -enableSuddenTermination right away in, for example, agents or daemons that don't depend on AppKit. After that, you can invoke these methods whenever the process has work it must do before it terminates. For example:
	 - NSUserDefaults uses these to prevent process killing between the time at which a default has been set and the time at which the preferences file including that default has been written to disk.
	 - NSDocument uses these to prevent process killing between the time at which the user has made a change to a document and the time at which the user's change has been written to disk.
	 - You can use these whenever your application defers work that must be done before the application terminates. If for example your application ever defers writing something to disk, and it has an NSSupportsSuddenTermination entry in its Info.plist so as not to contribute to user-visible delays at logout or shutdown time, it must invoke -disableSuddenTermination when the writing is first deferred and -enableSuddenTermination after the writing is actually done.
	*/
	public function disableSuddenTermination() : Void;
	public function enableSuddenTermination() : Void;

	/*
	 * Increment or decrement the counter tracking the number of automatic quit opt-out requests. When this counter is greater than zero, the app will be considered 'active' and ineligible for automatic termination.
	 * An example of using this would be disabling autoquitting when the user of an instant messaging application signs on, due to it requiring a background connection to be maintained even if the app is otherwise inactive.
	 * Each pair of calls should have a matching "reason" argument, which can be used to easily track why an application is or is not automatically terminable.
	 * A given reason can be used more than once at the same time (for example: two files are transferring over the network, each one disables automatic termination with the reason @"file transfer in progress")
	 */
	public function disableAutomaticTermination(reason:String) : Void;
	public function enableAutomaticTermination(reason:String) : Void;

	/*
	 * Marks the calling app as supporting automatic termination. Without calling this or setting the equivalent Info.plist key (NSSupportsAutomaticTermination), the above methods (disableAutomaticTermination:/enableAutomaticTermination:) have no effect, 
	 * although the counter tracking automatic termination opt-outs is still kept up to date to ensure correctness if this is called later. Currently, passing NO has no effect.
	 * This should be called during -applicationDidFinishLaunching or earlier.
	 */
	public function setAutomaticTerminationSupportEnabled(flag:Bool) : Void;
	public function automaticTerminationSupportEnabled() : Bool;
}
