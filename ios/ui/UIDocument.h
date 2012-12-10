//
//  UIDocument.h
package ios.ui;
//
//  Copyright (c) 1997-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKitDefines.h>

typedef NS_ENUM(NSInteger, UIDocumentChangeKind) {
    UIDocumentChangeDone,
    UIDocumentChangeUndone,
    UIDocumentChangeRedone,
    UIDocumentChangeCleared
};

typedef NS_ENUM(NSInteger, UIDocumentSaveOperation) {
    UIDocumentSaveForCreating,
    UIDocumentSaveForOverwriting
};

typedef NS_OPTIONS(NSUInteger, UIDocumentState) {
    UIDocumentStateNormal          = 0,
    UIDocumentStateClosed          = 1 << 0, // The document has either not been successfully opened, or has been since closed. Document properties may not be valid.
    UIDocumentStateInConflict      = 1 << 1, // Conflicts exist for the document's fileURL. They can be accessed through +[NSFileVersion otherVersionsOfItemAtURL:].
    UIDocumentStateSavingError     = 1 << 2, // An error has occurred that prevents the document from saving.
    UIDocumentStateEditingDisabled = 1 << 3  // Set before calling -disableEditing. The document is is busy and it is not currently safe to allow user edits. -enableEditing will be called when it becomes safe to edit again.
};

UIKIT_EXTERN NSString *const UIDocumentStateChangedNotification NS_AVAILABLE_IOS(5_0);

@:require(ios_5_0) extern class UIDocument extends NSObject <NSFilePresenter> {

- (id)initWithFileURL:(NSURL *)url;

	public var  (default, null) : NSURL *fileURL;
	public var (default, null) NSString *localizedName;
	public var (default, null) NSString *fileType; 
	public var NSDate *fileModificationDate;
	public var  (default, null) : UIDocumentState documentState;
	public function openWithCompletionHandler:(void (^)(BOOL success))completionHandler;

	public function closeWithCompletionHandler:(void (^)(BOOL success))completionHandler;


- (BOOL)loadFromContents:(id)contents ofType:(NSString *)typeName error:(NSError **)outError;

- (id)contentsForType:(NSString *)typeName error:(NSError **)outError;


	public function disableEditing;
	public function enableEditing;

	public var NSUndoManager *undoManager;

	- (BOOL)hasUnsavedChanges;

	public function updateChangeCount:(UIDocumentChangeKind)change; 

	- (id)changeCountTokenForSaveOperation:(UIDocumentSaveOperation)saveOperation; 
	public function updateChangeCountWithToken:(id)changeCountToken forSaveOperation:(UIDocumentSaveOperation)saveOperation; 

	public function saveToURL:(NSURL *)url forSaveOperation:(UIDocumentSaveOperation)saveOperation completionHandler:(void (^)(BOOL success))completionHandler;

	public function autosaveWithCompletionHandler:(void (^)(BOOL success))completionHandler;

- (NSString *)savingFileType;
- (NSString *)fileNameExtensionForType:(NSString *)typeName saveOperation:(UIDocumentSaveOperation)saveOperation;
 - (BOOL)writeContents:(id)contents andAttributes:(NSDictionary *)additionalFileAttributes safelyToURL:(NSURL *)url forSaveOperation:(UIDocumentSaveOperation)saveOperation error:(NSError **)outError;

- (BOOL)writeContents:(id)contents toURL:(NSURL *)url forSaveOperation:(UIDocumentSaveOperation)saveOperation originalContentsURL:(NSURL *)originalContentsURL error:(NSError **)outError;

- (NSDictionary *)fileAttributesToWriteToURL:(NSURL *)url forSaveOperation:(UIDocumentSaveOperation)saveOperation error:(NSError **)outError;

- (BOOL)readFromURL:(NSURL *)url error:(NSError **)outError;

	public function performAsynchronousFileAccessUsingBlock:(void (^)(void))block;

	public function handleError:(NSError *)error userInteractionPermitted:(BOOL)userInteractionPermitted;

	public function finishedHandlingError:(NSError *)error recovered:(BOOL)recovered;

	public function userInteractionNoLongerPermittedForError:(NSError *)error;

	public function revertToContentsOfURL:(NSURL *)url completionHandler:(void (^)(BOOL success))completionHandler;

}
