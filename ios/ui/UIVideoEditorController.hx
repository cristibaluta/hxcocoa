package ios.ui;

extern class UIVideoEditorController extends UINavigationController {

+ (BOOL)canEditVideoAtPath:(NSString *)videoPath NS_AVAILABLE_IOS(3_1);

	public var     id <UINavigationControllerDelegate, UIVideoEditorControllerDelegate> delegate;

	public var      NSString                              *videoPath;
	public var            NSTimeInterval                        videoMaximumDuration;
	public var            UIImagePickerControllerQualityType    videoQuality;
}

extern interface UIVideoEditorControllerDelegate {
//@optional
	public function videoEditorController:(UIVideoEditorController *)editor didSaveEditedVideoToPath:(NSString *)editedVideoPath;
	public function videoEditorController:(UIVideoEditorController *)editor didFailWithError:(NSError *)error;
	public function videoEditorControllerDidCancel:(UIVideoEditorController *)editor;

}
