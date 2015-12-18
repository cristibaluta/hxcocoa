package objc.av;

typedef AVBase = objc.foundation.AVBase;

typedef AVAudioPlayer = objc.foundation.AVAudioPlayer;
typedef AVAudioRecorder = objc.foundation.AVAudioRecorder;
#if TARGET_OS_IPHONE
typedef AVAudioSession = objc.foundation.AVAudioSession;
#endif
typedef AVAudioSettings = objc.foundation.AVAudioSettings;

typedef AVAnimation = objc.foundation.AVAnimation;
typedef AVAsset = objc.foundation.AVAsset;
typedef AVAssetExportSession = objc.foundation.AVAssetExportSession;
typedef AVAssetImageGenerator = objc.foundation.AVAssetImageGenerator;
typedef AVAssetReader = objc.foundation.AVAssetReader;
typedef AVAssetReaderOutput = objc.foundation.AVAssetReaderOutput;
typedef AVAssetResourceLoader = objc.foundation.AVAssetResourceLoader;
typedef AVAssetTrack = objc.foundation.AVAssetTrack;
typedef AVAssetTrackSegment = objc.foundation.AVAssetTrackSegment;
typedef AVAssetWriter = objc.foundation.AVAssetWriter;
typedef AVAssetWriterInput = objc.foundation.AVAssetWriterInput;
typedef AVAsynchronousKeyValueLoading = objc.foundation.AVAsynchronousKeyValueLoading;
typedef AVAudioMix = objc.foundation.AVAudioMix;

#if (TARGET_OS_IPHONE || defined(__MAC_10_7))
typedef AVCaptureDevice = objc.foundation.AVCaptureDevice;
typedef AVCaptureInput = objc.foundation.AVCaptureInput;
typedef AVCaptureOutput = objc.foundation.AVCaptureOutput;
typedef AVCaptureSession = objc.foundation.AVCaptureSession;
typedef AVCaptureVideoPreviewLayer = objc.foundation.AVCaptureVideoPreviewLayer;
#endif

typedef AVComposition = objc.foundation.AVComposition;
typedef AVCompositionTrack = objc.foundation.AVCompositionTrack;
typedef AVCompositionTrackSegment = objc.foundation.AVCompositionTrackSegment;
typedef AVError = objc.foundation.AVError;
typedef AVMediaFormat = objc.foundation.AVMediaFormat;
typedef AVMediaSelectionGroup = objc.foundation.AVMediaSelectionGroup;
typedef AVMetadataFormat = objc.foundation.AVMetadataFormat;
typedef AVMetadataItem = objc.foundation.AVMetadataItem;
#if TARGET_OS_IPHONE
typedef AVMetadataObject = objc.foundation.AVMetadataObject;
#endif
typedef AVPlayer = objc.foundation.AVPlayer;
typedef AVPlayerItem = objc.foundation.AVPlayerItem;
typedef AVPlayerItemOutput = objc.foundation.AVPlayerItemOutput;
#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))
typedef AVPlayerItemProtectedContentAdditions = objc.foundation.AVPlayerItemProtectedContentAdditions;
#endif
typedef AVPlayerItemTrack = objc.foundation.AVPlayerItemTrack;
typedef AVPlayerLayer = objc.foundation.AVPlayerLayer;
#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))
typedef AVSampleBufferDisplayLayer = objc.foundation.AVSampleBufferDisplayLayer;
#endif
typedef AVSynchronizedLayer = objc.foundation.AVSynchronizedLayer;
typedef AVTextStyleRule = objc.foundation.AVTextStyleRule;
typedef AVTime = objc.foundation.AVTime;
typedef AVTimedMetadataGroup = objc.foundation.AVTimedMetadataGroup;
typedef AVUtilities = objc.foundation.AVUtilities;
typedef AVVideoComposition = objc.foundation.AVVideoComposition;
typedef AVVideoSettings = objc.foundation.AVVideoSettings;
