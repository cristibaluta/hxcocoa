//
//  UIPrintInteractionController.h
package ios.ui;
//
//  Copyright 2010-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIApplication.h>
#import <UIKit/UIKitDefines.h>

@class UIPrintInteractionController, UIPrintInfo, UIPrintPaper, UIPrintPageRenderer, UIPrintFormatter;
@class UIView, UIBarButtonItem;

typedef void (^UIPrintInteractionCompletionHandler)(UIPrintInteractionController *printInteractionController, BOOL completed, NSError *error);

extern interface UIPrintInteractionControllerDelegate;

NS_CLASS_AVAILABLE_IOS(4_2)extern class UIPrintInteractionController extends NSObject {
  @private
    UIPrintInfo                             *_printInfo;
    id<UIPrintInteractionControllerDelegate> _delegate;
    BOOL                                     _showsPageRange;
    UIPrintPageRenderer                     *_printPageRenderer;
    UIPrintFormatter                        *_printFormatter;
    id                                       _printingItem;
    NSArray                                 *_printingItems;
    UIPrintPaper                            *_printPaper;
    UIPrintInteractionCompletionHandler      _completionHandler;
    UIBackgroundTaskIdentifier               _backgroundTaskIdentifier;
    id                                       _printState;
}

+ (BOOL)isPrintingAvailable;                    // return YES if system supports printing. use this to hide HI for unsupported devices.

+ (NSSet *)printableUTIs;                       // return set of all document UTI types we can print
+ (BOOL)canPrintURL:(NSURL *)url;
+ (BOOL)canPrintData:(NSData *)data;

+ (UIPrintInteractionController *)sharedPrintController;

	public var (nonatomic,retain) UIPrintInfo                             *printInfo;      // changes to printInfo ignored while printing. default is nil
	public var  id<UIPrintInteractionControllerDelegate> delegate;       // not retained. default is nil
	public var         BOOL                                     showsPageRange; // default is NO.

	public var (default, null) UIPrintPaper *printPaper;  // set after printer selection

	public var (nonatomic,retain) UIPrintPageRenderer *printPageRenderer;  // calls class to render each page
	public var (nonatomic,retain) UIPrintFormatter    *printFormatter;     // uses a single formatter to fill the pages
public var    id                   printingItem;       // single NSData, NSURL, UIImage, ALAsset
public var    NSArray             *printingItems;      // array of NSData, NSURL, UIImage, ALAsset. does not support page range

- (BOOL)presentAnimated:(BOOL)animated completionHandler:(UIPrintInteractionCompletionHandler)completion;                                                // iPhone
- (BOOL)presentFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated completionHandler:(UIPrintInteractionCompletionHandler)completion;    // iPad
- (BOOL)presentFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated completionHandler:(UIPrintInteractionCompletionHandler)completion;      // iPad

	public function dismissAnimated:(BOOL)animated;

}

extern interface UIPrintInteractionControllerDelegate <NSObject>
@optional

- (UIViewController *)printInteractionControllerParentViewController:(UIPrintInteractionController *)printInteractionController;

- (UIPrintPaper *)printInteractionController:(UIPrintInteractionController *)printInteractionController choosePaper:(NSArray *)paperList;

	public function printInteractionControllerWillPresentPrinterOptions:(UIPrintInteractionController *)printInteractionController;
	public function printInteractionControllerDidPresentPrinterOptions:(UIPrintInteractionController *)printInteractionController;
	public function printInteractionControllerWillDismissPrinterOptions:(UIPrintInteractionController *)printInteractionController;
	public function printInteractionControllerDidDismissPrinterOptions:(UIPrintInteractionController *)printInteractionController;

	public function printInteractionControllerWillStartJob:(UIPrintInteractionController *)printInteractionController;
	public function printInteractionControllerDidFinishJob:(UIPrintInteractionController *)printInteractionController;

}
