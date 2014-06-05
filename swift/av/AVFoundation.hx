package swift.av;

typedef AVBase = swift.foundation.AVBase;

typedef AVAudioPlayer = swift.foundation.AVAudioPlayer;
typedef AVAudioRecorder = swift.foundation.AVAudioRecorder;
#if TARGET_OS_IPHONE
typedef AVAudioSession = swift.foundation.AVAudioSession;
#endif
typedef AVAudioSettings = swift.foundation.AVAudioSettings;

typedef AVAnimation = swift.foundation.AVAnimation;
typedef AVAsset = swift.foundation.AVAsset;
typedef AVAssetExportSession = swift.foundation.AVAssetExportSession;
typedef AVAssetImageGenerator = swift.foundation.AVAssetImageGenerator;
typedef AVAssetReader = swift.foundation.AVAssetReader;
typedef AVAssetReaderOutput = swift.foundation.AVAssetReaderOutput;
typedef AVAssetResourceLoader = swift.foundation.AVAssetResourceLoader;
typedef AVAssetTrack = swift.foundation.AVAssetTrack;
typedef AVAssetTrackSegment = swift.foundation.AVAssetTrackSegment;
typedef AVAssetWriter = swift.foundation.AVAssetWriter;
typedef AVAssetWriterInput = swift.foundation.AVAssetWriterInput;
typedef AVAsynchronousKeyValueLoading = swift.foundation.AVAsynchronousKeyValueLoading;
typedef AVAudioMix = swift.foundation.AVAudioMix;

#if (TARGET_OS_IPHONE || defined(__MAC_10_7))
typedef AVCaptureDevice = swift.foundation.AVCaptureDevice;
typedef AVCaptureInput = swift.foundation.AVCaptureInput;
typedef AVCaptureOutput = swift.foundation.AVCaptureOutput;
typedef AVCaptureSession = swift.foundation.AVCaptureSession;
typedef AVCaptureVideoPreviewLayer = swift.foundation.AVCaptureVideoPreviewLayer;
#endif

typedef AVComposition = swift.foundation.AVComposition;
typedef AVCompositionTrack = swift.foundation.AVCompositionTrack;
typedef AVCompositionTrackSegment = swift.foundation.AVCompositionTrackSegment;
typedef AVError = swift.foundation.AVError;
typedef AVMediaFormat = swift.foundation.AVMediaFormat;
typedef AVMediaSelectionGroup = swift.foundation.AVMediaSelectionGroup;
typedef AVMetadataFormat = swift.foundation.AVMetadataFormat;
typedef AVMetadataItem = swift.foundation.AVMetadataItem;
#if TARGET_OS_IPHONE
typedef AVMetadataObject = swift.foundation.AVMetadataObject;
#endif
typedef AVPlayer = swift.foundation.AVPlayer;
typedef AVPlayerItem = swift.foundation.AVPlayerItem;
typedef AVPlayerItemOutput = swift.foundation.AVPlayerItemOutput;
#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))
typedef AVPlayerItemProtectedContentAdditions = swift.foundation.AVPlayerItemProtectedContentAdditions;
#endif
typedef AVPlayerItemTrack = swift.foundation.AVPlayerItemTrack;
typedef AVPlayerLayer = swift.foundation.AVPlayerLayer;
#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))
typedef AVSampleBufferDisplayLayer = swift.foundation.AVSampleBufferDisplayLayer;
#endif
typedef AVSynchronizedLayer = swift.foundation.AVSynchronizedLayer;
typedef AVTextStyleRule = swift.foundation.AVTextStyleRule;
typedef AVTime = swift.foundation.AVTime;
typedef AVTimedMetadataGroup = swift.foundation.AVTimedMetadataGroup;
typedef AVUtilities = swift.foundation.AVUtilities;
typedef AVVideoComposition = swift.foundation.AVVideoComposition;
typedef AVVideoSettings = swift.foundation.AVVideoSettings;
