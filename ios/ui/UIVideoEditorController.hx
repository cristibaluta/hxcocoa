package ios.ui;

@:framework("UIKit")
extern class UIVideoEditorController extends UINavigationController {

+ (BOOL)canEditVideoAtPath:(String *)videoPath NS_AVAILABLE_IOS(3_1);

	public var     id <UINavigationControllerDelegate, UIVideoEditorControllerDelegate> delegate;

	public var      String                              *videoPath;
	public var            NSTimeInterval                        videoMaximumDuration;
	public var            UIImagePickerControllerQualityType    videoQuality;
}

@:framework("UIKit")
extern interface UIVideoEditorControllerDelegate {
//@optional
	public function videoEditorController:(UIVideoEditorController *)editor didSaveEditedVideoToPath:(String *)editedVideoPath;
	public function videoEditorController:(UIVideoEditorController *)editor didFailWithError:(NSError *)error;
	public function videoEditorControllerDidCancel:(UIVideoEditorController *)editor;

}
