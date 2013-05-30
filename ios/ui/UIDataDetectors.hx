//
//  UIDataDetectors.h
package ios.ui;

@:framework("UIKit")
extern enum UIDataDetectorTypes {
    UIDataDetectorTypePhoneNumber;          // Phone number detection
    UIDataDetectorTypeLink;          // URL detection
    UIDataDetectorTypeAddress;          // Street address detection
    UIDataDetectorTypeCalendarEvent;          // Event detection
    UIDataDetectorTypeNone;               // No detection at all
    UIDataDetectorTypeAll;    // All types
}
